# sources.md — mapa do espelho GlitchTip

Base: `REFERENCE_ROOT/observability/glitchtip/`

> **Formato:** snapshot HTML (wget de glitchtip.com/documentation, 2026-05-27).
> **Não é Markdown.** O conteúdo está no HTML completo de cada página.
> Sem garantia de atualização posterior à data do snapshot.

## Arquivos do espelho

| Arquivo | URL de origem | Tópico |
|---------|--------------|--------|
| `index.html` | /documentation | Índice e navegação da documentação |
| `getting-started.html` | /documentation/getting-started | Início rápido: criar conta, projeto, DSN |
| `install.html` | /documentation/install | Instalação self-hosted (Docker Compose) |
| `setup.html` | /documentation/setup | Configuração pós-instalação |
| `environment-variables.html` | /documentation/environment-variables | Referência completa de variáveis de ambiente |
| `error-tracking.html` | /documentation/error-tracking | Conceito e uso do error tracking |
| `configure-error-tracking.html` | /documentation/configure-error-tracking | Como configurar error tracking em projetos |
| `performance.html` | /documentation/performance | Performance monitoring: overview |
| `performance-monitoring.html` | /documentation/performance-monitoring | Performance monitoring: detalhes |
| `uptime-monitoring.html` | /documentation/uptime-monitoring | Uptime monitoring (checks, alertas) |
| `logs.html` | /documentation/logs | Logs: ingestão e visualização |
| `integrations.html` | /documentation/integrations | Integrações externas (Slack, webhooks, etc.) |
| `sentry-compatibility.html` | /documentation/sentry-compatibility | Compatibilidade com SDKs Sentry |
| `api.html` | /documentation/api | API REST: autenticação, endpoints |
| `cli.html` | /documentation/cli | GlitchTip CLI |
| `mcp.html` | /documentation/mcp | MCP server do GlitchTip |
| `self-hosted.html` | /documentation/self-hosted | Detalhes de instalação self-hosted |
| `hosted-architecture.html` | /documentation/hosted-architecture | Arquitetura do serviço hosted |
| `backup.html` | /documentation/backup | Estratégia de backup |
| `email.html` | /documentation/email | Configuração de SMTP/e-mail |
| `security-and-compliance.html` | /documentation/security-and-compliance | Segurança, GDPR, compliance |
| `upgrading.html` | /documentation/upgrading | Como atualizar (upgrade guide) |
| `frequently-asked-questions.html` | /documentation/frequently-asked-questions | FAQ |
| `contribute.html` | /documentation/contribute | Como contribuir ao GlitchTip |

## Consultas frequentes e onde encontrar

| Dúvida | Arquivo |
|--------|---------|
| Como instalar self-hosted (Docker Compose) | `install.html`, `self-hosted.html` |
| Variáveis de ambiente (SECRET_KEY, DATABASE_URL…) | `environment-variables.html` |
| Como usar SDK Sentry apontando para GlitchTip | `sentry-compatibility.html` |
| Como criar projetos e obter DSN | `getting-started.html` |
| Configurar SMTP | `email.html` |
| Uptime checks | `uptime-monitoring.html` |
| API REST | `api.html` |
| Backup | `backup.html` |

> Para localizar conteúdo no HTML, use `Grep` com termos de texto visível (não de tags HTML).
> `Glob 'observability/glitchtip/*.html'` para confirmar os arquivos disponíveis no espelho.
