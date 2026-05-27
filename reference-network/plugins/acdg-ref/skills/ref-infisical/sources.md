# sources.md — mapa do espelho Infisical

Base: `REFERENCE_ROOT/secrets/infisical/`
Versão: Community Edition (CE), HEAD (main) @ 2026-05-27
SHA: 908b31fbd07919a9fd9413ce1a2f8e7b6c0d3569
Formato: Markdown + MDX (Mintlify)

## Self-hosting

| Tópico | Caminho |
|--------|---------|
| Visão geral dos modos de deploy | `self-hosting/overview.mdx` |
| Docker Compose | `self-hosting/deployment-options/docker-compose.mdx` |
| Standalone (imagem Docker única) | `self-hosting/deployment-options/standalone-infisical.mdx` |
| Kubernetes (Helm) | `self-hosting/deployment-options/kubernetes-helm.mdx` |
| Linux nativo (pacote) | `self-hosting/deployment-options/native/linux-package/installation.mdx` |
| Linux nativo (comandos/config) | `self-hosting/deployment-options/native/linux-package/commands-configuration.mdx` |
| Upgrade Linux | `self-hosting/deployment-options/linux-upgrade.mdx` |
| Variáveis de ambiente (envars) | `self-hosting/configuration/envars.mdx` |
| Requisitos de sistema | `self-hosting/configuration/requirements.mdx` |
| CE vs EE (Enterprise) | `self-hosting/ee.mdx` |
| FAQ self-hosting | `self-hosting/faq.mdx` |
| Endurecimento para produção | `self-hosting/guides/production-hardening.mdx` |
| Atualização (upgrading) | `self-hosting/guides/upgrading-infisical.mdx` |
| Bootstrap automatizado | `self-hosting/guides/automated-bootstrapping.mdx` |
| Migração Mongo → Postgres | `self-hosting/guides/mongo-to-postgres.mdx` |
| Monitoramento / telemetria | `self-hosting/guides/monitoring-telemetry.mdx` |
| Replicação | `self-hosting/guides/replication.mdx` |
| Certificados customizados | `self-hosting/guides/custom-certificates.mdx` |
| CDN caching | `self-hosting/guides/cdn-caching.mdx` |
| Ref. arch — Linux HA | `self-hosting/reference-architectures/linux-deployment-ha.mdx` |
| Ref. arch — AWS ECS | `self-hosting/reference-architectures/aws-ecs.mdx` |
| Ref. arch — GCR | `self-hosting/reference-architectures/google-cloud-run.mdx` |
| Ref. arch — on-prem K8s HA | `self-hosting/reference-architectures/on-prem-k8s-ha.mdx` |

## Plataforma / Documentação principal

| Tópico | Caminho |
|--------|---------|
| Introdução | `documentation/getting-started/introduction.mdx` |
| Overview | `documentation/getting-started/overview.mdx` |
| Conceitos — hierarquia | `documentation/getting-started/concepts/platform-hierarchy.mdx` |
| Conceitos — IAM | `documentation/getting-started/concepts/platform-iam.mdx` |
| Conceitos — modelos de deploy | `documentation/getting-started/concepts/deployment-models.mdx` |
| Conceitos — audit logs | `documentation/getting-started/concepts/audit-logs.mdx` |
| Admin panel (server admin) | `documentation/platform/admin-panel/server-admin.mdx` |
| Admin panel (org admin) | `documentation/platform/admin-panel/org-admin-console.mdx` |
| Controles de acesso — RBAC | `documentation/platform/access-controls/role-based-access-controls.mdx` |
| Controles de acesso — overview | `documentation/platform/access-controls/overview.mdx` |
| Acesso temporário | `documentation/platform/access-controls/temporary-access.mdx` |
| Audit log streams | `documentation/platform/audit-log-streams/audit-log-streams.mdx` |
| Audit logs Clickhouse | `documentation/platform/audit-logs-clickhouse-setup.mdx` |

## CLI

| Tópico | Caminho |
|--------|---------|
| Visão geral do CLI | `cli/overview.mdx` |
| Project config (.infisical.json) | `cli/project-config.mdx` |
| FAQ do CLI | `cli/faq.mdx` |
| Sync manual | `syncingManually.mdx` |

## SDKs e API

| Tópico | Caminho |
|--------|---------|
| SDKs — overview | `sdks/overview.mdx` |
| API REST — endpoints | `api-reference/endpoints/` (subpastas por recurso) |
| Admin bootstrap | `api-reference/endpoints/admin/bootstrap-instance.mdx` |

## AI / MCP

| Tópico | Caminho |
|--------|---------|
| MCP (Model Context Protocol) | `ai/model-context-protocol.mdx` |

## Changelog

| Tópico | Caminho |
|--------|---------|
| Changelog | `changelog/overview.mdx` |

> Estes caminhos cobrem os tópicos mais consultados. Para tópicos não listados, use
> `Glob 'secrets/infisical/**/*.mdx'` + `Grep` — **não** assuma ausência.

## Notas importantes

- O espelho cobre **exclusivamente o CE (Community Edition)**. Features marcadas como
  "Enterprise" ou "EE" na doc podem não estar completamente documentadas neste espelho.
- Formato MDX: ignore diretivas Mintlify (`<Card>`, `<CardGroup>`, frontmatter) — o
  conteúdo textual é o que importa.
