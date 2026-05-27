# sources.md — mapa do espelho Bun

Base: `REFERENCE_ROOT/runtime/bun/`
Versão: **1.3.11** · Formato: MDX · Data do espelho: 2026-05-27 · Arquivos: 332 (.md + .mdx)
Fonte original: `github.com/oven-sh/bun` (subpath `docs/`, commit `2148214d40fc9f844f61ae5f8575d6d94a9d038c`)

## Navegação

Ponto de entrada: `index.mdx` · Quickstart: `quickstart.mdx`

## Mapa temático principal

| Tópico | Arquivo(s) inicial(is) |
|--------|------------------------|
| Índice / TOC | `index.mdx`, `quickstart.mdx`, `installation.mdx` |
| TypeScript nativo | `typescript.mdx`, `typescript-6.mdx` |
| **Runtime — APIs nativas** | |
| Servidor HTTP (`Bun.serve`) | `runtime/http/index.mdx` (+ subpastas `networking/`) |
| File I/O (`Bun.file`) | `runtime/file-io.mdx` |
| SQLite nativo | `runtime/sqlite.mdx` |
| SQL (Bun.sql) | `runtime/sql.mdx` |
| Shell (`$\`...\``) | `runtime/shell.mdx` |
| Workers | `runtime/workers.mdx` |
| Globals | `runtime/globals.mdx` |
| Streams | `runtime/streams.mdx` |
| Hashing | `runtime/hashing.mdx` |
| Crypto / Secrets | `runtime/secrets.mdx` |
| FFI | `runtime/ffi.mdx` |
| Plugins | `runtime/plugins.mdx` |
| Node.js compat | `runtime/nodejs-compat.mdx` |
| Web APIs | `runtime/web-apis.mdx` |
| Módulos / resolução | `runtime/module-resolution.mdx` |
| Env vars | `runtime/environment-variables.mdx` |
| Configuração (bunfig.toml) | `runtime/bunfig.mdx` |
| Watch mode | `runtime/watch-mode.mdx` |
| **Test runner** | |
| Escrevendo testes | `test/writing-tests.mdx` |
| Configuração | `test/configuration.mdx` |
| Mocks | `test/mocks.mdx` |
| Snapshots | `test/snapshots.mdx` |
| Code coverage | `test/code-coverage.mdx` |
| Lifecycle | `test/lifecycle.mdx` |
| Reporters | `test/reporters.mdx` |
| **Bundler** | |
| Loaders | `bundler/loaders.mdx` |
| Plugins | `bundler/plugins.mdx` |
| Macros | `bundler/macros.mdx` |
| Executables | `bundler/executables.mdx` |
| Hot reloading | `bundler/hot-reloading.mdx` |
| HTML estático | `bundler/html-static.mdx` |
| Minifier | `bundler/minifier.mdx` |
| **Package manager** | |
| CLI (`bun install`) | `pm/cli/` |
| Lockfile | `pm/lockfile.mdx` |
| Workspaces | `pm/workspaces.mdx` |
| Registros / escopos | `pm/scopes-registries.mdx` |
| bunx | `pm/bunx.mdx` |
| Lifecycle scripts | `pm/lifecycle.mdx` |
| **Guias** | |
| HTTP (fetch, serve, SSE, proxy) | `guides/http/*.mdx` |
| Process / spawn / signals | `guides/process/*.mdx` |
| Binary conversions | `guides/binary/*.mdx` |
| Write file | `guides/write-file/*.mdx` |
| Runtime misc | `guides/runtime/*.mdx` |
| Deployment | `guides/deployment/*.mdx` |

> Confirme existência de arquivos específicos via `Glob 'runtime/bun/**/*.mdx'` antes de `Read`.
> Não assuma nomes — o espelho segue o repositório oficial (subpath `docs/`).
