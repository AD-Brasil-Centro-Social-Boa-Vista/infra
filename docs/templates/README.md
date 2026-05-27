# Templates — Trilho B (fork + soft-fork)

Material para quando a BV precisar **patchar** um serviço (ADR-BV-001, Trilho B). Enquanto não há
patch, **não forke nada** (Trilho A: consumir imagens). Forke preguiçosamente, só o que mudar.

## `sync-upstream.yml`
Workflow que mantém o fork sincronizado com o upstream sem perder os patches BV. **Não roda no
`infra`** — é copiado para dentro do fork.

## Bootstrap de um fork (ex.: `web`)

```bash
# 1. Fork cross-org (orgs distintas → permitido). Você é admin da org BV.
gh repo fork acdgbrasil/web \
  --org AD-Brasil-Centro-Social-Boa-Vista \
  --fork-name web --clone
cd web

# 2. Remote upstream (somente leitura — evita push acidental no canônico)
git remote add upstream https://github.com/acdgbrasil/web.git
git remote set-url --push upstream DISABLE

# 3. Duas branches: espelho PURO + trabalho BV
git fetch upstream
git branch upstream-main upstream/main           # espelho puro (NUNCA comitar aqui)
git switch -c bv-main upstream/main              # patches BV vão por cima
git push -u origin upstream-main bv-main

# 4. Instalar o workflow de sync
mkdir -p .github/workflows
cp <infra>/docs/templates/sync-upstream.yml .github/workflows/sync-upstream.yml
sed -i '' 's#acdgbrasil/<REPO>#acdgbrasil/web#' .github/workflows/sync-upstream.yml
git add .github/workflows/sync-upstream.yml && git commit -m "ci: sync-upstream (ADR-BV-001)" && git push
```

## Fluxo de trabalho
- **Atualizar do upstream:** o workflow faz fast-forward de `upstream-main` (semanal/manual) e abre
  um PR `upstream-main → bv-main`. Você revisa conflitos e mergeia. (Default do repo = `bv-main`.)
- **Patch BV:** commits atômicos em `bv-main` (ou em `feat/*` → PR p/ `bv-main`).
- **Contribuir de volta ao upstream:** `git switch -c fix/x upstream-main && git cherry-pick <commit-genérico> && git push origin fix/x && gh pr create --repo acdgbrasil/web --base main --head AD-Brasil-Centro-Social-Boa-Vista:fix/x`.

## Regras (não furar)
- `upstream-main` é **espelho puro** — zero commits locais (senão `gh repo sync` falha/força).
- **Nunca** force-push em branch consumida por deploy/CI.
- A imagem do deploy (`infra/compose/`) deve apontar pro **fork** (`ghcr.io/AD-Brasil-Centro-Social-Boa-Vista/web`) quando houver patch BV, senão pro upstream (Trilho A).
- AGPL §13: fork servido a usuários deve oferecer a fonte (manter o fork público ou prover link).
