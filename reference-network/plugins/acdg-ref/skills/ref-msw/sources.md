# sources.md — mapa do espelho MSW

Base: `REFERENCE_ROOT/testing/msw/`
Versão espelhada: **MSW latest main** (SHA `7a633bd`, captura 2026-05-27)

> Este espelho contém **dois sub-sites**: `mswjs.io` (docs principais) e `source.mswjs.io`
> (gerador de handlers a partir de OpenAPI/HAR). Todo caminho abaixo é relativo a
> `REFERENCE_ROOT/testing/msw/`.

## Metadado de origem

`_SOURCE.md` — versão, repo, SHA e data do espelho.

---

## Sub-site principal: `mswjs.io/src/content/docs/`

### Início rápido
| Tópico | Arquivo |
|--------|---------|
| Índice | `mswjs.io/src/content/docs/index.mdx` |
| Quick start | `mswjs.io/src/content/docs/quick-start.mdx` |
| Filosofia | `mswjs.io/src/content/docs/philosophy.mdx` |
| Defaults | `mswjs.io/src/content/docs/defaults.mdx` |
| Limitações | `mswjs.io/src/content/docs/limitations.mdx` |
| Comparação | `mswjs.io/src/content/docs/comparison.mdx` |
| FAQ | `mswjs.io/src/content/docs/faq.mdx` |
| Runbook (erros comuns) | `mswjs.io/src/content/docs/runbook.mdx` |

### HTTP (`http/`)
| Tópico | Arquivo |
|--------|---------|
| Visão geral | `mswjs.io/.../http/index.mdx` |
| Handling requests | `mswjs.io/.../http/handling-requests.mdx` |
| Interceptando requests (visão geral) | `mswjs.io/.../http/intercepting-requests/index.mdx` |
| Path parameters | `mswjs.io/.../http/intercepting-requests/path-parameters.mdx` |
| Query parameters | `mswjs.io/.../http/intercepting-requests/query-parameters.mdx` |
| Body | `mswjs.io/.../http/intercepting-requests/body.mdx` |
| Cookies (request) | `mswjs.io/.../http/intercepting-requests/cookies.mdx` |
| Mocking responses (visão geral) | `mswjs.io/.../http/mocking-responses/index.mdx` |
| Error responses | `mswjs.io/.../http/mocking-responses/error-responses.mdx` |
| Network errors | `mswjs.io/.../http/mocking-responses/network-errors.mdx` |
| Cookies (response) | `mswjs.io/.../http/mocking-responses/cookies.mdx` |
| Binary | `mswjs.io/.../http/mocking-responses/binary.mdx` |
| File uploads | `mswjs.io/.../http/mocking-responses/file-uploads.mdx` |
| Streaming | `mswjs.io/.../http/mocking-responses/streaming.mdx` |
| Redirects | `mswjs.io/.../http/mocking-responses/redirects.mdx` |
| Response patching (passthrough+modificação) | `mswjs.io/.../http/mocking-responses/response-patching.mdx` |
| Response timing (delay) | `mswjs.io/.../http/mocking-responses/response-timing.mdx` |
| Proxying requests | `mswjs.io/.../http/mocking-responses/proxying-requests.mdx` |
| Polling | `mswjs.io/.../http/mocking-responses/polling.mdx` |

### GraphQL (`graphql/`)
| Tópico | Arquivo |
|--------|---------|
| Visão geral | `mswjs.io/.../graphql/index.mdx` |
| Operations | `mswjs.io/.../graphql/intercepting-operations/operations.mdx` |
| Queries | `mswjs.io/.../graphql/intercepting-operations/queries.mdx` |
| Mutations | `mswjs.io/.../graphql/intercepting-operations/mutations.mdx` |
| Variables | `mswjs.io/.../graphql/intercepting-operations/variables.mdx` |
| Mocking responses | `mswjs.io/.../graphql/mocking-responses/index.mdx` |
| Errors | `mswjs.io/.../graphql/mocking-responses/errors.mdx` |
| Query batching | `mswjs.io/.../graphql/mocking-responses/query-batching.mdx` |
| Schema-first mocking | `mswjs.io/.../graphql/schema-first-mocking.mdx` |

### WebSocket (`websocket/`)
| Tópico | Arquivo |
|--------|---------|
| Visão geral | `mswjs.io/.../websocket/index.mdx` |
| Bindings | `mswjs.io/.../websocket/bindings.mdx` |
| Type safety | `mswjs.io/.../websocket/type-safety.mdx` |
| Event logs | `mswjs.io/.../websocket/event-logs.mdx` |
| Client events (visão geral) | `mswjs.io/.../websocket/client-events/index.mdx` |
| Sending data (cliente→server mock) | `mswjs.io/.../websocket/client-events/sending-data.mdx` |
| Broadcasting data | `mswjs.io/.../websocket/client-events/broadcasting-data.mdx` |
| Client-to-server forwarding | `mswjs.io/.../websocket/client-events/client-to-server-forwarding.mdx` |
| Closing client connection | `mswjs.io/.../websocket/client-events/closing-client-connection.mdx` |
| Erroring the connection | `mswjs.io/.../websocket/client-events/erroring-the-connection.mdx` |
| Server events (visão geral) | `mswjs.io/.../websocket/server-events/index.mdx` |
| Establishing server connection | `mswjs.io/.../websocket/server-events/establishing-server-connection.mdx` |
| Sending data (server→client) | `mswjs.io/.../websocket/server-events/sending-data.mdx` |
| Server-to-client forwarding | `mswjs.io/.../websocket/server-events/server-to-client-forwarding.mdx` |
| Closing server connection | `mswjs.io/.../websocket/server-events/closing-server-connection.mdx` |

### SSE (`sse/`)
| Tópico | Arquivo |
|--------|---------|
| Visão geral | `mswjs.io/.../sse/index.mdx` |
| Intercepting sources | `mswjs.io/.../sse/intercepting-sources/index.mdx` |
| Server events (vários) | `mswjs.io/.../sse/server-events/` (subdir) |

### API de referência (`api/`)
| Objeto/Função | Arquivo |
|---------------|---------|
| `http` | `mswjs.io/.../api/http.mdx` |
| `HttpResponse` | `mswjs.io/.../api/http-response.mdx` |
| `graphql` | `mswjs.io/.../api/graphql.mdx` |
| `ws` | `mswjs.io/.../api/ws.mdx` |
| `sse` | `mswjs.io/.../api/sse.mdx` |
| `bypass` | `mswjs.io/.../api/bypass.mdx` |
| `passthrough` | `mswjs.io/.../api/passthrough.mdx` |
| `delay` | `mswjs.io/.../api/delay.mdx` |
| `finalize` | `mswjs.io/.../api/finalize.mdx` |
| `getResponse` | `mswjs.io/.../api/get-response.mdx` |
| `isCommonAssetRequest` | `mswjs.io/.../api/is-common-asset-request.mdx` |
| Life-cycle events | `mswjs.io/.../api/life-cycle-events.mdx` |
| `RequestHandler` | `mswjs.io/.../api/request-handler.mdx` |
| `setupServer` (Node) | `mswjs.io/.../api/setup-server/index.mdx` |
| setupServer.listen | `mswjs.io/.../api/setup-server/listen.mdx` |
| setupServer.close | `mswjs.io/.../api/setup-server/close.mdx` |
| setupServer.use | `mswjs.io/.../api/setup-server/use.mdx` |
| setupServer.resetHandlers | `mswjs.io/.../api/setup-server/reset-handlers.mdx` |
| setupServer.restoreHandlers | `mswjs.io/.../api/setup-server/restore-handlers.mdx` |
| setupServer.boundary | `mswjs.io/.../api/setup-server/boundary.mdx` |
| setupServer.listHandlers | `mswjs.io/.../api/setup-server/list-handlers.mdx` |
| `setupWorker` (browser) | `mswjs.io/.../api/setup-worker/index.mdx` |
| setupWorker.start | `mswjs.io/.../api/setup-worker/start.mdx` |
| setupWorker.stop | `mswjs.io/.../api/setup-worker/stop.mdx` |
| setupWorker.use | `mswjs.io/.../api/setup-worker/use.mdx` |
| setupWorker.resetHandlers | `mswjs.io/.../api/setup-worker/reset-handlers.mdx` |
| setupWorker.restoreHandlers | `mswjs.io/.../api/setup-worker/restore-handlers.mdx` |
| setupWorker.listHandlers | `mswjs.io/.../api/setup-worker/list-handlers.mdx` |

### Integrações (`integrations/`)
| Ambiente | Arquivo |
|----------|---------|
| Browser | `mswjs.io/.../integrations/browser.mdx` |
| Node.js | `mswjs.io/.../integrations/node.mdx` |
| React Native | `mswjs.io/.../integrations/react-native.mdx` |

### Best Practices (`best-practices/`)
`structuring-handlers.mdx`, `avoid-request-assertions.mdx`, `network-behavior-overrides.mdx`,
`dynamic-mock-scenarios.mdx`, `managing-the-worker.mdx`, `custom-request-predicate.mdx`,
`typescript.mdx`

### Recipes (`recipes/`)
`global-response-delay.mdx`, `higher-order-resolver.mdx`, `keeping-mocks-in-sync.mdx`,
`vitest-browser-mode.mdx`, `using-base-url.mdx`, `merging-service-workers.mdx`, etc.

### Migração
`mswjs.io/.../migrations/1.x-to-2.x.mdx` — breaking changes v1→v2 (`rest`→`http`, remoção do `ctx`, `HttpResponse`, etc.)

---

## Sub-site gerador: `source.mswjs.io/src/content/docs/`

| Tópico | Arquivo |
|--------|---------|
| Visão geral | `source.mswjs.io/.../index.mdx` |
| Getting started | `source.mswjs.io/.../getting-started.mdx` |
| FAQ | `source.mswjs.io/.../faq.mdx` |
| API: fromOpenApi | `source.mswjs.io/.../api/from-open-api.mdx` |
| API: fromTraffic | `source.mswjs.io/.../api/from-traffic.mdx` |
| Integração OpenAPI | `source.mswjs.io/.../integrations/open-api.mdx` |
| Integração HAR | `source.mswjs.io/.../integrations/har.mdx` |
| Recipe: recording HAR | `source.mswjs.io/.../recipes/recording-har.mdx` |

> Para listar todos os arquivos disponíveis use `Glob 'mswjs.io/src/content/docs/**/*.mdx'`.
> Caminhos abreviados com `...` expandem para `src/content/docs` — sempre use o caminho completo com `Read`.
