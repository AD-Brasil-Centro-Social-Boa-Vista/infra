# sources.md — mapa do espelho TanStack

Base: `HBROOT/framework/` onde
`HBROOT = web/handbook/reference`

> ⚠️ Estas fontes ficam em `web/handbook/reference/`, NÃO em `infra/reference/`.

---

## TanStack Start (`tanstack-start/`) — ~1.x · 82 arquivos .md

| Tópico | Arquivo(s) |
|--------|-----------|
| Overview / Getting started | `framework/react/overview.md`, `framework/react/getting-started.md` |
| Build from scratch | `framework/react/build-from-scratch.md` |
| Start vs Next.js / comparação | `framework/react/start-vs-nextjs.md`, `framework/react/comparison.md` |
| Server functions (`createServerFn`) | `framework/react/guide/server-functions.md` |
| Server routes | `framework/react/guide/server-routes.md` |
| Middleware | `framework/react/guide/middleware.md` |
| SSR / rendering model | `framework/react/guide/selective-ssr.md`, `framework/react/guide/execution-model.md` |
| Server components | `framework/react/guide/server-components.md` |
| Hydration / erros | `framework/react/guide/deferred-hydration.md`, `framework/react/guide/hydration-errors.md` |
| Auth | `framework/react/guide/authentication.md`, `framework/react/guide/authentication-overview.md` |
| Environment variables | `framework/react/guide/environment-variables.md` |
| Hosting / deploy | `framework/react/guide/hosting.md` |
| Migração do Next.js | `framework/react/migrate-from-next-js.md` |
| ESLint plugin | `eslint/` |
| Navegação canônica (estrutura de seções) | `config.json` |

---

## TanStack Router (`tanstack-router/`) — ~1.x · 164 arquivos .md

| Tópico | Arquivo(s) |
|--------|-----------|
| Overview / Quick start | `overview.md`, `quick-start.md` |
| File-based routing | `routing/file-based-routing.md`, `routing/file-naming-conventions.md` |
| Code-based routing | `routing/code-based-routing.md` |
| Route trees / route matching | `routing/route-trees.md`, `routing/route-matching.md` |
| Data loading (`loader`) | `guide/data-loading.md`, `guide/external-data-loading.md`, `guide/deferred-data-loading.md` |
| Search params | `guide/search-params.md`, `how-to/setup-basic-search-params.md` |
| Path params | `guide/path-params.md` |
| Navegação (`Link`, `navigate`) | `guide/navigation.md`, `guide/link-options.md` |
| Code splitting | `guide/code-splitting.md`, `guide/automatic-code-splitting.md` |
| SSR | `guide/ssr.md` |
| Auth / rotas protegidas | `guide/authenticated-routes.md`, `how-to/setup-authentication.md` |
| Type safety / utilitários | `guide/type-safety.md`, `guide/type-utilities.md` |
| Router context | `guide/router-context.md` |
| Not found errors | `guide/not-found-errors.md` |
| API reference (router, route, link…) | `api/router.md`, `api/router/` |
| Migração do React Router | `how-to/migrate-from-react-router.md` |
| LLM support | `llm-support.md` |

---

## TanStack Query (`tanstack-query/`) — ~5.x · 494 arquivos .md · React adapter

| Tópico | Arquivo(s) |
|--------|-----------|
| Overview / Quick start | `framework/react/overview.md`, `framework/react/quick-start.md` |
| Defaults importantes | `framework/react/guides/important-defaults.md` |
| Caching / staleTime / gcTime | `framework/react/guides/caching.md` |
| Query keys | `framework/react/guides/query-keys.md` |
| Query functions | `framework/react/guides/query-functions.md` |
| Queries (useQuery) | `framework/react/guides/queries.md` |
| Mutations (useMutation) | `framework/react/guides/mutations.md` |
| Invalidation | `framework/react/guides/invalidations-from-mutations.md` |
| Optimistic updates | `framework/react/guides/optimistic-updates.md` |
| Infinite queries | `framework/react/guides/infinite-queries.md` |
| Paginated queries | `framework/react/guides/paginated-queries.md` |
| Prefetching | `framework/react/guides/prefetching.md` |
| Dependent queries | `framework/react/guides/dependent-queries.md` |
| SSR avançado | `framework/react/guides/advanced-ssr.md` |
| Migração v4 → v5 | `framework/react/guides/migrating-to-v5.md` |
| API: useQuery / useMutation / hooks | `framework/react/reference/` |
| API: QueryClient / QueryCache | `reference/QueryClient.md`, `reference/QueryCache.md` |
| Plugins (persistência) | `framework/react/plugins/` |

---

## TanStack Form (`tanstack-form/`) — latest · 252 arquivos .md · React adapter

| Tópico | Arquivo(s) |
|--------|-----------|
| Overview / Filosofia | `overview.md`, `philosophy.md` |
| Comparação (vs RHF, Formik) | `comparison.md` |
| Quick start (React) | `framework/react/quick-start.md` |
| Conceitos básicos / reatividade | `framework/react/guides/basic-concepts.md`, `framework/react/guides/reactivity.md` |
| Validação | `framework/react/guides/validation.md`, `framework/react/guides/dynamic-validation.md` |
| Erros customizados | `framework/react/guides/custom-errors.md` |
| Submit handling | `framework/react/guides/submission-handling.md` |
| Arrays / campos dinâmicos | `framework/react/guides/arrays.md` |
| Linked fields | `framework/react/guides/linked-fields.md` |
| SSR | `framework/react/guides/ssr.md` |
| Integração com UI libs | `framework/react/guides/ui-libraries.md` |
| API reference React | `framework/react/reference/` (functions/, interfaces/, type-aliases/) |
| API reference core | `reference/` (classes/, functions/, interfaces/) |

---

## TanStack Table (`tanstack-table/`) — ~8.x · 941 arquivos .md · React adapter

| Tópico | Arquivo(s) |
|--------|-----------|
| Introduction / Overview | `introduction.md`, `overview.md` |
| Column defs | `guide/column-defs.md`, `guide/columns.md` |
| Data / rows / cells | `guide/data.md`, `guide/rows.md`, `guide/cells.md` |
| Sorting | `guide/sorting.md` |
| Filtering | `guide/filters.md`, `guide/column-filtering.md`, `guide/global-filtering.md` |
| Pagination | `guide/pagination.md` |
| Row selection | `guide/row-selection.md` |
| Column pinning / ordering / visibility | `guide/column-pinning.md`, `guide/column-ordering.md`, `guide/column-visibility.md` |
| Grouping / expanding | `guide/grouping.md`, `guide/expanding.md` |
| Virtualization | `guide/virtualization.md` |
| Custom features | `guide/custom-features.md` |
| React adapter guide | `framework/react/react-table.md`, `framework/react/guide/` |
| API reference core | `reference/index/` |
