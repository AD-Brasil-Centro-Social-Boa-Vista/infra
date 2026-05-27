# sources.md — mapa do espelho Apache Parquet

Base: `REFERENCE_ROOT/data-format/apache-parquet/`

## format/ — Especificação do Formato Apache Parquet

Fonte: HEAD do repo `apache/parquet-format` (Apache Software Foundation), coletado em 2026-05-27.
Versão de formato mais recente documentada no espelho: **2.11.0** (ver `format/CHANGES.md`).

| Arquivo | Tamanho | Conteúdo |
|---------|---------|----------|
| `README.md` | 5 KB | Visão geral, links para Thrift IDL, processo de evolução do formato |
| `Encodings.md` | 18 KB | Plain, RLE/Bit-Packing, Delta Binary Packed, Delta Length Byte Array, Delta Strings, Byte Stream Split, RLE Dictionary |
| `LogicalTypes.md` | 35 KB | String, Enum, UUID, Decimal, Date, Time, Timestamp, Integer, JSON, BSON, Float16, Geometry, Geography |
| `Compression.md` | 4 KB | Snappy, Gzip, Brotli, Zstd, LZ4 Raw, LZO — notas de compatibilidade |
| `BloomFilter.md` | 14 KB | Estrutura do filtro (Split Block Bloom Filter), hash (XXH64), integração com page header |
| `PageIndex.md` | 5 KB | ColumnIndex (min/max por página), OffsetIndex — predicate pushdown sem descompactar data pages |
| `Encryption.md` | 36 KB | AES-GCM, criptografia por coluna, gerenciamento de chaves, módulos de criptografia |
| `Geospatial.md` | 8 KB | Extensão geoespacial: GeometryType, CRS, encoding WKB |
| `VariantEncoding.md` | 29 KB | Variant: metadados, valor, encoding binário para dados semi-estruturados |
| `VariantShredding.md` | 22 KB | Shredding de Variant em colunas tipadas para query performance |
| `BinaryProtocolExtensions.md` | 10 KB | Extensões do protocolo Thrift binário para compatibilidade |
| `1_BASE64_ENCODING.md` | 1 KB | Considerações sobre Base64 em metadados |
| `CHANGES.md` | 18 KB | Changelog detalhado por versão (2.11.0, 2.10.0, 2.9.0, …) |
| `CONTRIBUTING.md` | 11 KB | Processo de contribuição (referência, não spec) |

> O arquivo Thrift IDL (`parquet.thrift`) **não está no espelho** — foi excluído da coleta.
> Para a definição binária exata de estruturas, referencie o GitHub da apache/parquet-format.

## parquet-go/ — Biblioteca Go

Fonte: HEAD do repo `parquet-go/parquet-go`, coletado em 2026-05-27.
Versão documentada no espelho: **v0.17.0** (pré-v1 — API pode ter breaking changes).
Requer Go 1.22+. Módulo: `github.com/parquet-go/parquet-go`.

| Arquivo | Tamanho | Conteúdo |
|---------|---------|----------|
| `README.md` | 27 KB | Motivação, instalação, API de leitura/escrita, GenericReader/GenericWriter, RowGroup, Column, Schema, exemplos de código |
| `CHANGELOG.md` | ~1 KB | v0.17.0: migração de módulo para `parquet-go/parquet-go`, drop Go 1.17, bug fixes |
| `CONTRIBUTING.md` | 2 KB | Guia de contribuição (referência, não spec) |
| `CODE_OF_CONDUCT.md` | 3 KB | Código de conduta (não técnico) |

> Nota: `parquet-go/` contém também `.CLAUDE.md` (metadado interno do espelho, não da lib).

## _SOURCE.md

Registro de coleta: datas, URLs de origem, comandos usados para baixar cada artefato.

## Versões do espelho

| Componente | Versão | Data coleta |
|------------|--------|------------|
| Parquet Format (spec) | 2.11.0 (HEAD) | 2026-05-27 |
| parquet-go (lib Go) | v0.17.0 (HEAD) | 2026-05-27 |
