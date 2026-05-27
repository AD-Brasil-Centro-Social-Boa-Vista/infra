# Secrets — ACDG-BV

> Este diretório é **gitignored** (`secrets/*` no `.gitignore`). Apenas este `README.md` entra no repositório. Nenhum arquivo de secret real deve ser commitado em nenhuma circunstância.

---

## 1. Meta-secrets de Bootstrap (`/etc/acdg-secrets/`)

Antes de subir qualquer serviço, o operador deve provisionar manualmente **4 meta-secrets** diretamente no sistema de arquivos do host, fora do git e fora do Docker. Esses secrets são o "kit de chaves-mestre" que permitem ao Infisical e ao Vaultwarden subirem e se auto-configurarem — após isso, todos os demais secrets migram para dentro do Infisical (ADR-011).

```
/etc/acdg-secrets/           ← chmod 700, owner root
  infisical_db_password      ← senha do banco do Infisical
  infisical_encryption_key   ← chave de criptografia interna do Infisical
  infisical_auth_secret      ← JWT secret do Infisical
  vaultwarden_admin_token    ← token de admin do Vaultwarden
```

Todos os arquivos devem ter permissão `600` e dono `root`:

```bash
sudo mkdir -p /etc/acdg-secrets
sudo chmod 700 /etc/acdg-secrets

# Exemplo de criação segura:
openssl rand -hex 32 | sudo tee /etc/acdg-secrets/infisical_encryption_key
sudo chmod 600 /etc/acdg-secrets/infisical_encryption_key
```

O Docker Compose lê esses arquivos via `secrets: file:` — eles nunca são passados como variáveis de ambiente nem aparecem em `docker inspect`.

---

## 2. Lista Completa de Secrets do Compose

O stack ACDG-BV espera os seguintes arquivos de secret. Todos devem existir em `/etc/acdg-secrets/` antes de `docker compose up`.

| Arquivo de secret | Usado por | Comando de geração sugerido |
|---|---|---|
| `postgres_superuser_password` | Postgres (superuser) | `openssl rand -hex 32` |
| `social_care_db_password` | `social-care` (Swift/Vapor) | `openssl rand -hex 32` |
| `people_db_password` | `people-context` (Bun/Elysia) | `openssl rand -hex 32` |
| `analysis_db_password` | `analysis-bi` (Go) | `openssl rand -hex 32` |
| `authentik_db_password` | Authentik (OIDC server + worker) | `openssl rand -hex 32` |
| `authentik_secret_key` | Authentik (Django SECRET_KEY) | `openssl rand -hex 64` |
| `infisical_db_password` | Infisical CE (banco interno) | `openssl rand -hex 32` |
| `infisical_encryption_key` | Infisical CE (criptografia de secrets) | `openssl rand -hex 32` |
| `infisical_auth_secret` | Infisical CE (JWT auth) | `openssl rand -hex 32` |
| `vaultwarden_admin_token` | Vaultwarden (admin panel) | `openssl rand -base64 48` |
| `grafana_admin_password` | Grafana (profile: observability) | `openssl rand -hex 24` |

### Provisionamento em lote (executar como root no host de produção)

```bash
#!/usr/bin/env bash
set -euo pipefail

SECRETS_DIR=/etc/acdg-secrets
mkdir -p "$SECRETS_DIR"
chmod 700 "$SECRETS_DIR"

generate_secret() {
  local name="$1"
  local length="${2:-32}"
  local encoding="${3:-hex}"
  local path="${SECRETS_DIR}/${name}"

  if [[ -f "$path" ]]; then
    echo "[SKIP] $name já existe — não sobrescrevendo"
    return
  fi

  openssl rand "-${encoding}" "$length" | tee "$path" > /dev/null
  chmod 600 "$path"
  echo "[OK]   $name gerado"
}

generate_secret postgres_superuser_password 32 hex
generate_secret social_care_db_password     32 hex
generate_secret people_db_password          32 hex
generate_secret analysis_db_password        32 hex
generate_secret authentik_db_password       32 hex
generate_secret authentik_secret_key        64 hex
generate_secret infisical_db_password       32 hex
generate_secret infisical_encryption_key    32 hex
generate_secret infisical_auth_secret       32 hex
generate_secret vaultwarden_admin_token     48 base64
generate_secret grafana_admin_password      24 hex

echo "Todos os secrets gerados em $SECRETS_DIR"
ls -la "$SECRETS_DIR"
```

---

## 3. Migração dos Secrets para o Infisical (ADR-011)

Após o Infisical CE subir e ficar saudável (`docker compose ps infisical`), os secrets passam a ser gerenciados por ele. O fluxo é:

1. **Acesse o painel do Infisical** em `https://secrets.acdg-bv.org.br` (Caddy roteia internamente).
2. **Crie o projeto** `acdg-bv-production`.
3. **Importe os secrets** usando o CLI do Infisical:

   ```bash
   # Cada secret vira uma variável de ambiente no Infisical
   for f in /etc/acdg-secrets/*; do
     secret_name=$(basename "$f" | tr '[:lower:]' '[:upper:]')
     secret_value=$(cat "$f")
     infisical secrets set "${secret_name}=${secret_value}" --env=production
   done
   ```

4. **Atualize o `deploy.sh`** — o script já detecta o `infisical` CLI automaticamente e usa `infisical run --env=production` como wrapper de `docker compose up -d`.

5. **Os arquivos em `/etc/acdg-secrets/`** podem ser mantidos como fallback de bootstrap mas não devem ser a fonte primária após o Infisical estar operacional.

> Regra: o Infisical é a fonte de verdade em produção. Os arquivos em `/etc/acdg-secrets/` são o plano de bootstrap e emergência.

---

## 4. Plano de Sucessão e Acesso de Emergência

### 4.1 Owners mínimos obrigatórios

O stack ACDG-BV **deve ter sempre 2 owners com acesso completo** ao Infisical e ao Vaultwarden. Nunca menos de dois, para garantir continuidade em caso de indisponibilidade de uma pessoa.

| Papel | Acesso mínimo |
|---|---|
| Owner primário | Admin no Infisical + Admin no Vaultwarden + acesso SSH ao host |
| Owner secundário | Admin no Infisical + Admin no Vaultwarden + acesso SSH ao host |
| Backup operacional | Leitura no Infisical (env=production) + acesso SSH somente leitura |

### 4.2 Emergency Access (Vaultwarden)

O Vaultwarden suporta **Emergency Access** nativo (Bitwarden Emergency Access protocol):

1. Cada owner configura o outro como contato de emergência no Vaultwarden (`acdg-bv.org.br/vault`).
2. Tempo de espera configurado: **48 horas** (tempo suficiente para o owner primário rejeitar se for acesso indevido).
3. Em caso de emergência real, o owner secundário solicita acesso e aguarda o timeout.

### 4.3 Envelope físico de recuperação total

Um envelope físico lacrado deve ser mantido em local seguro (cofre físico da associação ACDG):

```
Conteúdo mínimo do envelope físico:
  1. IP do host de produção (Floating IP Magalu Cloud)
  2. Chave SSH privada do usuário de deploy (ou passphrase se criptografada)
  3. Credenciais de acesso ao console Magalu Cloud (tenant + API key de emergência)
  4. Token de admin do Vaultwarden (vaultwarden_admin_token)
  5. Data de atualização do envelope
```

O envelope deve ser **revisado e reemitido a cada 6 meses** ou após qualquer rotação de credenciais.

### 4.4 Rotação de secrets

| Secret | Frequência de rotação recomendada |
|---|---|
| Senhas de banco de dados | 12 meses ou após saída de membro da equipe |
| `authentik_secret_key` | 12 meses (invalida todas as sessões — planejar janela de manutenção) |
| `infisical_encryption_key` | Somente em caso de comprometimento (requer re-encrypt de todos os secrets) |
| `vaultwarden_admin_token` | 6 meses |
| Chaves SSH de acesso ao host | 12 meses ou após saída de membro |
| API Keys Magalu Cloud | 12 meses |

---

## 5. O que NÃO fazer

- **Nunca commitar** nenhum arquivo de secret real (o `.gitignore` bloqueia `secrets/*`, mas a vigilância humana é a defesa primária).
- **Nunca passar secrets como variáveis de ambiente** no compose — use sempre `secrets: file:`.
- **Nunca logar secrets** — revise qualquer `echo`, `set -x` ou debug que possa expor valores.
- **Nunca compartilhar secrets por e-mail ou mensageiro** — use o Vaultwarden para compartilhamento seguro.
- **Nunca usar o mesmo secret em múltiplos ambientes** — cada ambiente (dev, staging, prod) tem seu próprio conjunto.
