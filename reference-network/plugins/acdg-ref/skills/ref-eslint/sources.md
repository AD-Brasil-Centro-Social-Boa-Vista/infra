# sources.md — mapa do espelho ESLint

Base: `HBROOT/quality/eslint/`
onde `HBROOT = web/handbook/reference`

Versão espelhada: **ESLint 10.4.0** (flat config — padrão desde v9).

## Docs de uso (`docs/src/use/`)

| Tópico | Arquivo |
|--------|---------|
| Getting started / visão geral | `getting-started.md` |
| Core concepts (regras, plugins, parsers, processadores) | `core-concepts/index.md` |
| Glossário | `core-concepts/glossary.md` |
| **Flat config — visão geral** | `configure/index.md` |
| **Arquivo de configuração (eslint.config.js)** | `configure/configuration-files.md` |
| Combinar configs (spread, extends, overrides) | `configure/combine-configs.md` |
| Language options (ecmaVersion, sourceType, globals) | `configure/language-options.md` |
| Parsers customizados | `configure/parser.md` |
| Plugins no flat config | `configure/plugins.md` |
| Configurar regras (severity, options) | `configure/rules.md` |
| Ignorar arquivos/pastas | `configure/ignore.md` |
| Debug de configuração | `configure/debug.md` |
| **Guia de migração .eslintrc → flat config** | `configure/migration-guide.md` |
| CLI (flags, stdin, output) | `command-line-interface.md` |
| Formatters de saída | `formatters/index.md` |
| Suppressions (eslint-disable comments) | `suppressions.md` |
| Integrações (editores, CI, hooks) | `integrations.md` |
| Migrate to v9 | `migrate-to-9.0.0.md` |
| Migrate to v10 | `migrate-to-10.0.0.md` |
| Troubleshooting | `troubleshooting/index.md` |
| Version support | `version-support.md` |

## Docs de extensão (`docs/src/extend/`)

| Tópico | Arquivo |
|--------|---------|
| Visão geral de extensibilidade | `ways-to-extend.md` |
| Criar plugins (flat config) | `plugins.md` |
| Migrar plugin para flat config | `plugin-migration-flat-config.md` |
| Criar regras customizadas | `custom-rules.md`, `custom-rule-tutorial.md` |
| Parsers customizados | `custom-parsers.md` |
| Processadores customizados | `custom-processors.md` |
| Shareable configs | `shareable-configs.md` |
| Selectors (AST) | `selectors.md` |
| Languages (suporte a linguagens não-JS) | `languages.md` |

## Catálogo de regras core (`docs/src/rules/`)

312 arquivos `.md`, um por regra. Exemplos frequentes:

| Regra | Arquivo |
|-------|---------|
| `no-unused-vars` | `rules/no-unused-vars.md` |
| `no-undef` | `rules/no-undef.md` |
| `no-console` | `rules/no-console.md` |
| `eqeqeq` | `rules/eqeqeq.md` |
| `prefer-const` | `rules/prefer-const.md` |
| `no-var` | `rules/no-var.md` |
| `import/…` | N/A — regras `import/*` são de plugin externo, não core |

Para qualquer regra core, faça `Glob 'docs/src/rules/<nome>.md'`.

> Se um nome de regra não existir em `docs/src/rules/`, pode ser de um plugin
> externo (ex.: `@typescript-eslint/*`, `import/*`, `react/*`) — esses **não**
> estão no espelho. Declare `NÃO ENCONTRADO` e avise que é de plugin.
