# sources.md — mapa do espelho Node.js

Base: `REFERENCE_ROOT/runtime/node/`

## Versões disponíveis

| Versão | Caminho | Release no mirror | Arquivos HTML | Usado por |
|--------|---------|-------------------|---------------|-----------|
| **v24 LTS** | `v24/docs/latest-v24.x/api/` | v24.16.0 (2026-05-27) | 66 + `all.html` | `web` (produção) |
| v26 GA | `v26/docs/latest-v26.x/api/` | v26.2.0 (2026-05-27) | 68 + `all.html` | planejamento |

**Default sempre: v24.** Consulte v26 somente quando a pergunta fixar essa versão ou pedir comparação.
Fontes: `_SOURCE.md` de cada versão (`v24/_SOURCE.md`, `v26/_SOURCE.md`).

## Mapa de módulos — v24 (primary)

Ponto de entrada: `v24/docs/latest-v24.x/api/index.html`

| Módulo / Área | Arquivo HTML |
|---------------|-------------|
| Índice | `index.html` |
| Todos os módulos (uma página) | `all.html` |
| **Módulos core frequentes** | |
| File system (fs) | `fs.html` |
| HTTP / HTTPS | `http.html`, `https.html` |
| HTTP/2 | `http2.html` |
| Streams | `stream.html`, `webstreams.html` |
| Buffer | `buffer.html` |
| Events | `events.html` |
| Process | `process.html` |
| Path | `path.html` |
| URL | `url.html` |
| Crypto | `crypto.html`, `webcrypto.html` |
| Worker Threads | `worker_threads.html` |
| Child Process | `child_process.html` |
| Cluster | `cluster.html` |
| Net (TCP/IPC) | `net.html` |
| DNS | `dns.html` |
| OS | `os.html` |
| Util | `util.html` |
| Console | `console.html` |
| Timers | `timers.html` |
| **Módulos modernos** | |
| Test runner nativo | `test.html` |
| SQLite nativo | `sqlite.html` |
| TypeScript nativo (strips) | `typescript.html` |
| Permissions | `permissions.html` |
| Single Executable Apps | `single-executable-applications.html` |
| **Módulos / ESM** | |
| ES Modules (ESM) | `esm.html` |
| CommonJS (CJS) | `modules.html` |
| Module (API) | `module.html` |
| Packages | `packages.html` |
| **Internos / diagnóstico** | |
| CLI flags | `cli.html` |
| Environment variables | `environment_variables.html` |
| Globals | `globals.html` |
| Errors | `errors.html` |
| Async hooks | `async_hooks.html` |
| Async context | `async_context.html` |
| Diagnostics channel | `diagnostics_channel.html` |
| Inspector | `inspector.html` |
| V8 | `v8.html` |
| VM | `vm.html` |
| Perf hooks | `perf_hooks.html` |
| Deprecations | `deprecations.html` |
| Report | `report.html` |
| WASI | `wasi.html` |
| TLS/SSL | `tls.html` |
| REPL | `repl.html` |
| Readline | `readline.html` |
| DGRAM (UDP) | `dgram.html` |
| Zlib | `zlib.html` |
| Addons (N-API) | `addons.html`, `n-api.html` |

## Módulos extras no v26 (não presentes em v24)

Confirme via `Glob 'runtime/node/v26/docs/latest-v26.x/api/*.html'` — o v26 tem 68 páginas
vs 66 do v24. Ao responder sobre v26, use sempre o caminho `v26/docs/latest-v26.x/api/`.

> Confirme existência de páginas via `Glob` antes de `Read` — não assuma nomes.
