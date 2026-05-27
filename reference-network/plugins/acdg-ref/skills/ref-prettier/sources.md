# sources.md — mapa do espelho Prettier

Base: `REFROOT/quality/prettier/`
onde `REFROOT = /Users/gabriel_aderaldo/Desktop/Projetos/dev/envolve/roraima/conecta-raros-edge/infra/reference`

Versão espelhada: **Prettier 3.x** (HEAD: d33a1b0, capturado em 2026-05-27).

## Arquivos do espelho (24 arquivos `.md` + `_SOURCE.md`)

| Categoria | Arquivo | Tópico principal |
|-----------|---------|-----------------|
| **Opções** | `options.md` | Todas as opções com defaults, tipo e exemplos |
| **Config** | `configuration.md` | Formatos de arquivo de config (`.prettierrc.*`, `prettier.config.*`, `package.json#prettier`) |
| **CLI** | `cli.md` | Flags (`--write`, `--check`, `--parser`, `--find-config-path`, `--ignore-path`…) |
| **API** | `api.md` | API programática: `format()`, `check()`, `getFileInfo()`, `resolveConfig()` |
| **Ignorar** | `ignore.md` | `.prettierignore` e comentários `// prettier-ignore` / `/* prettier-ignore */` |
| **Plugins** | `plugins.md` | Sistema de plugins, parsers customizados, como usar (`--plugin`) |
| **Linters** | `integrating-with-linters.md` | `eslint-config-prettier`, `eslint-plugin-prettier`, conflitos de regras |
| **Pre-commit** | `precommit.md` | `lint-staged` + husky; `pretty-quick` |
| **CI** | `ci.md` | Uso de `--check` em pipelines, exit codes |
| **Editores** | `editors.md` | VS Code, Sublime, Atom |
| | `vim.md` | Vim/Neovim |
| | `webstorm.md` | JetBrains IDEs |
| **Sharing** | `sharing-configurations.md` | Como publicar e consumir configs Prettier reutilizáveis |
| **Watch** | `watching-files.md` | `--watch` flag (modo watch) |
| **Browser** | `browser.md` | Uso no browser via CDN/bundle |
| **Filosofia** | `option-philosophy.md` | Por que o Prettier tem poucas opções |
| | `rationale.md` | Filosofia de "opinionated formatter" |
| | `why-prettier.md` | Casos de uso e benefícios |
| **Comparação** | `comparison.md` | Prettier vs ESLint formatters vs dprint vs biome |
| **Internos** | `technical-details.md` | Como o Prettier parseia e imprime |
| **Intro** | `index.md`, `install.md` | O que é Prettier; instalação |
| **Enterprise** | `for-enterprise.md` | Suporte empresarial |
| **Ecossistema** | `related-projects.md` | Projetos relacionados |

## Opções mais consultadas (de `options.md`)

| Opção | Default (v3) | Nota de versão |
|-------|-------------|----------------|
| `printWidth` | `80` | — |
| `tabWidth` | `2` | — |
| `useTabs` | `false` | — |
| `semi` | `true` | — |
| `singleQuote` | `false` | — |
| `trailingComma` | `"all"` | **mudou no v3** (era `"es5"` no v2) |
| `bracketSpacing` | `true` | — |
| `bracketSameLine` | `false` | — |
| `arrowParens` | `"always"` | — |
| `endOfLine` | `"lf"` | — |

> Confirme sempre no `options.md` do espelho — não assuma defaults de memória.
