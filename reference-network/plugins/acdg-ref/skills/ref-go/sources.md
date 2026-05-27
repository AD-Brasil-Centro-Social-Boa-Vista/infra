# sources.md — mapa do espelho Go

Base: `REFERENCE_ROOT/language/go/`
Versão espelhada: **Go 1.25.0** (wget de go.dev em 2026-05-27)

## Arquivos disponíveis

| Arquivo | Origem | Tópicos cobertos |
|---------|--------|-----------------|
| `spec.html` | https://go.dev/ref/spec | Tipos (booleanos, numéricos, string, array, slice, map, struct, pointer, function, interface, channel); declarações; expressões; instruções; goroutines; `select`; `defer`; `panic`/`recover`; generics (type parameters, constraints); módulos; pacotes; visibilidade |
| `effective_go.html` | https://go.dev/doc/effective_go | Formatação (`gofmt`); comentários; nomeação (MixedCaps, acrônimos); controle de fluxo; funções (múltiplos retornos, named results); dados (make, new); interfaces; métodos; errors; goroutines; canais; `sync`; web servers idiomáticos |
| `code_review_comments.html` | https://go.dev/wiki/CodeReviewComments | Comentários de doc; erros (não usar `fmt.Errorf` wrapping sem sentido); goroutine lifetimes; in-band errors; interfaces; nomeação; nil slices; tratamento de erros; receiver names; retorno de valores; `sync.Mutex`; testes; `time.Time`; úteis de revisão |
| `_SOURCE.md` | local | Metadados do espelho (versão, SHA, data, comando de coleta) |

## Estratégia de busca recomendada

1. Para **comportamento garantido da linguagem** (semântica, tipos, regras de assignability) → `spec.html`
2. Para **idioma Go e boas práticas** → `effective_go.html`
3. Para **padrões comuns de revisão de código** → `code_review_comments.html`
4. Dúvida de localização: `Grep` nos três arquivos pelo termo técnico (ex.: `goroutine`, `interface`, `defer`)

> Estes são os únicos arquivos do espelho. Se o tópico não estiver em nenhum deles,
> a resposta é `NÃO ENCONTRADO no espelho offline (Go 1.25)` — sem inferência de training data.
