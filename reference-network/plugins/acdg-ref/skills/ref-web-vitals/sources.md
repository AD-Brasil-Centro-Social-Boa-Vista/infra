# sources.md — mapa do espelho Web Vitals

Base: `REFERENCE_ROOT/performance/web-vitals/`

---

## Seção 1 — web-vitals lib (GoogleChrome/web-vitals)

Versão: **latest main** (SHA `91ae2cb0ea43c3fbcd22db71c0b9e667b1e737ce`, 2026-05-27)
Base: `web-vitals-lib/`

| Arquivo | Tópico |
|---------|--------|
| `README.md` | API completa: `onLCP`, `onINP`, `onCLS`, `onFCP`, `onTTFB`; tipos `Metric`, `MetricWithAttribution`; modos `standard`, `attribution`; exemplos de uso; navegadores suportados |
| `CHANGELOG.md` | Histórico de versões; mudanças de API; deprecações |
| `CONTRIBUTING.md` | Guia de contribuição |

### Consultas frequentes — Seção 1

| Dúvida | Arquivo |
|--------|---------|
| Como usar `onINP` com atribuição | `README.md` |
| Tipos TypeScript da lib (Metric, Attribution…) | `README.md` |
| Mudanças de API entre versões | `CHANGELOG.md` |
| Navegadores suportados | `README.md` |

---

## Seção 2 — Lighthouse CI (GoogleChrome/lighthouse-ci)

Versão: **latest main** (SHA `ebee453dad3f8acacd657a62ccc65e3296afb7d0`, 2026-05-27)
Base: `lighthouse-ci/`

| Arquivo | Tópico |
|---------|--------|
| `README.md` | Visão geral, quickstart, badges de CI |
| `docs/getting-started.md` | Início rápido: instalar LHCI, configurar, rodar |
| `docs/configuration.md` | Referência completa do `lighthouserc` (collect, assert, upload) |
| `docs/architecture.md` | Arquitetura interna do LHCI |
| `docs/complex-setup.md` | Configuração avançada (multi-app, autenticação, puppeteer) |
| `docs/server.md` | Servidor LHCI self-hosted: instalação, banco, API |
| `docs/migration-guide.md` | Migração entre versões |
| `docs/troubleshooting.md` | Problemas comuns e soluções |
| `docs/introduction-to-ci.md` | Introdução ao CI com Lighthouse |
| `docs/version-policy.md` | Política de versões |
| `docs/recipes/docker-server/README.md` | Deploy do servidor LHCI em Docker |
| `docs/recipes/heroku-server/README.md` | Deploy em Heroku |

### Consultas frequentes — Seção 2

| Dúvida | Arquivo |
|--------|---------|
| Como configurar assertions de performance | `docs/configuration.md` |
| Como rodar o servidor LHCI self-hosted | `docs/server.md` |
| Quickstart no CI | `docs/getting-started.md`, `README.md` |
| Deploy LHCI em Docker | `docs/recipes/docker-server/README.md` |

---

## Seção 3 — Artigos web.dev (snapshot HTML)

> **Formato:** snapshot HTML via wget de web.dev/articles/, 2026-05-27.
> Sem garantia de atualização posterior. Cite o arquivo `.html` + heading como evidência.

Base: `web-dev-articles/`

| Arquivo | URL de origem | Tópico |
|---------|--------------|--------|
| `vitals.html` | web.dev/articles/vitals | LCP, INP, CLS; thresholds "good/needs improvement/poor"; ferramentas de medição (Chrome, CrUX, Lighthouse, web-vitals lib) |
| `inp.html` | web.dev/articles/inp | INP: definição, o que conta como interação, como o navegador calcula, como medir com RUM/lab, estratégias de otimização |

### Consultas frequentes — Seção 3

| Dúvida | Arquivo |
|--------|---------|
| Thresholds de LCP, INP, CLS | `vitals.html` |
| O que é INP e como é calculado | `inp.html` |
| Diferença entre FID e INP | `vitals.html`, `inp.html` |
| Ferramentas de medição recomendadas pelo Google | `vitals.html` |

> Use `Grep` com termos de texto (não de HTML tags) para localizar seções nos arquivos `.html`.
