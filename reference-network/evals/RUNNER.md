# Eval Runner — qualidade dos especialistas externos

Adaptação do método **eval-driven** do agentskills.io (`/skill-creation/evaluating-skills`).
Cada especialista `ref-<tech>` é avaliado rodando seus casos **com** e **sem** a skill e
comparando — o delta mostra se o especialista realmente agrega (e a que custo).

## Onde ficam os casos

`plugins/acdg-ref/skills/ref-<tech>/evals/evals.json` — você escreve à mão:
`{ skill_name, evals: [ { id, prompt, expected_output, files, expectations[] } ] }`.

`expectations[]` = asserções **verificáveis** (PASS/FAIL com evidência). Boas: específicas,
contáveis, observáveis. Ruins: vagas ("a resposta é boa") ou frágeis (exige frase literal).

## Workspace (não versionar — descartável)

```
infra/reference-network/.evals-workspace/ref-<tech>/
└── iteration-N/
    ├── eval-<id>/
    │   ├── with_skill/    { outputs/ , timing.json , grading.json }
    │   └── without_skill/ { outputs/ , timing.json , grading.json }
    └── benchmark.json
```

## Loop (por iteração)

1. **Spawnar runs isolados** — um subagente por (caso × configuração), contexto limpo:
   - `with_skill`: delegue ao `subagent_type: "acdg-ref:ref-<tech>"` (ou invoque a skill) com o `prompt` do caso.
   - `without_skill`: mesmo `prompt`, subagente genérico **sem** a skill/contrato (baseline).
   Salve a resposta em `outputs/` e, do task-notification, `total_tokens`/`duration_ms` em `timing.json`.
2. **Graduar** cada `expectation` contra a saída → `grading.json` (`passed` + `evidence` citando a saída).
   Exija evidência concreta para PASS. Asserções mecânicas (citou arquivo existente? leu fora da pasta?)
   podem ser verificadas por script/Grep nos logs.
3. **Agregar** → `benchmark.json` com `with_skill`/`without_skill`/`delta` (pass_rate, tokens, tempo).
4. **Analisar padrões**: remova asserções que passam nos dois (não medem nada); investigue as que
   falham nos dois; estude as que **só passam com a skill** (é o valor do especialista).
5. **Iterar o SKILL.md/contrato** com base nas falhas + transcript, mantendo **enxuto** (poucas regras
   boas > muitas), explicando o *porquê*. Rerun em `iteration-<N+1>/`.

Pare quando o pass_rate `with_skill` estabilizar alto e o feedback humano estiver vazio.

## O que importa medir nestes especialistas (além de acertar o fato)

A natureza "externa/fria" tem asserções recorrentes — reutilize-as em todo `ref-<tech>`:
- **Citou** arquivo real sob o universo do especialista (path existe no espelho).
- **Não leu código** (nenhum Read/Glob fora de `REFERENCE_ROOT/<área>/` — checável no transcript).
- **Recusou corretamente** quando o fato não está no espelho (`NÃO ENCONTRADO`) em vez de inventar.
- **Declarou a versão** consultada.
- **Não opinou** sobre o codebase / não recomendou mudança de aplicação.

Essas 5 são o "teste de fogo" do contrato e devem aparecer (adaptadas) em cada `evals.json`.

> Para `ref-postgresql`, os 3 casos em `skills/ref-postgresql/evals/evals.json` já cobrem:
> fato presente (max_connections), consciência de versão (MERGE/RETURNING) e o caso-armadilha
> de recusar código + achismo (índice no schema do projeto).
