# sources.md — mapa do espelho Caddy

Base: `REFERENCE_ROOT/infra/caddy/`
Versão espelhada: **Caddy v2** (único disponível no mirror)
SHA do repo fonte (caddyserver/website): `378d6d0ace34f8647d93f7e135b7c000898ef6bc`
Data do espelho: `2026-05-27`

## Estrutura de arquivos verificada

```
infra/caddy/
├── _SOURCE.md                          ← metadados do espelho (versão, SHA, data)
├── index.md                            ← visão geral da documentação
├── getting-started.md
├── install.md
├── running.md
├── command-line.md                     ← caddy run / reload / adapt / validate / fmt
├── api.md                              ← API REST de admin (porta 2019)
├── api-tutorial.md
├── caddyfile.md                        ← introdução ao Caddyfile
├── caddyfile-tutorial.md               ← tutorial passo a passo
├── automatic-https.md                  ← HTTPS automático, ACME, On-Demand TLS, HTTP/3
├── architecture.md                     ← modelo de módulos e pipeline
├── modules.md                          ← referência de módulos
├── config-adapters.md                  ← adaptadores (Caddyfile → JSON interno)
├── conventions.md
├── logging.md
├── metrics.md
├── profiling.md
├── troubleshooting.md
├── faq.md
├── examples.md
├── build.md
├── signature-verification.md
├── v2-upgrade.md                       ← migração v1 → v2
├── json.md                             ← referência JSON config (rendered via JS no site)
│
├── caddyfile/
│   ├── concepts.md                     ← estrutura, blocos, site blocks, matchers, snippets, placeholders
│   ├── directives.md                   ← índice de todas as directives + algoritmo de ordenação
│   ├── matchers.md                     ← request matchers: path, host, method, header, query, expression, not
│   ├── response-matchers.md            ← response matchers (usados em reverse_proxy, encode)
│   ├── options.md                      ← bloco global { email, admin, debug, http_port, https_port, servers... }
│   ├── patterns.md                     ← padrões comuns prontos (proxy, SPA, wildcard, www redirect)
│   │
│   └── directives/                     ← uma página por directive
│       ├── abort.md
│       ├── acme_server.md              ← servidor ACME embutido
│       ├── basic_auth.md
│       ├── bind.md
│       ├── encode.md                   ← compressão gzip / zstd / brotli
│       ├── error.md
│       ├── file_server.md
│       ├── forward_auth.md             ← delegação de autenticação
│       ├── fs.md
│       ├── handle.md                   ← roteamento mutuamente exclusivo
│       ├── handle_errors.md
│       ├── handle_path.md
│       ├── header.md                   ← manipulação de cabeçalhos de resposta
│       ├── import.md                   ← importar snippets / arquivos externos
│       ├── intercept.md
│       ├── invoke.md
│       ├── log.md
│       ├── log_append.md
│       ├── log_name.md
│       ├── log_skip.md
│       ├── map.md
│       ├── method.md
│       ├── metrics.md
│       ├── php_fastcgi.md
│       ├── push.md
│       ├── redir.md
│       ├── request_body.md
│       ├── request_header.md           ← manipulação de cabeçalhos de requisição
│       ├── respond.md
│       ├── reverse_proxy.md            ← proxy reverso, upstream, load balancing, health check, transporte
│       ├── rewrite.md
│       ├── root.md
│       ├── route.md                    ← ordenação explícita de directives
│       ├── templates.md
│       ├── tls.md                      ← configuração manual de TLS / ACME / certificados próprios
│       ├── tracing.md
│       ├── try_files.md
│       ├── uri.md
│       └── vars.md
│
├── quick-starts/
│   ├── caddyfile.md
│   ├── https.md
│   ├── reverse-proxy.md
│   ├── static-files.md
│   ├── api.md
│   └── railway.md
│
└── extending-caddy/
    ├── caddyfile.md
    ├── config-adapters.md
    ├── namespaces.md
    └── placeholders.md
```

## Páginas-chave por tema

| Tema | Arquivo(s) |
|------|-----------|
| Caddyfile — estrutura geral | `caddyfile/concepts.md` |
| Directives — índice completo + ordenação | `caddyfile/directives.md` |
| Proxy reverso | `caddyfile/directives/reverse_proxy.md`, `quick-starts/reverse-proxy.md` |
| TLS manual / certificados | `caddyfile/directives/tls.md` |
| HTTPS automático / ACME / On-Demand TLS | `automatic-https.md` |
| HTTP/3 / configuração de servidor | `caddyfile/options.md` (sub-bloco `servers { protocols h3 }`) |
| Matchers de request | `caddyfile/matchers.md` |
| Matchers de response | `caddyfile/response-matchers.md` |
| Roteamento exclusivo (handle) | `caddyfile/directives/handle.md`, `caddyfile/directives/handle_path.md` |
| Roteamento explícito (route) | `caddyfile/directives/route.md` |
| Cabeçalhos de resposta | `caddyfile/directives/header.md` |
| Cabeçalhos de requisição | `caddyfile/directives/request_header.md` |
| Compressão | `caddyfile/directives/encode.md` |
| Redirecionamento | `caddyfile/directives/redir.md` |
| Reescrita de URI | `caddyfile/directives/rewrite.md` |
| Padrões prontos | `caddyfile/patterns.md` |
| Opções globais | `caddyfile/options.md` |
| Importar snippets | `caddyfile/directives/import.md` |
| Forward auth | `caddyfile/directives/forward_auth.md` |
| Linha de comando | `command-line.md` |
| API de admin | `api.md`, `api-tutorial.md` |
| Módulos disponíveis | `modules.md` |
| Arquitetura / módulos | `architecture.md` |
| Logging | `logging.md`, `caddyfile/directives/log.md` |

> Se uma página não aparecer aqui, confirme com `Glob 'infra/caddy/**/*.md'` + `Grep` —
> **não** assuma que o arquivo não existe.
