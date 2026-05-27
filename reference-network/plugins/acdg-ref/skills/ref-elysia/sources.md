# sources.md — mapa do espelho Elysia

Base: `REFERENCE_ROOT/web-framework/elysia/`
Versão espelhada: **Elysia 1.4.28** (commit `b8eced1aa771a06ce4c75b777a2e7980d087d70f`, 2026-05-27, 108 arquivos `.md`)

Metadados da coleta: `_SOURCE.md` (na raiz do espelho).

---

## essential/ — núcleo do framework

| Tópico | Arquivo |
|--------|---------|
| Rotas (`.get`, `.post`, etc.), path params, grupos | `essential/route.md` |
| Handler, Context (`body`, `query`, `params`, `headers`, `set`, `status`, `path`, `request`), resposta inline | `essential/handler.md` |
| Validação com TypeBox (`t.*`), `body`, `query`, `params`, `headers`, `response`, `cookie`, `ValidationError` | `essential/validation.md` |
| Lifecycle hooks — ordem completa, `onRequest`, `parse`, `transform`, `beforeHandle`, `afterHandle`, `mapResponse`, `onError`, `afterResponse` | `essential/life-cycle.md` |
| Plugin — `.use()`, escopo, encapsulação, `name` para deduplicação, `seed` | `essential/plugin.md` |
| Melhores práticas de estrutura | `essential/best-practice.md` |

---

## patterns/ — padrões e recursos avançados

| Tópico | Arquivo |
|--------|---------|
| `state`, `decorate`, `derive`, `resolve` — extensão de Context | `patterns/extends-context.md` |
| TypeBox avançado — tipos customizados, `t.Transform`, coerção | `patterns/typebox.md` |
| Macro — `.macro()`, propriedades que controlam hooks/schema | `patterns/macro.md` |
| Tratamento de erros — `onError`, `error()`, status customizado | `patterns/error-handling.md` |
| Cookie — leitura, escrita, `set.cookie`, assinatura | `patterns/cookie.md` |
| WebSocket — `.ws()`, `subscribe`, `publish`, eventos | `patterns/websocket.md` |
| OpenAPI — geração automática de spec a partir de schemas | `patterns/openapi.md` |
| TypeScript — inferência, generics, `InferHandler`, `InferContext` | `patterns/typescript.md` |
| Testes unitários — `handle()` sem servidor, `expect()` | `patterns/unit-test.md` |
| Trace — `.trace()`, instrumentação fina de lifecycle | `patterns/trace.md` |
| OpenTelemetry | `patterns/opentelemetry.md` |
| Configuração do construtor — opções de `new Elysia({...})` | `patterns/configuration.md` |
| Deploy — Bun, Docker, variáveis de ambiente | `patterns/deploy.md` |
| Mount — montar sub-aplicações WinterCG | `patterns/mount.md` |
| Fullstack dev server | `patterns/fullstack-dev-server.md` |

---

## tutorial/ — getting-started (passo a passo)

| Tópico | Arquivo |
|--------|---------|
| Primeira rota | `tutorial/getting-started/your-first-route/index.md` |
| Handler e Context | `tutorial/getting-started/handler-and-context/index.md` |
| Validação | `tutorial/getting-started/validation/index.md` |
| Guard (bulk hooks + schema) | `tutorial/getting-started/guard/index.md` |
| Lifecycle | `tutorial/getting-started/life-cycle/index.md` |
| Plugin | `tutorial/getting-started/plugin/index.md` |
| Encapsulação | `tutorial/getting-started/encapsulation/index.md` |
| Status e headers | `tutorial/getting-started/status-and-headers/index.md` |

---

## tutorial/ — patterns

| Tópico | Arquivo |
|--------|---------|
| Error handling (tutorial) | `tutorial/patterns/error-handling/index.md` |
| Cookie (tutorial) | `tutorial/patterns/cookie/index.md` |
| Extend context (tutorial) | `tutorial/patterns/extends-context/index.md` |
| Macro (tutorial) | `tutorial/patterns/macro/index.md` |
| Standalone schema | `tutorial/patterns/standalone-schema/index.md` |
| Validation error | `tutorial/patterns/validation-error/index.md` |

---

## tutorial/ — features

| Tópico | Arquivo |
|--------|---------|
| End-to-end type safety | `tutorial/features/end-to-end-type-safety/index.md` |
| Mount | `tutorial/features/mount/index.md` |
| OpenAPI | `tutorial/features/openapi/index.md` |
| Testes unitários (feature) | `tutorial/features/unit-test/index.md` |

---

## eden/ — cliente type-safe

| Tópico | Arquivo |
|--------|---------|
| Overview Eden | `eden/overview.md` |
| Instalação | `eden/installation.md` |
| Eden Fetch | `eden/fetch.md` |
| Eden Test (testes com cliente tipado) | `eden/test.md` |
| Treaty — overview | `eden/treaty/overview.md` |
| Treaty — parâmetros | `eden/treaty/parameters.md` |
| Treaty — resposta | `eden/treaty/response.md` |
| Treaty — configuração | `eden/treaty/config.md` |
| Treaty — WebSocket | `eden/treaty/websocket.md` |
| Treaty — testes unitários | `eden/treaty/unit-test.md` |
| Treaty legacy (Eden 1 → Treaty 2) | `eden/treaty/legacy.md` |

---

## plugins/ — plugins oficiais

| Plugin | Arquivo |
|--------|---------|
| Visão geral de plugins | `plugins/overview.md` |
| CORS | `plugins/cors.md` |
| JWT | `plugins/jwt.md` |
| Bearer | `plugins/bearer.md` |
| Static files | `plugins/static.md` |
| HTML | `plugins/html.md` |
| Swagger / scalar | `plugins/swagger.md` |
| OpenAPI (plugin) | `plugins/openapi.md` |
| GraphQL Apollo | `plugins/graphql-apollo.md` |
| GraphQL Yoga | `plugins/graphql-yoga.md` |
| OpenTelemetry (plugin) | `plugins/opentelemetry.md` |
| Server timing | `plugins/server-timing.md` |
| Cron | `plugins/cron.md` |

---

## integrations/ — integrações

| Integração | Arquivo |
|-----------|---------|
| Drizzle ORM | `integrations/drizzle.md` |
| Prisma | `integrations/prisma.md` |
| Better Auth | `integrations/better-auth.md` |
| AI SDK | `integrations/ai-sdk.md` |
| TanStack Start | `integrations/tanstack-start.md` |
| Next.js | `integrations/nextjs.md` |
| Nuxt | `integrations/nuxt.md` |
| SvelteKit | `integrations/sveltekit.md` |
| Astro | `integrations/astro.md` |
| Expo | `integrations/expo.md` |
| Cloudflare Worker | `integrations/cloudflare-worker.md` |
| Deno | `integrations/deno.md` |
| Node.js | `integrations/node.md` |
| Netlify | `integrations/netlify.md` |
| Vercel | `integrations/vercel.md` |
| React Email | `integrations/react-email.md` |
| Cheat sheet | `integrations/cheat-sheet.md` |

---

## Demais arquivos relevantes

| Arquivo | Conteúdo |
|---------|----------|
| `at-glance.md` | Proposta de valor, comparação de performance |
| `key-concept.md` | Conceitos centrais (plugin system, type system) |
| `quick-start.md` | Instalação mínima, primeiro servidor |
| `table-of-content.md` | Índice completo da documentação |
| `_SOURCE.md` | Metadados do espelho (versão, commit, data) |
| `internal/jit-compiler.md` | Internals do compilador JIT |

> Estes caminhos foram verificados via `find` no espelho real (2026-05-27).
> Se um arquivo não existir, confirme via `Glob 'web-framework/elysia/**/*.md'`
> antes de declarar ausência — **não** assuma.
