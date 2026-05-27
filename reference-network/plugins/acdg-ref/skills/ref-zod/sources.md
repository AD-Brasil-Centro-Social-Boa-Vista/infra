# sources.md — mapa do espelho Zod

Base: `HBROOT/validation/zod/`
onde `HBROOT = /Users/gabriel_aderaldo/Desktop/Projetos/dev/envolve/roraima/conecta-raros-edge/web/handbook/reference`

> **Localização especial:** este universo está em `web/handbook/reference/`, NÃO em `infra/reference/`.
> Versão espelhada: **Zod 4** (fonte: `colinhacks/zod` branch `main`, pasta `packages/docs/content/`).
> **ESPELHO PARCIAL:** apenas 17 arquivos .md (~284 KB). Tópicos não encontrados podem existir
> na doc oficial sem estar espelhados — avise o consultante nesses casos.

## Mapa completo dos arquivos

### Documentação principal

| Tópico | Arquivo | Cobre |
|--------|---------|-------|
| Índice navegável | `README.md` | Estrutura geral, links para todos os arquivos |
| Intro / visão geral | `index.md` | O que é Zod, instalação, filosofia |
| Uso básico | `basics.md` | Definir schemas, `.parse()`, `.safeParse()`, error handling, `z.infer<>` |
| API reference completa | `api.md` | Todos os schemas (string, number, object, array, union, etc.), métodos, helpers |
| Error customization | `error-customization.md` | `error` por schema, error maps globais, `z.config()` |
| Error formatting | `error-formatting.md` | `.format()`, `.flatten()`, `prettifyError()`, `treeifyError()` |
| Metadata | `metadata.md` | `.meta()`, registries, geração de JSON Schema |
| JSON Schema | `json-schema.md` | Converter Zod schema para JSON Schema (`z.toJSONSchema()`) |
| Codecs | `codecs.md` | Transformações bidirecionais (parse + encode), `z.pipe()` |
| Ecosystem | `ecosystem.md` | Libs que integram com Zod (forms, ORMs, tRPC, etc.) — **menções, sem detalhe** |
| For library authors | `library-authors.md` | Aceitar Zod schemas em libs, `ZodType`, `input`/`output` types |

### Pacotes

| Pacote | Arquivo | Cobre |
|--------|---------|-------|
| `zod` (principal) | `packages/zod.md` | API do pacote principal |
| `zod/mini` | `packages/mini.md` | Variante tree-shakeable, diferenças de API |
| `zod/v4/core` | `packages/core.md` | Internals e plumbing compartilhado |

### Release notes / v4

| Tópico | Arquivo | Cobre |
|--------|---------|-------|
| O que mudou v3 → v4 | `v4/index.md` | Breaking changes, novos recursos |
| Changelog detalhado | `v4/changelog.md` | Histórico de versões do v4 |
| Política de versões | `v4/versioning.md` | SemVer do Zod, garantias de compatibilidade |

### Outros

| Tópico | Arquivo |
|--------|---------|
| Ordem canônica do site | `meta.json` |
| Blog: Clerk Fellowship | `blog/clerk-fellowship.md` |

## Estratégia de busca recomendada

1. **Para schemas e métodos específicos** → `api.md` (mais completo) ou `basics.md`
2. **Para diferenças v3→v4** → `v4/index.md`, depois `v4/changelog.md`
3. **Para erros** → `error-customization.md` ou `error-formatting.md`
4. **Para integrações com TanStack Form, ORMs, etc.** → `ecosystem.md` (⚠️ cobertura superficial)
5. **Para `zod/mini`** → `packages/mini.md`

## Notas de versão importantes (v3 → v4)

Ver `v4/index.md` para lista completa. Pontos críticos:
- Novo sistema de erros (ZodError reformulado)
- `z.config()` para error maps globais (substitui `z.setErrorMap()` de v3)
- `.safeParse()` retorna agora `{ success, data, error }` (inalterado) — mas ZodError estrutura mudou
- `@zod/mini` novo pacote tree-shakeable com API funcional
- Algumas mensagens de erro padrão mudaram
