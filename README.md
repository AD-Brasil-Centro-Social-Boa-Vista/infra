# infra — ACDG-BV (Roraima) · orquestração single-VPS

Materialização da **ADR-009** (`web/handbook/architecture/adr/009-deployment-architecture-acdg-bv.md`):
deploy autocontido da plataforma ACDG numa **VPS única** Magalu Cloud (`br-ne1`, Fortaleza), via
**Docker Compose v5** + **Caddy** + **Postgres 16** + **NATS JetStream** + **Authentik** (OIDC) +
**Infisical/Vaultwarden** (secrets), provisionado por **OpenTofu/Terraform** (provider Magalu `mgc`).

> **Licenciamento (ADR-BV-001):** este repo `infra` (cola de deploy) é **MIT**; os **serviços core**
> (`social-care`, `people-context`, `analysis-bi`, `web`) são **AGPL-3.0** (copyleft + cláusula de rede,
> protege a plataforma de dados de saúde). O `infra` apenas **orquestra/referencia** as imagens — não
> embute o código AGPL (mera agregação, sem conflito). Estratégia de derivação (fork vs consumir imagens)
> em [`docs/adr/001-repository-derivation-and-licensing.md`](docs/adr/001-repository-derivation-and-licensing.md).
>
> **Nenhum secret ou dado** vive neste repo (ver `.gitignore`). O espelho offline de docs
> (`reference/`, ~700MB) e o workspace de evals são **local-only** (gitignored).

## Estrutura

```
infra/
├── compose/                      # Docker Compose v5 modular (include:)
│   ├── compose.yml               # raiz — include de todos + network acdg-bv
│   ├── compose.postgres.yml      # Postgres 16 único (database-per-service)
│   ├── compose.nats.yml          # NATS JetStream compartilhado
│   ├── compose.proxy.yml         # Caddy (TLS auto + HTTP/3)
│   ├── compose.auth.yml          # Authentik (server+worker+redis)
│   ├── compose.secrets.yml       # Infisical CE + Vaultwarden (ADR-011)
│   ├── compose.web.yml           # front+BFF (TanStack Start)
│   ├── compose.social-care.yml   # Swift/Vapor
│   ├── compose.people-context.yml# Bun/Elysia (interno)
│   ├── compose.analysis-bi.yml   # Go (profile: analytics)
│   ├── compose.observability.yml # Prom/Grafana/Loki/Alertmanager (profile: observability)
│   ├── Caddyfile
│   └── postgres/init/00-create-databases.sh
├── terraform/                    # provisionamento Magalu (mgc v0.50.x)
├── scripts/                      # deploy.sh, backup/restore-postgres.sh, snapshot-block.sh
├── secrets/                      # gitignored (só README) — bootstrap em /etc/acdg-secrets
├── env/.env.example              # config não-secreta
├── .github/workflows/            # CI: valida compose + terraform + shellcheck
├── reference/                    # [local-only] espelho offline de docs
├── reference-network/            # rede de especialistas read-only (plugin acdg-ref)
└── doc-references.yaml           # catálogo do espelho
```

## Subir

```bash
cp env/.env.example env/.env            # ajuste DOMAIN, REGISTRY, tags
# secrets de bootstrap em /etc/acdg-secrets/ (chmod 600) — ver secrets/README.md
cd compose
docker compose up -d                                    # núcleo
docker compose --profile analytics up -d                # + analysis-bi
docker compose --profile observability up -d            # + Prom/Grafana/Loki
docker compose config                                   # validar a composição mergeada
```

## Limites de recurso (ADR-009 — soma cabe na VPS BV4-16-50)

| serviço | CPU | RAM | | serviço | CPU | RAM |
|---|---|---|---|---|---|---|
| web | 1.0 | 512M | | postgres | 0.5 | 3G |
| social-care | 1.0 | 1G | | authentik | 0.3 | 1G |
| people-context | 0.5 | 512M | | caddy | 0.1 | 64M |
| analysis-bi | 0.5 | 512M | | nats/redis/secrets | ~0.3 | ~256M |

## Domínios (Cloudflare → Floating IP)

`acdg-bv.org.br` (web) · `api.` (social-care) · `auth.` (Authentik) · `secrets.` (Infisical) ·
`vault.` (Vaultwarden) · `bi.` (analysis-bi, profile analytics).

## Notas
- **web** está pré-Sprint 0 (sem Dockerfile ainda) — o `compose.web.yml` referencia a imagem que o CI do `web` publicará; ajuste `WEB_TAG` quando existir.
- **NATS** não estava na lista de compose da ADR-009 (omissão); foi reconciliado aqui pois a arquitetura de integração e o CLAUDE.md raiz exigem um JetStream compartilhado.
- **Perguntas em aberto da ADR-009** (Floating IP, multi-AZ br-ne1, desconto ONG, egress real): confirmar com comercial Magalu antes de `terraform apply`.
