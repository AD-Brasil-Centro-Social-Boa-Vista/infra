# sources.md — mapa do espelho pgx

Base: `REFERENCE_ROOT/db-driver/pgx/`
Versão espelhada: **pgx v5.9.1**
- Repo commit SHA: `4e4eaedb47b7b3cfba0a1b0a9e6a3f015764f046`
- Wiki commit SHA: `f63ffedac74f86413b1da1789b9346ced4429721`
- Data de coleta: 2026-05-27

## Arquivos disponíveis

### Raiz do repositório

| Arquivo | Tópicos cobertos |
|---------|-----------------|
| `README.md` | `pgxpool.New`, `pgxpool.Pool`, `pgx.Connect`, `pgx.Conn`, `Exec`, `Query`, `QueryRow`, `Scan`, `CollectRows`, `ForEachRow`, `pgx.Tx`, `BeginTx`, `Batch`, `CopyFrom`, `pgtype.TypeMap`, `stdlib.OpenDB`, `tracelog`, `multitracer`, exemplos inline de uso básico |
| `CHANGELOG.md` | Histórico detalhado de versões: v5.x, v4.x, v3.x — breaking changes, adições de API, correções |
| `CONTRIBUTING.md` | Regras de contribuição, política de dependências mínimas, processo de PR |
| `_SOURCE.md` | Metadados do espelho |

### Sub-pacotes (READMEs)

| Arquivo | Tópicos cobertos |
|---------|-----------------|
| `pgconn/README.md` | `PgConn` (camada low-level): autenticação, TLS, `Exec`, `ExecParams`, `ExecPrepared`, COPY, listen/notify, `WaitForNotification` |
| `pgproto3/README.md` | Wire protocol v3: `FrontendMessage`, `BackendMessage`, encoder/decoder; use cases: drivers, proxies, mock servers |
| `examples/README.md` | Índice: `chat` (listen/notify), `todo` (CRUD básico), `url_shortener` (web context) |
| `testsetup/README.md` | Setup de banco de teste (apenas para contribuidores) |
| `internal/pgio/README.md` | Utilitário interno de I/O do pgx (leitura/escrita de buffers) |

### Wiki

| Arquivo | Tópicos cobertos |
|---------|-----------------|
| `wiki/Home.md` | Índice da wiki com links para todos os tópicos |
| `wiki/Getting-started-with-pgx.md` | Tutorial nativo: `pgx.Connect`, `Exec`, `Query`, `Scan`, transações |
| `wiki/Getting-started-with-pgx-through-database-sql.md` | Tutorial via `database/sql`: `stdlib.OpenDB`, `pgxpool.Pool`, `*sql.DB` |
| `wiki/Error-Handling.md` | `pgconn.PgError`, campos `Code` (SQLSTATE), `Message`, `Detail`, `Hint`; como usar `errors.As` |
| `wiki/Automatic-Prepared-Statement-Caching.md` | Cache LRU de prepared statements: comportamento, tamanho padrão, como desabilitar, tradeoffs com PgBouncer |
| `wiki/Numeric-and-decimal-support.md` | Mapeamento NUMERIC/DECIMAL ↔ Go: `pgtype.Numeric`, `big.Int`, `shopspring/decimal`, limitações |
| `wiki/UUID-Support.md` | Mapeamento UUID ↔ Go: `pgtype.UUID`, `[16]byte`, `github.com/google/uuid` |

## Estratégia de busca recomendada

1. Para **API principal** (pool, conexão, query, rows, tx, batch) → `README.md`
2. Para **tratamento de erros e SQLSTATE** → `wiki/Error-Handling.md`
3. Para **tipos especiais** (UUID, numeric, decimal) → `wiki/UUID-Support.md` ou `wiki/Numeric-and-decimal-support.md`
4. Para **prepared statements e cache** → `wiki/Automatic-Prepared-Statement-Caching.md`
5. Para **versão de introdução de feature** → `CHANGELOG.md`
6. Para **protocolo de conexão de baixo nível** → `pgconn/README.md`
7. Dúvida de localização: `Grep` em `README.md` ou nos arquivos da `wiki/` pelo termo técnico

> Não há código-fonte Go (.go) no espelho — apenas Markdown de documentação e READMEs.
> Se o tópico não estiver nesses arquivos, a resposta é `NÃO ENCONTRADO no espelho offline (pgx v5.9.1)`.
