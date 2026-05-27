#!/usr/bin/env bash
# =============================================================================
# deploy.sh — Deploy ACDG-BV (ADR-009)
# -----------------------------------------------------------------------------
# Faz pull das imagens e sobe o stack via `docker compose up -d` a partir de
# infra/compose/. Suporta:
#   - deploy local (padrão)
#   - deploy remoto (rsync dos compose files → ssh → docker compose up -d)
#   - integração com Infisical CLI (ADR-011): se presente, injeta secrets;
#     senão usa ../env/.env como fallback
#   - profiles opcionais: --profile analytics|observability
#
# Uso:
#   ./scripts/deploy.sh [--remote] [--profile analytics] [--profile observability]
#   DEPLOY_HOST=user@1.2.3.4 REMOTE_DIR=/srv/acdg-bv ./scripts/deploy.sh --remote
#
# Pré-requisitos locais:  docker, docker compose plugin
# Pré-requisitos remotos: ssh acesso sem senha (chave), docker no host remoto
# Pré-requisito opcional: infisical CLI (https://infisical.com/docs/cli)
# =============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Variáveis de contexto — todas sobrescrevíveis por variável de ambiente
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INFRA_DIR="$(dirname "$SCRIPT_DIR")"
COMPOSE_DIR="${INFRA_DIR}/compose"
ENV_FILE="${INFRA_DIR}/env/.env"

# Destino do deploy remoto (usados quando --remote é passado)
DEPLOY_HOST="${DEPLOY_HOST:-}"          # ex.: ubuntu@1.2.3.4
REMOTE_DIR="${REMOTE_DIR:-/srv/acdg-bv/compose}"

# ---------------------------------------------------------------------------
# Parsing de argumentos
# ---------------------------------------------------------------------------
REMOTE=false
PROFILES=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --remote)
      REMOTE=true
      shift
      ;;
    --profile)
      # Aceita --profile analytics ou --profile observability
      if [[ -z "${2:-}" ]]; then
        echo "[ERRO] --profile requer um valor (analytics|observability)" >&2
        exit 1
      fi
      PROFILES+=("$2")
      shift 2
      ;;
    *)
      echo "[ERRO] Argumento desconhecido: $1" >&2
      echo "Uso: $0 [--remote] [--profile analytics|observability]" >&2
      exit 1
      ;;
  esac
done

# ---------------------------------------------------------------------------
# Monta os flags de profile para o compose
# ---------------------------------------------------------------------------
PROFILE_FLAGS=()
for p in "${PROFILES[@]}"; do
  PROFILE_FLAGS+=("--profile" "$p")
done

# ---------------------------------------------------------------------------
# Decide como injetar secrets: Infisical CLI (preferido) ou .env (fallback)
# ---------------------------------------------------------------------------
build_compose_cmd() {
  # $@ = restante do comando a executar dentro do contexto de secrets
  local inner_cmd=("$@")

  if command -v infisical &>/dev/null; then
    echo "[secrets] Infisical CLI detectado — injetando secrets de produção"
    # infisical run injeta as variáveis de ambiente definidas no projeto
    # antes de executar o subcomando.
    infisical run \
      --env=production \
      -- \
      "${inner_cmd[@]}"
  elif [[ -f "$ENV_FILE" ]]; then
    echo "[secrets] Infisical não encontrado — usando fallback: $ENV_FILE"
    # --env-file aplica as variáveis ao subprocesso docker compose
    "${inner_cmd[@]}" --env-file "$ENV_FILE"
  else
    echo "[AVISO] Sem Infisical e sem $ENV_FILE — executando sem secrets explícitos" >&2
    "${inner_cmd[@]}"
  fi
}

# ---------------------------------------------------------------------------
# Compose base: aponta para o diretório de compose files
# ---------------------------------------------------------------------------
COMPOSE_BASE=(
  docker compose
  --project-directory "$COMPOSE_DIR"
  --file "${COMPOSE_DIR}/compose.yml"
  "${PROFILE_FLAGS[@]}"
)

# ---------------------------------------------------------------------------
# Deploy LOCAL
# ---------------------------------------------------------------------------
deploy_local() {
  echo "[deploy] Modo: LOCAL"
  echo "[deploy] Compose dir: $COMPOSE_DIR"
  echo "[deploy] Profiles: ${PROFILES[*]:-nenhum}"

  # Atualiza as imagens antes de subir (idempotente)
  echo "[deploy] Baixando imagens atualizadas..."
  build_compose_cmd "${COMPOSE_BASE[@]}" pull

  echo "[deploy] Subindo o stack..."
  build_compose_cmd "${COMPOSE_BASE[@]}" up -d --remove-orphans

  echo "[deploy] Stack atualizado com sucesso."
}

# ---------------------------------------------------------------------------
# Deploy REMOTO
# ---------------------------------------------------------------------------
deploy_remote() {
  if [[ -z "$DEPLOY_HOST" ]]; then
    echo "[ERRO] Deploy remoto requer DEPLOY_HOST=user@host" >&2
    exit 1
  fi

  echo "[deploy] Modo: REMOTO → ${DEPLOY_HOST}:${REMOTE_DIR}"
  echo "[deploy] Profiles: ${PROFILES[*]:-nenhum}"

  # Sincroniza os compose files para o host remoto
  echo "[deploy] rsync compose files..."
  rsync -az --delete \
    --exclude='*.local' \
    "${COMPOSE_DIR}/" \
    "${DEPLOY_HOST}:${REMOTE_DIR}/"

  # Monta o comando docker compose a rodar no host remoto
  REMOTE_PROFILE_FLAGS=""
  for p in "${PROFILES[@]}"; do
    REMOTE_PROFILE_FLAGS+=" --profile $p"
  done

  # Nota: no host remoto, o Infisical (se instalado) será detectado
  # automaticamente pelo wrapper infisical-or-env exportado via ~/.bashrc.
  # O fallback usa o .env já presente em $REMOTE_DIR/../env/.env no host.
  echo "[deploy] Executando docker compose up no host remoto..."
  # shellcheck disable=SC2029,SC2087
  ssh -o BatchMode=yes "${DEPLOY_HOST}" bash -s <<REMOTE_SCRIPT
set -euo pipefail
cd "${REMOTE_DIR}"

COMPOSE_CMD="docker compose --project-directory ${REMOTE_DIR} --file ${REMOTE_DIR}/compose.yml${REMOTE_PROFILE_FLAGS}"

if command -v infisical &>/dev/null; then
  echo "[remote/secrets] Infisical detectado"
  infisical run --env=production -- \$COMPOSE_CMD pull
  infisical run --env=production -- \$COMPOSE_CMD up -d --remove-orphans
else
  ENV_FILE="${REMOTE_DIR}/../env/.env"
  if [[ -f "\$ENV_FILE" ]]; then
    echo "[remote/secrets] fallback: \$ENV_FILE"
    \$COMPOSE_CMD pull --env-file "\$ENV_FILE"
    \$COMPOSE_CMD up -d --remove-orphans --env-file "\$ENV_FILE"
  else
    echo "[AVISO] sem Infisical e sem .env — executando sem secrets" >&2
    \$COMPOSE_CMD pull
    \$COMPOSE_CMD up -d --remove-orphans
  fi
fi

echo "[remote] Stack atualizado com sucesso."
REMOTE_SCRIPT

  echo "[deploy] Deploy remoto concluído."
}

# ---------------------------------------------------------------------------
# Entrypoint
# ---------------------------------------------------------------------------
if [[ "$REMOTE" == "true" ]]; then
  deploy_remote
else
  deploy_local
fi
