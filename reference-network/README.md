# ACDG Reference Network

Uma **rede de especialistas de referência** em dois níveis para o deploy ACDG-BV (Roraima).
A ideia central: separar **quem sabe a doc** de **quem conhece o código**.

```
┌─ NÍVEL 1 · EXTERNOS (consulta fria) ─────────────────────────────┐
│  Especialistas read-only, um por tecnologia, ancorados no         │
│  espelho offline infra/reference/. Citam a doc oficial ou         │
│  recusam. NUNCA tocam código, NUNCA usam training data.           │
│  Plugin: acdg-ref  →  /acdg-ref:ref-<tech>                        │
└───────────────────────────────────────────────────────────────────┘
                 ▲  fato frio citado            │ pergunta factual
                 │                               ▼
┌─ NÍVEL 2 · INTERNOS (contexto quente) ───────────────────────────┐
│  Os agentes/skills que JÁ existem em cada repo (swift-expert,     │
│  go-quality-checker, web-orchestrator, …). Conhecem o código e    │
│  o contexto. Delegam o fato frio ao externo e aplicam ao repo.    │
└───────────────────────────────────────────────────────────────────┘
```

- **Externo** = balcão de biblioteca. Pergunta entra, resposta **citada** sai. Não conhece seu projeto.
- **Interno** = engenheiro do time. Conhece o código, decide, e consulta o balcão quando precisa de um fato preciso/versionado em vez de chutar de memória desatualizada.

Metodologia de qualidade dos especialistas: **eval-driven** (agentskills.io) — ver [`evals/RUNNER.md`](./evals/RUNNER.md).
Regras que todo externo obedece: [`CONSULTATION-CONTRACT.md`](./CONSULTATION-CONTRACT.md).

---

## Estrutura

```
infra/reference-network/
├── .claude-plugin/marketplace.json     # marketplace local "acdg-reference-network"
├── CONSULTATION-CONTRACT.md            # contrato dos especialistas externos
├── README.md                          # este arquivo
├── evals/RUNNER.md                    # loop de avaliação (with/without → benchmark)
└── plugins/
    └── acdg-ref/                       # 1 plugin = TODOS os externos (namespaced)
        ├── .claude-plugin/plugin.json
        ├── skills/
        │   └── ref-postgresql/         # ◀ TEMPLATE-OURO (completo)
        │       ├── SKILL.md            #   identidade + protocolo + universo
        │       ├── sources.md          #   mapa exato do espelho
        │       └── evals/evals.json    #   3 casos (fato / versão / recusa)
        └── agents/
            └── ref-postgresql.md       # agent fino p/ delegação isolada
```

Cada novo especialista = mesma forma: `skills/ref-<tech>/{SKILL.md,sources.md,evals/evals.json}` + `agents/ref-<tech>.md`, ancorado na sua subpasta de `infra/reference/`.

---

## Instalação (já feita nos 4 repos — declarativa)

Os 4 repos (`social-care`, `people-context`, `analysis-bi`, `web`) já têm no `.claude/settings.json`
**comitado** as chaves que registram o marketplace e habilitam o plugin (sem rodar `/plugin` à mão):

```json
{
  "extraKnownMarketplaces": {
    "acdg-reference-network": {
      "source": { "source": "directory", "path": "../infra/reference-network" }
    }
  },
  "enabledPlugins": { "acdg-ref@acdg-reference-network": true },
  "permissions": { "allow": [
    "Read(../infra/reference/**)",
    "Read(../web/handbook/reference/**)"
  ] }
}
```
**Caminhos RELATIVOS (portáveis)** — nada de `/Users/<nome>/...`. Os 4 repos de serviço são irmãos de
`infra/` e `web/` no monorepo, então `../infra/reference-network`, `../infra/reference/**` e
`../web/handbook/reference/**` resolvem para o mesmo lugar em qualquer checkout/máquina. Os dois
`Read`-allow deixam os externos lerem o espelho sem prompt (incl. os 4 de universo-handbook:
`ref-tanstack`, `ref-tailwind`, `ref-zod`, `ref-eslint`). Ver a recipe de resolução em
[`CONSULTATION-CONTRACT.md`](./CONSULTATION-CONTRACT.md).

**Para ativar:** reinicie a sessão do Claude Code no repo, ou rode `/reload-plugins`. Depois:
`/acdg-ref:ref-<tech> <pergunta>` (direto) ou delegue via `subagent_type: "acdg-ref:ref-<tech>"`.

> Nota: o `path` do marketplace é **absoluto** (deploy single-VPS, tudo sob um root). Se o
> repositório for movido, atualize o `path` nos 4 `settings.json` e o `REFERENCE_ROOT` do contrato.

---

## Como os agentes INTERNOS consultam (padrão a adotar)

Trecho a colar no orquestrador/expert de cada repo (ajustar a tech):

> **Fato frio de Postgres?** Não responda de memória. Delegue ao externo:
> `subagent_type: "acdg-ref:ref-postgresql"` com a pergunta factual. Receba a resposta **citada**,
> então aplique ao contexto deste repo (schema, migrações, ADRs). Se o externo devolver
> `NÃO ENCONTRADO`, **não** preencha a lacuna inventando — escale ou baixe a doc faltante.

---

## Roadmap de especialistas (a produzir após validar o template)

Um `ref-<id>` por target baixado em `infra/reference/` (ver `infra/doc-references.yaml`).
Prioridade pela transversalidade/uso:

| Prioridade | ref-<tech> | Universo (`infra/reference/…`) | Consumido por (internos) |
|-----------|------------|-------------------------------|--------------------------|
| ✅ template | `ref-postgresql` | `database/postgresql/` | todos |
| ✅ P1 | `ref-nats` | `messaging/nats-jetstream/` + clients | social-care, people-context, analysis-bi |
| ✅ P1 | `ref-vapor` | `web-framework/vapor/` + `auth-lib/vapor-jwt` | social-care |
| ✅ P1 | `ref-elysia` | `web-framework/elysia/` | people-context |
| ✅ P1 | `ref-authentik` | `auth-idp/authentik/` | todos (IdP único) |
| ✅ P1 | `ref-caddy` | `infra/caddy/` | web/infra |
| ✅ P1 | `ref-opentofu-magalu` | `iac/opentofu-terraform/` + `iac/magalu-cloud-provider/` | web/infra |
| ✅ P1 | `ref-docker-compose` | `infra/docker-compose/` | infra |
| ✅ P2 | `ref-go` · `ref-chi` · `ref-pgx` | `language/go`, `web-framework/chi`, `db-driver/pgx` | analysis-bi |
| ✅ P2 | `ref-bun` · `ref-typescript` · `ref-node` | `runtime/bun`, `language/typescript`, `runtime/node` | people-context, web |
| ✅ P2 | `ref-tanstack` · `ref-react` · `ref-react-aria` · `ref-tailwind` · `ref-zod` | `framework/…`, `ui/…`, `validation/zod` | web |
| ✅ P2 | `ref-vitest` · `ref-playwright` · `ref-msw` · `ref-eslint` · `ref-prettier` | `testing/…`, `quality/…` | web |
| ✅ P3 | `ref-fhir` · `ref-parquet` · `ref-lgpd` | `interop-health/…`, `data-format/…`, `compliance/` | analysis-bi |
| ✅ P3 | `ref-pino` · `ref-opentelemetry` · `ref-glitchtip` · `ref-infisical` · `ref-vaultwarden` | `logging/…`, `observability/…`, `secrets/…` | web/infra |

Status atual: **REDE COMPLETA — 33 especialistas** (template `ref-postgresql` + 7 P1 + 25 P2/P3), todos read-only (Read/Grep/Glob), cada um com `SKILL.md` + `sources.md` + `evals/evals.json` + agent fino. Plugin instalado nos 4 repos + internos fiados.
- **Benchmark COMPLETO** — rede inteira (32 especialistas) benchmarkada. P1 (`.evals-workspace/P1-benchmark/`): with 100% vs baseline 26% → Δ +0.74. P2/P3 (`.evals-workspace/P2P3-benchmark/`): with 100% (369/369) vs baseline 26% (97/369) → Δ +0.74. Template `ref-postgresql`: Δ +0.71. Padrão consistente em escala.
- **Universos duplos:** a maioria vive em `infra/reference/`; `ref-tanstack`/`ref-tailwind`/`ref-zod`/`ref-eslint` apontam para `web/handbook/reference/` (já espelhado lá). `ref-fhir` cita o `.zip` da spec R4 (com `extracted/` leve); `ref-glitchtip`/`ref-web-vitals` têm trechos em HTML.
- **Read-allow duplo (✅ feito):** os 4 `settings.json` permitem `Read` em `infra/reference/**` **e** `web/handbook/reference/**` — sem prompt em nenhum especialista, mesmo cross-repo.
