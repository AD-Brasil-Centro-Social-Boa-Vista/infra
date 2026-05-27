# sources.md — mapa do espelho Vapor

Base: `REFERENCE_ROOT/web-framework/vapor/` e `REFERENCE_ROOT/auth-lib/vapor-jwt/`
onde `REFERENCE_ROOT = infra/reference`

## Como encontrar a versão EN

Todos os tópicos têm múltiplas versões por idioma. A versão **inglês** é sempre o arquivo
**sem sufixo de idioma**:

```
docs/basics/routing.md        ← EN (usar sempre)
docs/basics/routing.es.md     ← espanhol (ignorar salvo necessidade)
docs/basics/routing.ja.md     ← japonês
...
```

Para verificar quais versões EN existem para uma seção: `Glob 'web-framework/vapor/docs/<seção>/*.md'`
e filtre pelos que não têm ponto duplo no nome (ex.: `routing.md`, não `routing.es.md`).

---

## Primário — Vapor 4.121.3 (`web-framework/vapor/docs/`)

### getting-started/
| Tópico | Arquivo EN |
|--------|-----------|
| Estrutura de pastas do projeto | `getting-started/folder-structure.md` |
| Hello World (primeiro app) | `getting-started/hello-world.md` |
| Swift Package Manager | `getting-started/spm.md` |
| Xcode | `getting-started/xcode.md` |

### install/
| Tópico | Arquivo EN |
|--------|-----------|
| Linux | `install/linux.md` |
| macOS | `install/macos.md` |

### basics/
| Tópico | Arquivo EN |
|--------|-----------|
| Routing (registrar rotas, parâmetros, grupos) | `basics/routing.md` |
| Controllers | `basics/controllers.md` |
| Content (codificação/decodificação de Request/Response body) | `basics/content.md` |
| Client (HTTP client outbound) | `basics/client.md` |
| Async / await / EventLoopFuture | `basics/async.md` |
| Validação de entrada | `basics/validation.md` |
| Logging | `basics/logging.md` |
| Errors (AbortError, HTTPResponseError) | `basics/errors.md` |
| Environment (variáveis de ambiente, .env) | `basics/environment.md` |

### advanced/
| Tópico | Arquivo EN |
|--------|-----------|
| Middleware (criar, registrar, ordem) | `advanced/middleware.md` |
| Request (acesso a headers, body, query params) | `advanced/request.md` |
| Server (configuração do servidor HTTP) | `advanced/server.md` |
| Services (Application services, lifecycle) | `advanced/services.md` |
| Sessions (sessões do servidor) | `advanced/sessions.md` |
| Testing (XCTVapor, testable application) | `advanced/testing.md` |
| WebSockets | `advanced/websockets.md` |
| Files (FileMiddleware, stream) | `advanced/files.md` |
| Commands (CLI commands personalizados) | `advanced/commands.md` |
| Queues | `advanced/queues.md` |
| APNS (Apple Push Notifications) | `advanced/apns.md` |
| Tracing | `advanced/tracing.md` |

### fluent/
| Tópico | Arquivo EN |
|--------|-----------|
| Visão geral do ORM | `fluent/overview.md` |
| Model (definição de entidade, propriedades) | `fluent/model.md` |
| Migration (criar schema, alterar schema) | `fluent/migration.md` |
| Query (filtros, sort, limit, eager load) | `fluent/query.md` |
| Relations (parent, children, siblings) | `fluent/relations.md` |
| Schema (blueprint, enums, constraints) | `fluent/schema.md` |
| Transaction (transações atômicas) | `fluent/transaction.md` |
| Advanced Fluent | `fluent/advanced.md` |

### security/
| Tópico | Arquivo EN |
|--------|-----------|
| Autenticação (Bearer, session, basic, model authenticatable) | `security/authentication.md` |
| JWT (sign, verify, JWK/JWKS, vendors Apple/Google/Microsoft, claims) | `security/jwt.md` |
| Crypto (hashing, HMAC) | `security/crypto.md` |
| Passwords (BCrypt, Argon2) | `security/passwords.md` |

### deploy/
| Tópico | Arquivo EN |
|--------|-----------|
| Docker | `deploy/docker.md` |
| nginx (reverse proxy) | `deploy/nginx.md` |
| systemd (Linux service) | `deploy/systemd.md` |
| Supervisor | `deploy/supervisor.md` |
| DigitalOcean | `deploy/digital-ocean.md` |
| Heroku | `deploy/heroku.md` |
| Fly.io | `deploy/fly.md` |

### leaf/
| Tópico | Arquivo EN |
|--------|-----------|
| Visão geral do Leaf (templating) | `leaf/overview.md` |
| Getting started com Leaf | `leaf/getting-started.md` |
| Tags customizadas | `leaf/custom-tags.md` |

### redis/
| Tópico | Arquivo EN |
|--------|-----------|
| Visão geral do Redis | `redis/overview.md` |
| Sessions via Redis | `redis/sessions.md` |

### Raiz de docs/
| Tópico | Arquivo EN |
|--------|-----------|
| Release notes do Vapor | `release-notes.md` |
| Guia de migração (versões) | `upgrading.md` |

> Atenção: `release-notes.md` e `upgrading.md` na raiz têm versões ES/IT/JA/NL mas **não** DE ou KO.
> Sempre use o arquivo sem sufixo de idioma.

---

## Secundário — vapor/jwt 5.1.2 (`auth-lib/vapor-jwt/`)

| Documento | Caminho | Conteúdo |
|-----------|---------|---------|
| README principal | `auth-lib/vapor-jwt/README.md` | Instalação (SPM), integração com Vapor, exemplos de uso |
| DocC entry point | `auth-lib/vapor-jwt/Docs.docc/index.md` | Ponto de entrada do módulo JWT; referencia `security/jwt.md` do Vapor docs |

> Para JWT, **sempre leia também** `web-framework/vapor/docs/security/jwt.md`, que contém:
> algoritmos suportados (HMAC, ECDSA, EdDSA, RSA), configuração de `app.jwt.keys`,
> `JWTPayload`, `req.jwt.sign`, `req.jwt.verify`, JWK/JWKS via `use(jwksJSON:)`,
> e helpers para vendors (Apple, Google, Microsoft).
