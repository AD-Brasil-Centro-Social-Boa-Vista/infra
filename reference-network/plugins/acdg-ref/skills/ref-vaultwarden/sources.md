# sources.md — mapa do espelho Vaultwarden

Base: `REFERENCE_ROOT/secrets/vaultwarden/`
Versão: wiki do GitHub (dani-garcia/vaultwarden.wiki), HEAD @ 2026-05-27
SHA: 96c08c21a5b07f10ebb1e2e544738055f58ebe54
Formato: Markdown (.md) — wiki pages

## Ponto de entrada

| Arquivo | Conteúdo |
|---------|----------|
| `Home.md` | Visão geral, features suportadas e ausentes |
| `_Sidebar.md` | Índice navegável da wiki |
| `FAQs.md` | Perguntas frequentes gerais |

## Configuração

| Tópico | Arquivo |
|--------|---------|
| Como configurar (env, .env, admin page) | `Configuration-overview.md` |
| Outras opções de configuração | `Other-configuration.md` |
| SMTP (e-mail) | `SMTP-Configuration.md` |
| Número de workers | `Changing-the-number-of-workers.md` |
| Limite de tamanho de requisição | `Changing-the-API-request-size-limit.md` |
| Localização persistente dos dados | `Changing-persistent-data-location.md` |
| Base dir alternativo | `Using-an-alternate-base-dir.md` |
| Logging | `Logging.md` |
| Logrotate | `Logrotate-example.md` |

## Deploy / Instalação

| Tópico | Arquivo |
|--------|---------|
| Iniciar um container | `Starting-a-Container.md` |
| Docker Compose | `Using-Docker-Compose.md` |
| Exemplos de deployment | `Deployment-examples.md` |
| Usando Podman | `Using-Podman.md` |
| Container sem root | `Running-docker-container-with-non-root-user.md` |
| Construir imagem Docker própria | `Building-your-own-docker-image.md` |
| Construir binário | `Building-binary.md` |
| Binários pré-compilados | `Pre-built-binaries.md` |
| Serviço systemd | `Setup-as-a-systemd-service.md` |
| Instalação não-Docker | `General-(not-docker).md` |
| Pacotes de terceiros | `Third-party-packages.md` |
| Qual imagem usar | `Which-container-image-to-use.md` |
| Atualizar imagem | `Updating-the-vaultwarden-image.md` |
| Kubernetes | `Kubernetes-deployment.md` |

## Proxy Reverso / TLS

| Tópico | Arquivo |
|--------|---------|
| Exemplos de proxy (Nginx, Apache, Caddy, HAProxy) | `Proxy-examples.md` |
| Caddy 2.x + Cloudflare DNS | `Caddy-2.x-with-Cloudflare-DNS.md` |
| Docker + Traefik + ModSecurity | `Docker---Traefik---ModSecurity-Setup.md` |
| Habilitar HTTPS | `Enabling-HTTPS.md` |
| CA privada / certs self-signed + Chrome | `Private-CA-and-self-signed-certs-that-work-with-Chrome.md` |
| Let's Encrypt em instância privada | `Running-a-private-vaultwarden-instance-with-Let's-Encrypt-certs.md` |

## Backends de banco de dados

| Tópico | Arquivo |
|--------|---------|
| PostgreSQL | `Using-the-PostgreSQL-Backend.md` |
| MySQL | `Using-the-MySQL-Backend.md` |
| MariaDB / MySQL | `Using-the-MariaDB-(MySQL)-Backend.md` |
| Migração MariaDB → SQLite | `Migrating-from-MariaDB-(MySQL)-to-SQLite.md` |
| Rodar sem WAL (SQLite) | `Running-without-WAL-enabled.md` |

## Admin Page

| Tópico | Arquivo |
|--------|---------|
| Habilitar admin page | `Enabling-admin-page.md`, `Enable-admin-page.md` |
| Proteger admin_token | `Enabling-admin-page-secure-the-admin_token.md` |
| Desabilitar admin token | `Disable-admin-token.md` |
| Traduzir admin page | `Translating-admin-page.md` |

## Segurança / Autenticação

| Tópico | Arquivo |
|--------|---------|
| Hardening Guide | `Hardening-Guide.md` |
| SSO via OpenID Connect | `Enabling-SSO-support-using-OpenId-Connect.md` |
| U2F e FIDO2/WebAuthn | `Enabling-U2F-(and-FIDO2-WebAuthn)-authentication.md` |
| YubiKey OTP | `Enabling-Yubikey-OTP-authentication.md` |
| Fail2Ban | `Fail2Ban-Setup.md` |
| Desabilitar registro de novos usuários | `Disable-registration-of-new-users.md` |
| Desabilitar convites | `Disable-invitations.md` |

## Funcionalidades adicionais

| Tópico | Arquivo |
|--------|---------|
| WebSocket notifications | `Enabling-WebSocket-notifications.md` |
| Push notifications mobile | `Enabling-Mobile-Client-push-notification.md` |
| LDAP sync | `Syncing-users-from-LDAP.md` |
| Ícones de sites customizados | `Using-custom-website-icons.md` |
| Ícones de serviços internos | `Allow-icon-fetching-from-internal-services.md` |
| CSS customizado | `Customize-Vaultwarden-CSS.md` |
| Dica de senha | `Password-hint-display.md` |
| Templates de e-mail | `Translating-the-email-templates.md` |
| Importar do Keepass/KeepassX | `Importing-data-from-Keepass-or-KeepassX.md` |
| Backup do vault | `Backing-up-your-vault.md` |
| Audits | `Audits.md` |
| Diferenças da API Bitwarden oficial | `Differences-from-the-upstream-API-implementation.md` |
| Suporte ao upstream | `Supporting-upstream.md` |
| Git hooks (dev) | `Git-hooks.md` |

> Para tópicos não listados, use `Glob 'secrets/vaultwarden/*.md'` + `Grep` — **não** assuma ausência.

## Notas importantes

- Vaultwarden é uma **implementação não-oficial** do Bitwarden server. Nem toda feature
  da API oficial existe — veja `Home.md` (seção "Missing features") e
  `Differences-from-the-upstream-API-implementation.md`.
- Configuração **recomendada**: variáveis de ambiente (não `config.json`). Ver
  `Configuration-overview.md`.
- A fonte canônica de variáveis de ambiente é o arquivo `.env.template` do repositório
  (não espelhado aqui). O espelho da wiki descreve o comportamento; o template lista
  todas as opções.
