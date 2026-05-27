# sources.md — mapa do espelho chi

Base: `REFERENCE_ROOT/web-framework/chi/`
Versão espelhada: **chi v5.2.5** (commit SHA `05f1ef7bb50b8a8cb33a9dd3ba1c5b94bff0f723`, clonado em 2026-05-27)

## Arquivos disponíveis

| Arquivo | Tópicos cobertos |
|---------|-----------------|
| `README.md` | `chi.NewRouter()`, `r.Get/Post/Put/Delete/Patch`, grupos (`r.Group`, `r.Route`), sub-routers (`r.Mount`), parâmetros de URL (`chi.URLParam`, `{id}`, `{id:[0-9]+}`), wildcards (`*`), middlewares built-in (`Logger`, `Recoverer`, `RequestID`, `RealIP`, `StripSlashes`, `Compress`, `Timeout`, `Throttle`, `BasicAuth`, `CleanPath`, `Heartbeat`, `Profiler`, `Redirect`), inline middlewares (`r.Use`), resposta e contexto |
| `CHANGELOG.md` | Histórico de versões desde v1 — breaking changes, adições, deprecações por versão do chi |
| `SECURITY.md` | Política de segurança, como reportar vulnerabilidades |
| `CONTRIBUTING.md` | Processo de contribuição, regras de PR |
| `_examples/README.md` | Lista de exemplos: `rest`, `graceful`, `fileserver`, `todos`, etc. |
| `_examples/rest/routes.md` | Exemplo REST completo: estrutura de rotas, agrupamento, uso de middlewares, parâmetros em contexto real |
| `_SOURCE.md` | Metadados: versão, commit SHA, data de coleta, comando git |

## Estratégia de busca recomendada

1. Para **API do router, middlewares, URL params** → `README.md` (fonte primária)
2. Para **quando uma feature foi adicionada ou houve breaking change** → `CHANGELOG.md`
3. Para **exemplo de uso em contexto REST** → `_examples/rest/routes.md`
4. Dúvida de localização: `Grep` em `README.md` ou `CHANGELOG.md` pelo nome do middleware / método

> Estes são os únicos arquivos do espelho. Não há código-fonte Go (.go) nem godoc HTML
> no espelho — apenas Markdown de documentação. Se o tópico não estiver nesses arquivos,
> a resposta é `NÃO ENCONTRADO no espelho offline (chi v5.2.5)` — sem inferência de training data.
