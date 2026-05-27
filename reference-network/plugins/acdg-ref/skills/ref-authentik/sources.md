# sources.md — mapa do espelho Authentik

Base: `REFERENCE_ROOT/auth-idp/authentik/`
Versão: **HEAD/main @ 2026-05-27** (SHA `ed5b7d17b1dd91ca2c7f55c33f4412909d73b11a`)

> Estes caminhos foram verificados via `ls`/`find` no espelho. Se algum não existir, confirme
> via `Glob 'auth-idp/authentik/**/*.md'` + `Grep` pelo termo — **não** assuma.

---

## Instalação e Configuração (`install-config/`)

| Tópico | Arquivo |
|--------|---------|
| Índice de instalação | `install-config/index.mdx` |
| **Docker Compose** (método principal para BV) | `install-config/install/docker-compose.mdx` |
| AWS deploy | `install-config/install/aws.md` |
| Kubernetes deploy | `install-config/install/kubernetes.md` |
| **Configuração geral** (variáveis `AUTHENTIK_*`) | `install-config/configuration/configuration.mdx` |
| Primeiros passos pós-install | `install-config/first-steps/index.mdx` |
| Instalação air-gapped | `install-config/air-gapped.mdx` |
| Instalação automatizada | `install-config/automated-install.mdx` |
| Upgrade | `install-config/upgrade.mdx` |
| Alta disponibilidade | `install-config/high-availability.mdx` |
| Reverse proxy | `install-config/reverse-proxy.md` |
| Configuração de e-mail | `install-config/email.mdx` |

---

## Providers (`add-secure-apps/providers/`)

| Tópico | Arquivo |
|--------|---------|
| **OAuth2/OIDC — visão geral** | `add-secure-apps/providers/oauth2/index.mdx` |
| **Criar OAuth2/OIDC provider** | `add-secure-apps/providers/oauth2/create-oauth2-provider.md` |
| Front/back-channel logout (SLO OIDC) | `add-secure-apps/providers/oauth2/frontchannel_and_backchannel_logout.mdx` |
| Device code flow | `add-secure-apps/providers/oauth2/device_code.md` |
| Machine-to-machine (client credentials) | `add-secure-apps/providers/oauth2/machine_to_machine.mdx` |
| GitHub compatibility | `add-secure-apps/providers/oauth2/github-compatibility.md` |
| WebFinger support | `add-secure-apps/providers/oauth2/webfinger_support.mdx` |
| **Property mappings — visão geral** | `add-secure-apps/providers/property-mappings/index.md` |
| **Property mapping: expression** | `add-secure-apps/providers/property-mappings/expression.mdx` |
| SAML provider | `add-secure-apps/providers/saml/` |
| LDAP provider | `add-secure-apps/providers/ldap/` |
| Proxy provider | `add-secure-apps/providers/proxy/` |
| SCIM provider | `add-secure-apps/providers/scim/index.md` |
| RADIUS provider | `add-secure-apps/providers/radius/` |
| RAC provider | `add-secure-apps/providers/rac/` |
| WSFed provider | `add-secure-apps/providers/wsfed/` |
| **Single Logout (SLO) — overview** | `add-secure-apps/providers/single-logout/index.md` |

---

## Applications (`add-secure-apps/applications/`)

| Tópico | Arquivo |
|--------|---------|
| Visão geral de applications | `add-secure-apps/applications/index.md` |
| **Gerenciar applications** | `add-secure-apps/applications/manage_apps.mdx` |

---

## Flows e Stages (`add-secure-apps/flows-stages/`)

| Tópico | Arquivo |
|--------|---------|
| **Flows — visão geral e tipos** | `add-secure-apps/flows-stages/flow/index.md` |
| **Lista de flows padrão** | `add-secure-apps/flows-stages/flow/flow_list/index.mdx` |
| Flow context | `add-secure-apps/flows-stages/flow/context/` |
| Flow executors | `add-secure-apps/flows-stages/flow/executors/` |
| Flow layouts | `add-secure-apps/flows-stages/flow/layouts/` |
| Flow inspector (debug) | `add-secure-apps/flows-stages/flow/inspector.md` |
| **Stages — índice geral** | `add-secure-apps/flows-stages/stages/index.md` |
| Stage: Identification | `add-secure-apps/flows-stages/stages/identification/index.md` |
| Stage: Consent | `add-secure-apps/flows-stages/stages/consent/index.md` |
| Stage: Password | `add-secure-apps/flows-stages/stages/password/` |
| Stage: User login | `add-secure-apps/flows-stages/stages/user_login/` |
| Stage: User write | `add-secure-apps/flows-stages/stages/user_write/` |
| Stage: User logout | `add-secure-apps/flows-stages/stages/user_logout/` |
| Stage: Prompt | `add-secure-apps/flows-stages/stages/prompt/` |
| Stage: Redirect | `add-secure-apps/flows-stages/stages/redirect/` |
| Stage: Email | `add-secure-apps/flows-stages/stages/email/` |
| Stage: Deny | `add-secure-apps/flows-stages/stages/deny/` |
| Stage: Invitation | `add-secure-apps/flows-stages/stages/invitation/` |
| Stage: Authenticator TOTP | `add-secure-apps/flows-stages/stages/authenticator_totp/` |
| Stage: Authenticator WebAuthn | `add-secure-apps/flows-stages/stages/authenticator_webauthn/` |
| Stage: Authenticator Validate | `add-secure-apps/flows-stages/stages/authenticator_validate/` |
| Stage: mTLS | `add-secure-apps/flows-stages/stages/mtls/` |
| Stage: Source | `add-secure-apps/flows-stages/stages/source/` |
| Bindings (policies/stages to flows) | `add-secure-apps/bindings-overview/index.md` |
| Outposts overview | `add-secure-apps/outposts/index.mdx` |

---

## Blueprints (`customize/blueprints/`)

| Tópico | Arquivo |
|--------|---------|
| Blueprints — índice e introdução | `customize/blueprints/index.mdx` |
| **Trabalhar com blueprints** | `customize/blueprints/working_with_blueprints.md` |
| **Exportar como blueprint** | `customize/blueprints/export.mdx` |
| **Estrutura do blueprint** | `customize/blueprints/v1/structure.md` |
| **Modelos disponíveis** | `customize/blueprints/v1/models.mdx` |
| Tags especiais YAML | `customize/blueprints/v1/tags.mdx` |
| Exemplo de blueprint | `customize/blueprints/v1/example.md` |
| Meta-blueprints | `customize/blueprints/v1/meta.md` |

---

## Políticas (`customize/policies/`)

| Tópico | Arquivo |
|--------|---------|
| Policies — visão geral | `customize/policies/index.md` |
| Trabalhar com policies | `customize/policies/working_with_policies.md` |
| Tipos de policy | `customize/policies/types/` |
| Bindings | `customize/policies/bindings.md` |

---

## Expressões Python (`expressions/`)

| Tópico | Arquivo |
|--------|---------|
| Funções disponíveis | `expressions/reference/_functions.mdx` |
| Objetos disponíveis (request, user, context) | `expressions/reference/_objects.md` |
| Objeto `user` | `expressions/reference/_user.md` |

---

## Gestão do Sistema (`sys-mgmt/`)

| Tópico | Arquivo |
|--------|---------|
| **Certificados e JWKS** | `sys-mgmt/certificates.md` |
| Configurações gerais (admin UI) | `sys-mgmt/settings.md` |
| Service accounts | `sys-mgmt/service-accounts.md` |
| Eventos / audit log | `sys-mgmt/events/index.md` |
| Eventos: tipos de ação | `sys-mgmt/events/event-actions.md` |
| Notificações | `sys-mgmt/events/notifications.md` |
| Tenancy | `sys-mgmt/tenancy.md` |
| Object lifecycle | `sys-mgmt/object-lifecycle-management.md` |
| Marcas (branding) | `sys-mgmt/brands/` |

---

## Usuários, Grupos e Fontes (`users-sources/`)

| Tópico | Arquivo |
|--------|---------|
| Fontes (sources — OAuth, SAML, LDAP) | `users-sources/sources/index.md` |
| Propriedades de sources | `users-sources/sources/property-mappings/` |
| Sincronização de diretório | `users-sources/sources/directory-sync/` |
| Grupos | `users-sources/groups/` |
| Referência de grupos | `users-sources/groups/group_ref.md` |
| Permissões (RBAC) | `users-sources/access-control/permissions.md` |
| Permissões iniciais | `users-sources/access-control/initial_permissions.mdx` |
| Roles | `users-sources/roles/` |

---

## Segurança (`security/`)

| Tópico | Arquivo |
|--------|---------|
| **Hardening** | `security/security-hardening.md` |
| Política de segurança | `security/policy.mdx` |
| Account lockdown | `security/account-lockdown.md` |
| Auditorias e certificações | `security/audits-and-certs/` |
| CVEs | `security/cves/` |

---

## Core (`core/`)

| Tópico | Arquivo |
|--------|---------|
| Arquitetura interna | `core/architecture.md` |
| Glossário | `core/glossary/index.mdx` |
| Termos do glossário | `core/glossary/terms/` |
| Interfaces (admin, user) | `core/interfaces/` |
| Files e file-picker | `core/files.md`, `core/file-picker.md` |
| Branding | `core/branding.md` |

---

## Release Notes (`releases/`)

| Período | Caminho |
|---------|---------|
| 2026 (mais recente) | `releases/2026/v2026.2.md`, `v2026.5.md`, `v2026.8.md` |
| 2025 | `releases/2025/v2025.2.md`, `v2025.4.md`, `v2025.6.md`, `v2025.8.mdx`, `v2025.10.md`, `v2025.12.md` |
| 2024 | `releases/2024/` |
| 2023 | `releases/2023/` |
| 2022 | `releases/2022/` |
| 2021 | `releases/2021/` |
