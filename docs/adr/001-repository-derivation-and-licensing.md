# ADR-BV-001 — Estratégia de derivação de repositórios e licenciamento (ACDG-BV)

| Campo | Valor |
|-------|-------|
| **Status** | ✅ Accepted |
| **Data** | 2026-05-27 |
| **Decisor** | Gabriel Aderaldo + Claude |
| **Tags** | repos, fork, open-source, licensing, agpl, mit, derivation, governance |
| **Depende de / relaciona** | ADR-009 (Deployment ACDG-BV), ADR-010 (Conecta Raros Federation) |
| **Escopo** | Org `AD-Brasil-Centro-Social-Boa-Vista` (deploy BV) e sua relação com a org canônica `acdgbrasil` |

## Contexto

A ACDG-BV (Roraima) é um **deploy single-tenant** da plataforma ACDG, cujos repos **canônicos** vivem na org `acdgbrasil` (são originais — `parent=—`, não forks de terceiros). A org BV (`AD-Brasil-Centro-Social-Boa-Vista`) hospeda o deploy. Surgiu a pergunta: qual a melhor forma de **derivar** esses projetos para a org BV, mantendo sincronização com o upstream, permitindo customização BV-específica e respeitando licenças, com um time de 1-2 devs.

### Achado que reorienta tudo: licenças inconsistentes
Auditoria (2026-05-27) dos repos canônicos:

| Repo | Licença encontrada | Visibilidade |
|------|--------------------|--------------|
| `svc-social-care` | **NENHUMA** (sem `LICENSE`) → *all rights reserved* | público |
| `svc-people-context` | MIT | público |
| `svc-analysis-bi` | AGPL-3.0 | público |
| `web` | AGPL-3.0 | privado |
| `infra` (este repo, BV) | MIT | público |

`social-care` sem licença é juridicamente **não-redistribuível** por terceiros; e havia mistura MIT/AGPL sem critério. O detentor dos direitos é o mesmo (autor da ACDG), o que permite padronizar.

## Decisão

### 1. Licenciamento — copyleft no core, permissivo no deploy
- **Serviços (core) → AGPL-3.0**: `social-care`, `people-context`, `analysis-bi`, `web`.
  - `social-care`: **adicionar** `LICENSE` AGPL-3.0 (corrige o "all rights reserved").
  - `people-context`: **relicenciar** MIT → AGPL-3.0 (decisão do detentor; código MIT pode ser incorporado a AGPL).
  - `analysis-bi`, `web`: já AGPL-3.0 — manter.
  - **Rationale**: a AGPL protege uma plataforma de **dados de saúde de doenças raras** — a cláusula de rede (§13) garante que qualquer derivação rodada como serviço de rede **ofereça o código-fonte** aos usuários. Alinha com o ethos da ONG e com a federação Conecta Raros (ADR-010).
- **Deploy/infra e utilitários → MIT**: este repo `infra` (orquestração Compose/Terraform/Caddy + a `reference-network`) permanece MIT — é cola de deploy, não embute o código AGPL (mera agregação/orquestração, sem conflito de licença).
- **Atribuição**: manter `LICENSE` + copyright original em qualquer derivação. Forks herdam automaticamente.

### 2. Derivação para a org BV — modelo HÍBRIDO em 3 trilhos
Pesquisa de boas práticas (2026) convergiu para **minimizar manutenção** forkando só o necessário:

- **Trilho A — CONSUMIR (não forkar)** os serviços que a BV **não altera**: o `infra` referencia as **imagens do GHCR** do upstream pinadas por **tag + digest** (`ghcr.io/acdgbrasil/svc-x:<tag>@sha256:<digest>`). **Dependabot** (já configurado em `.github/dependabot.yml`) abre PR a cada atualização — inclui correções de segurança. Diferenças BV vivem em env/secrets/Compose.
- **Trilho B — FORK nativo + "soft-fork"** apenas dos repos que a BV **realmente patcha**:
  - `gh repo fork acdgbrasil/<repo> --org AD-Brasil-Centro-Social-Boa-Vista`
  - branch `upstream-main` (espelho puro; sync por `gh repo sync` / Action agendada) + branch `bv-main` (= upstream + commits BV atômicos por cima, via **merge** periódico — nunca rebase-force em branch consumida).
  - Correção genérica → cherry-pick + PR de volta ao upstream (`gh pr create --repo acdgbrasil/<repo>`). Fork **nativo** (não *mirror*) preserva o botão "Sync"/"Contribute".
  - **Fork preguiçoso**: nada é forkado até existir um patch real. Hoje: **zero forks** (a BV só consome).
- **Trilho C — repo PRÓPRIO** para o deploy: este `infra` (não-fork, sem upstream a sincronizar).

### 3. Topologia
- **Poly-repo** no lado BV: no máximo 1 fork por serviço patchado + 1 `infra`. **Sem** monorepo/subtree/submodule — o `include:` do Compose v5 já orquestra sem juntar códigos, e subtree/submodule têm atrito alto para 1-2 devs.
- **Imagens**: cada serviço (no upstream `acdgbrasil`) precisa de CI publicando no GHCR para o Trilho A funcionar de fato (pré-requisito; ver pendências).

## Consequências

### Positivas
- Manutenção proporcional ao que a BV toca (forka só o que patcha).
- Updates e correções de segurança chegam via PR (Dependabot/sync) — auditável, reprodutível (digest pinado).
- Caminho de contribuição de volta ao upstream preservado.
- AGPL protege a plataforma de saúde de fechamento por terceiros.

### Negativas / obrigações
- **AGPL §13 (cláusula de rede)**: se a BV rodar uma versão **modificada** de um serviço AGPL como rede, deve **oferecer a fonte** aos usuários do serviço (publicar o fork BV / link de fonte na aplicação servida).
- **`web` é AGPL + privado**: se for servido a usuários, há tensão — eles têm direito à fonte. Avaliar tornar público o fork BV de `web` quando servido, ou prover a fonte aos usuários.
- Pinagem por digest exige imagens publicadas no GHCR (pré-requisito não atendido hoje).

### Neutras
- Relicenciar `people-context` MIT→AGPL: versões anteriores permanecem disponíveis sob MIT a quem já as obteve; a partir daqui é AGPL.
- Não sou advogado — esta ADR é orientação prática; validar com jurídico antes de servir externamente.

## Alternativas rejeitadas
- **Forkar os 4 na BV agora**: 4 fluxos de sync para vigiar sem necessidade (a BV ainda não patcha nada). Forka-se sob demanda (Trilho B).
- **Mirror**: mata o link de fork (sem "Sync"/"Contribute") — só serve a backup.
- **Subtree/submodule**: atrito alto para 1-2 devs; o Compose `include:` já resolve a orquestração.
- **Tudo MIT**: descartado — opta-se por copyleft no core (decisão do detentor) para proteger a plataforma de saúde.

## Pendências (humano)
- `INFRA-BV-LICENSE-PUSH` — empurrar os commits de licença para `acdgbrasil/svc-social-care` e `acdgbrasil/svc-people-context` (feitos localmente por esta ADR; revisar antes do push).
- `INFRA-BV-GHCR` — CI de cada serviço publicando imagem no GHCR (pré-requisito do Trilho A).
- `INFRA-BV-PIN-DIGESTS` — trocar `image: ${REGISTRY}/...:${TAG}` por `…:<tag>@sha256:<digest>` literais quando as imagens existirem (habilita Dependabot/Renovate).
- `INFRA-BV-WEB-AGPL` — decidir publicação da fonte de `web` (AGPL + servido).

## Referências
- ADR-009 (Deployment ACDG-BV), ADR-010 (Conecta Raros Federation)
- GitHub Docs — Syncing a fork; Forking policy
- AGPL-3.0 §13 (network use); MIT License
- Pesquisa de derivação downstream / soft-fork (2026)
