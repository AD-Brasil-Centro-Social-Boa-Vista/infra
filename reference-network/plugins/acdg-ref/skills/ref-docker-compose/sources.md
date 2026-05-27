# sources.md — mapa do espelho Docker Compose

Base: `REFERENCE_ROOT/infra/docker-compose/`
Versão: Compose v5 "Mont Blanc" (Compose Specification) · SHA `2ea4a02` · 2026-05-27

> Fonte de versão: `_SOURCE.md` na raiz da pasta.

---

## Compose file reference (`reference/compose-file/`)

Referência completa dos campos do arquivo Compose. Início: `_index.md`.

| Tópico | Arquivo |
|--------|---------|
| Índice / visão geral | `_index.md` |
| `version` (obsoleto) + `name` | `version-and-name.md` |
| `services` (top-level, todos os atributos) | `services.md` |
| `deploy` (resources.limits, replicas, mode, placement) | `deploy.md` |
| `secrets` (top-level: file, environment, external) | `secrets.md` |
| `networks` (top-level) | `networks.md` |
| `volumes` (top-level) | `volumes.md` |
| `configs` (top-level) | `configs.md` |
| `include` (modularização de Compose files) | `include.md` |
| `profiles` (filtro de serviços por perfil) | `profiles.md` |
| `build` (Compose Build Specification) | `build.md` |
| Merge de múltiplos arquivos | `merge.md` |
| Fragmentos YAML (anchors & aliases) | `fragments.md` |
| Interpolação de variáveis | `interpolation.md` |
| Extensões (`x-*`) | `extension.md` |
| Versões legadas (2.x / 3.x) | `legacy-versions.md` |
| Develop (watch mode) | `develop.md` |
| Models (AI/provider services) | `models.md` |

---

## Manuais / How-tos (`manuals/compose/`)

Guias de uso, conceitos e boas práticas.

| Tópico | Arquivo |
|--------|---------|
| Índice dos manuais | `_index.md` |
| Modelo de aplicação Compose | `intro/compose-application-model.md` |
| Features e casos de uso | `intro/features-uses.md` |
| Histórico: v1 vs v2 vs v5 | `intro/history.md` |
| Getting started | `gettingstarted.md` |
| **Secrets** — uso seguro, mount em `/run/secrets/` | `how-tos/use-secrets.md` |
| **Startup order** — depends_on + condition + healthcheck | `how-tos/startup-order.md` |
| **Profiles** — ativar/desativar serviços por ambiente | `how-tos/profiles.md` |
| **Multiple Compose files** — visão geral | `how-tos/multiple-compose-files/_index.md` |
| Include (como usar include:) | `how-tos/multiple-compose-files/include.md` |
| Extends (herança entre serviços) | `how-tos/multiple-compose-files/extends.md` |
| Merge (fusão de arquivos) | `how-tos/multiple-compose-files/merge.md` |
| Variáveis de ambiente — visão geral | `how-tos/environment-variables/_index.md` |
| Set env vars | `how-tos/environment-variables/set-environment-variables.md` |
| Interpolação de variáveis | `how-tos/environment-variables/variable-interpolation.md` |
| Precedência de variáveis | `how-tos/environment-variables/envvars-precedence.md` |
| Boas práticas de variáveis | `how-tos/environment-variables/best-practices.md` |
| Variáveis reservadas do Compose (COMPOSE_*) | `how-tos/environment-variables/envvars.md` |
| Networking | `how-tos/networking.md` |
| Lifecycle (start/stop/restart) | `how-tos/lifecycle.md` |
| Uso em produção | `how-tos/production.md` |
| Project name | `how-tos/project-name.md` |
| GPU support | `how-tos/gpu-support.md` |
| File watch (dev mode) | `how-tos/file-watch.md` |
| Provider services | `how-tos/provider-services.md` |
| Dependent images | `how-tos/dependent-images.md` |
| OCI artifact | `how-tos/oci-artifact.md` |
| Release notes | `release-notes.md` |
| Trust model | `trust-model.md` |
| FAQ | `support-and-feedback/faq.md` |

---

## CLI reference (`cli-reference/`)

Referência de flags dos comandos `docker compose`. Útil para automação e scripts.

| Comando | Arquivo |
|---------|---------|
| `docker compose` (raiz, flags globais) | `compose.md` |
| `docker compose up` | `compose_up.md` |
| `docker compose down` | `compose_down.md` |
| `docker compose run` | `compose_run.md` |
| `docker compose build` | `compose_build.md` |
| `docker compose start / stop / restart` | `compose_start.md`, `compose_stop.md`, `compose_restart.md` |
| `docker compose ps / ls / logs` | `compose_ps.md`, `compose_ls.md`, `compose_logs.md` |
| `docker compose exec` | `compose_exec.md` |
| `docker compose config` | `compose_config.md` |
| `docker compose watch` | `compose_watch.md` |
| `docker compose volumes` | `compose_volumes.md` |
| `docker compose wait` | `compose_wait.md` |
| `docker compose stats` | `compose_stats.md` |

---

> Estes caminhos foram verificados via `find` no espelho local em 2026-05-27.
> Se algum não existir, confirme via `Glob 'reference/compose-file/*.md'` ou
> `Glob 'manuals/compose/**/*.md'` + `Grep` pelo termo — **não** assuma.
