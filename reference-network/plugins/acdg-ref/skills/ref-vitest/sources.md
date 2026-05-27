# sources.md — mapa do espelho Vitest

Base: `REFERENCE_ROOT/testing/vitest/`
Versão espelhada: **Vitest 3.x** (HEAD 5.0.0-beta.3, SHA `152750ec`, captura 2026-05-27)

## Metadado de origem

`_SOURCE.md` — versão, repo, SHA e data do espelho.

## Guia (`guide/`)

| Tópico | Arquivo(s) |
|--------|------------|
| Visão geral / features | `guide/index.md`, `guide/features.md`, `guide/why.md` |
| Comparações (vs Jest, etc.) | `guide/comparisons.md` |
| Lifecycle dos testes | `guide/lifecycle.md` |
| Mocking — guia geral | `guide/mocking.md` |
| Mocking — funções | `guide/mocking/functions.md` |
| Mocking — módulos | `guide/mocking/modules.md` |
| Mocking — timers | `guide/mocking/timers.md` |
| Mocking — datas | `guide/mocking/dates.md` |
| Mocking — classes | `guide/mocking/classes.md` |
| Mocking — sistema de arquivos | `guide/mocking/file-system.md` |
| Mocking — globals | `guide/mocking/globals.md` |
| Mocking — requests | `guide/mocking/requests.md` |
| Ambientes (jsdom, happy-dom, node) | `guide/environment.md` |
| CLI | `guide/cli.md`, `guide/cli-generated.md` |
| Coverage | `guide/coverage.md` |
| Snapshot | `guide/snapshot.md` |
| Filtering | `guide/filtering.md` |
| Tags | `guide/test-tags.md` |
| Paralelismo | `guide/parallelism.md` |
| Melhorias de performance | `guide/improving-performance.md` |
| Migração / changelog | `guide/migration.md` |
| Erros comuns | `guide/common-errors.md` |
| Debugging | `guide/debugging.md` |
| IDE | `guide/ide.md` |
| In-source testing | `guide/in-source.md` |
| Reporters | `guide/reporters.md` |
| Test context | `guide/test-context.md` |
| Annotations | `guide/test-annotations.md` |
| Projects | `guide/projects.md` |
| Browser mode (guia) | `guide/browser/` (subdir) |
| Plugins | `guide/using-plugins.md` |
| Open Telemetry | `guide/open-telemetry.md` |
| Recipes | `guide/recipes/` (subdir) |
| Mocking — avançado | `guide/advanced/` (subdir) |

## API (`api/`)

| Tópico | Arquivo |
|--------|---------|
| `test` / `it` | `api/test.md` |
| `describe` | `api/describe.md` |
| `expect` + matchers | `api/expect.md` |
| `expect.extend` (matchers customizados) | `api/expect.md` |
| `expectTypeOf` | `api/expect-typeof.md` |
| `assertType` | `api/assert-type.md` |
| `assert` (Chai) | `api/assert.md` |
| Hooks (`beforeEach`, `afterAll`, …) | `api/hooks.md` |
| `vi` (mocks, timers, spies) | `api/vi.md` |
| `MockInstance` / mock functions | `api/mock.md` |
| Browser API | `api/browser/` (subdir) |
| Advanced API | `api/advanced/` (subdir) |

## Configuração (`config/`)

Um arquivo `.md` por opção de configuração (ex.: `config/coverage.md`, `config/environment.md`,
`config/deps.md`, etc.). Faça `Glob 'config/*.md'` para ver a lista completa.

## Releases / Blog

| Arquivo | Conteúdo |
|---------|---------|
| `releases.md` | Changelog de releases |
| `blog.md` / `blog/` | Posts do blog (novas features, motivações) |

> Estes nomes seguem a estrutura do repositório oficial. Se algum não existir,
> confirme via `Glob 'guide/**/*.md'` ou `Glob 'api/**/*.md'` — **não** assuma.
