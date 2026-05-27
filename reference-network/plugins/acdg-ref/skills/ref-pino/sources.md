# sources.md — mapa do espelho Pino

Base: `REFERENCE_ROOT/logging/pino/`
Versão: **Pino v18+** (SHA `ff0dc5c6cd5f18611e8d588e3c528ce703792fea`, clonado 2026-05-27)

## Arquivos do espelho

| Arquivo | Tópico principal |
|---------|-----------------|
| `README.md` | Visão geral, instalação, API básica, níveis de log, serializers, opções raiz |
| `api.md` | API completa: todas as opções de `pino()`, métodos de instância, tipos TypeScript |
| `redaction.md` | Redação PII: opção `redact`, paths com wildcards, função `censor`, segurança |
| `child-loggers.md` | `logger.child()`: bindings estáticos, herança de opções, context aninhado |
| `transports.md` | `transport` option, `pino.transport()`, worker threads, multi-transport, targets |
| `asynchronous.md` | Logging assíncrono: `pino.destination()`, `sonic-boom`, flush, perda de logs |
| `pretty.md` | `pino-pretty`: configuração, opções de formatação, uso em dev vs prod |
| `browser.md` | `pino/browser`: diferenças de API, serializers no browser, transmit |
| `bundling.md` | Bundle com webpack, esbuild, Rollup; limitações de worker threads em bundles |
| `benchmarks.md` | Benchmarks de throughput comparados a outros loggers Node.js |
| `ecosystem.md` | Ferramentas do ecossistema: transportes, prettifiers, integrações |
| `web.md` | Uso em contextos web |
| `diagnostics.md` | Diagnóstico de problemas comuns |
| `help.md` | FAQ: perguntas frequentes e soluções |
| `lts.md` | Política de LTS: quais versões recebem suporte |
| `CONTRIBUTING.md` | Guia de contribuição ao projeto |
| `SECURITY.md` | Política de segurança e reporte de vulnerabilidades |

## Tópicos-chave e onde encontrá-los

| Dúvida | Arquivo(s) |
|--------|-----------|
| Opções de `pino()` (level, name, serializers, hooks…) | `api.md`, `README.md` |
| Como redigir/mascarar campos sensíveis (PII) | `redaction.md` |
| Child loggers e context propagation | `child-loggers.md` |
| Transportes (arquivo, stdout, multi-target) | `transports.md` |
| Flush e perda de logs em crash | `asynchronous.md` |
| Pretty print no desenvolvimento | `pretty.md` |
| Pino no browser (CSP, transmit) | `browser.md` |
| Performance / throughput | `benchmarks.md` |
| Compatibilidade com bundlers | `bundling.md` |

> Se um arquivo não existir exatamente como listado, confirme via `Glob 'logging/pino/*.md'`
> — **não** assuma nomes alternativos.
