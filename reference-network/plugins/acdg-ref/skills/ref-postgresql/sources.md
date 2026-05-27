# sources.md — mapa do espelho PostgreSQL

Base: `REFERENCE_ROOT/database/postgresql/`

## Primário — PG 18 HTML (`html-18/docs/18/`)
Abrir navegação por `index.html`; índice remissivo por `bookindex.html`.

| Tópico | Página(s) inicial(is) |
|--------|------------------------|
| Índice / TOC | `index.html`, `bookindex.html` |
| Tutorial | `tutorial-start.html`, … |
| Tipos de dados | `datatype.html`, `datatype-numeric.html`, `datatype-datetime.html`, `datatype-json.html`, `datatype-character.html` |
| Funções e operadores | `functions.html`, `functions-json.html`, `functions-aggregate.html`, `functions-string.html`, `functions-datetime.html` |
| Comandos SQL (referência) | `sql-commands.html`, `sql-select.html`, `sql-insert.html`, `sql-update.html`, `sql-merge.html`, `sql-createtable.html`, `sql-createindex.html` |
| DDL / esquema | `ddl.html`, `ddl-partitioning.html`, `ddl-constraints.html`, `ddl-schemas.html` |
| Índices | `indexes.html`, `indexes-types.html` |
| Configuração do servidor (GUCs) | `runtime-config.html`, `runtime-config-connection.html`, `runtime-config-resource.html`, `runtime-config-wal.html`, `runtime-config-replication.html` |
| Concorrência / MVCC | `mvcc.html`, `transaction-iso.html`, `explicit-locking.html` |
| Replicação | `high-availability.html`, `logical-replication.html`, `runtime-config-replication.html` |
| Backup / restore | `backup.html`, `backup-dump.html`, `continuous-archiving.html` |
| Cliente psql / apps | `app-psql.html`, `reference-client.html`, `reference-server.html` |
| Catálogos do sistema | `catalogs.html`, `catalog-pg-*.html` |
| Release notes | `release.html`, `release-18.html` |

> Estes nomes seguem o padrão estável da doc PostgreSQL. Se algum não existir no espelho,
> confirme via `Glob 'html-18/docs/18/*.html'` + `Grep` pelo termo — **não** assuma.

## Secundário — manuais PDF
- `postgresql-15-A4.pdf` — comportamento da v15 (dev atual dos backends).
- `postgresql-16-A4.pdf` — alvo do deploy BV (ADR-009, Postgres único compartilhado).

Use os PDFs apenas quando a pergunta fixar 15/16 ou exigir comparação entre versões.
