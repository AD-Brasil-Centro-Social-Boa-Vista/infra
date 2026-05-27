#!/usr/bin/env bash
# =============================================================================
# restore-postgres.sh — Restauração PostgreSQL a partir do Object Storage
# -----------------------------------------------------------------------------
# Baixa um dump do Object Storage Magalu Cloud e executa pg_restore no banco
# alvo (com confirmação interativa antes de sobrescrever).
#
# Uso:
#   ./scripts/restore-postgres.sh --db social_care --date 20260527
#   ./scripts/restore-postgres.sh --db authentik --date 20260527 --type weekly
#   ./scripts/restore-postgres.sh --db people --object postgres/people/daily/people_20260527_030001.dump
#
# Parâmetros:
#   --db      <nome>   Banco de destino (obrigatório)
#   --date    <YYYYMMDD>  Data do backup (obrigatório se --object não for usado)
#   --type    <daily|weekly|monthly>  Tipo do backup (padrão: daily)
#   --object  <key>    Chave completa do objeto no bucket (override total)
#   --no-confirm       Pula confirmação interativa (USE COM CUIDADO)
#
# Pré-requisitos:
#   - docker (com compose plugin)
#   - mgc CLI autenticado
#   - O banco alvo já existe no Postgres (não recria schema)
# =============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Configuração (sobrescrevível por variável de ambiente)
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INFRA_DIR="$(dirname "$SCRIPT_DIR")"
COMPOSE_DIR="${INFRA_DIR}/compose"

BACKUP_BUCKET="${BACKUP_BUCKET:-acdg-bv-backups}"
BUCKET_PREFIX="${BUCKET_PREFIX:-postgres}"
POSTGRES_SERVICE="${POSTGRES_SERVICE:-postgres}"
PG_SUPERUSER="${POSTGRES_SUPERUSER:-postgres}"
TMP_DIR="${TMP_DIR:-/tmp/acdg-pg-restore}"

# ---------------------------------------------------------------------------
# Parsing de argumentos
# ---------------------------------------------------------------------------
DB=""
DATE_STR=""
BACKUP_TYPE="daily"
OBJECT_KEY=""
NO_CONFIRM=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --db)
      DB="$2"; shift 2 ;;
    --date)
      DATE_STR="$2"; shift 2 ;;
    --type)
      BACKUP_TYPE="$2"; shift 2 ;;
    --object)
      OBJECT_KEY="$2"; shift 2 ;;
    --no-confirm)
      NO_CONFIRM=true; shift ;;
    -h|--help)
      grep '^#' "$0" | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *)
      echo "[ERRO] Argumento desconhecido: $1" >&2
      exit 1 ;;
  esac
done

# ---------------------------------------------------------------------------
# Validação de argumentos obrigatórios
# ---------------------------------------------------------------------------
if [[ -z "$DB" ]]; then
  echo "[ERRO] --db é obrigatório. Ex.: --db social_care" >&2
  exit 1
fi

# ---------------------------------------------------------------------------
# Funções auxiliares
# ---------------------------------------------------------------------------
log() { echo "[$(date -u '+%Y-%m-%dT%H:%M:%SZ')] $*"; }

cleanup() {
  log "Limpando arquivos temporários em $TMP_DIR"
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# ---------------------------------------------------------------------------
# Resolve a chave do objeto a restaurar
# ---------------------------------------------------------------------------
resolve_object_key() {
  if [[ -n "$OBJECT_KEY" ]]; then
    # Chave explícita passada pelo operador
    return
  fi

  if [[ -z "$DATE_STR" ]]; then
    echo "[ERRO] --date (YYYYMMDD) ou --object é obrigatório" >&2
    exit 1
  fi

  local prefix="${BUCKET_PREFIX}/${DB}/${BACKUP_TYPE}"

  log "Listando objetos com prefixo: ${prefix}/"
  # Comando confirmado no handbook: mgc object-storage objects list BUCKET
  local candidates
  candidates=$(
    mgc object-storage objects list "${BACKUP_BUCKET}" --raw 2>/dev/null \
      | grep "^${prefix}/" \
      | grep "${DATE_STR}" \
      | sort \
      || true
  )

  if [[ -z "$candidates" ]]; then
    echo "[ERRO] Nenhum backup encontrado para db='${DB}', type='${BACKUP_TYPE}', date='${DATE_STR}'" >&2
    echo "  Bucket: ${BACKUP_BUCKET}" >&2
    echo "  Prefixo: ${prefix}/" >&2
    exit 1
  fi

  # Se houver mais de um resultado (múltiplos backups no mesmo dia), pega o mais recente
  OBJECT_KEY=$(echo "$candidates" | tail -n1)
  log "Objeto selecionado: ${OBJECT_KEY}"
}

# ---------------------------------------------------------------------------
# Confirmação interativa
# ---------------------------------------------------------------------------
confirm_restore() {
  if [[ "$NO_CONFIRM" == "true" ]]; then
    log "[AVISO] --no-confirm ativo — confirmação ignorada"
    return
  fi

  echo ""
  echo "=========================================================="
  echo "  RESTAURAÇÃO DE BANCO DE DADOS — OPERAÇÃO DESTRUTIVA"
  echo "=========================================================="
  echo "  Banco alvo  : ${DB}"
  echo "  Objeto      : ${OBJECT_KEY}"
  echo "  Bucket      : ${BACKUP_BUCKET}"
  echo ""
  echo "  ATENÇÃO: Este processo irá dropar e recriar todos os"
  echo "  objetos do banco '${DB}'. Dados existentes serão"
  echo "  PERDIDOS. Esta ação é IRREVERSÍVEL."
  echo "=========================================================="
  echo ""
  read -r -p "Digite o nome do banco para confirmar (${DB}): " CONFIRM_DB

  if [[ "$CONFIRM_DB" != "$DB" ]]; then
    echo "[CANCELADO] Confirmação não corresponde. Abortando." >&2
    exit 1
  fi
}

# ---------------------------------------------------------------------------
# Download do dump
# ---------------------------------------------------------------------------
download_dump() {
  local filename
  filename=$(basename "$OBJECT_KEY")
  local local_path="${TMP_DIR}/${filename}"

  log "Baixando dump do Object Storage..."
  log "  Objeto: ${BACKUP_BUCKET}/${OBJECT_KEY}"

  # O mgc CLI não tem download direto por object key — usa a sintaxe BUCKET/KEY
  # Comando base confirmado no handbook para download (upload inverso não existe;
  # usamos aws-cli compatível S3 ou mgc objects download se disponível).
  # A MGC CLI é compatível com S3. Para download de objeto específico, usamos:
  #   mgc object-storage objects download BUCKET/OBJECT_KEY DESTINO
  # Se mgc não suportar download, fallback via aws s3 cp (compatível com mgc endpoint).
  if mgc object-storage objects download "${BACKUP_BUCKET}/${OBJECT_KEY}" "${local_path}" 2>/dev/null; then
    log "  Download concluído via mgc CLI"
  else
    # Fallback: aws s3 cp com endpoint Magalu Cloud (compatível S3)
    log "  mgc download não disponível, tentando via aws s3 cp..."
    local endpoint
    endpoint=$(mgc config get --key region --raw 2>/dev/null | sed 's|.*|https://&.magaluobjects.com|' || echo "https://br-se1.magaluobjects.com")
    aws s3 cp "s3://${BACKUP_BUCKET}/${OBJECT_KEY}" "${local_path}" \
      --endpoint-url "${endpoint}"
    log "  Download concluído via aws s3 cp"
  fi

  echo "$local_path"
}

# ---------------------------------------------------------------------------
# Restauração no Postgres
# ---------------------------------------------------------------------------
restore_database() {
  local dump_path="$1"
  local size
  size=$(du -sh "$dump_path" | cut -f1)
  log "Arquivo de dump: ${dump_path} (${size})"

  log "Iniciando pg_restore no banco '${DB}'..."

  # pg_restore via docker compose exec -T (não-interativo)
  # --clean: dropa objetos existentes antes de recriar
  # --if-exists: não falha se objeto não existe (idempotente)
  # --no-owner: ignora comandos de ownership (útil ao restaurar entre usuários)
  # --no-privileges: ignora GRANT/REVOKE
  # --exit-on-error: para imediatamente em caso de erro
  docker compose \
    --project-directory "${COMPOSE_DIR}" \
    --file "${COMPOSE_DIR}/compose.yml" \
    exec -T "${POSTGRES_SERVICE}" \
    pg_restore \
      --username="${PG_SUPERUSER}" \
      --dbname="${DB}" \
      --clean \
      --if-exists \
      --no-owner \
      --no-privileges \
      --exit-on-error \
      --no-password \
    < "${dump_path}"

  log "pg_restore concluído com sucesso."
}

# ---------------------------------------------------------------------------
# Entrypoint principal
# ---------------------------------------------------------------------------
main() {
  log "=== Início da restauração ACDG-BV PostgreSQL ==="
  log "  Banco: ${DB}"
  log "  Tipo : ${BACKUP_TYPE}"

  mkdir -p "$TMP_DIR"

  # Resolve qual objeto baixar
  resolve_object_key

  # Solicita confirmação antes de prosseguir
  confirm_restore

  # Baixa o dump
  local dump_path
  dump_path=$(download_dump)

  # Executa a restauração
  restore_database "$dump_path"

  log "=== Restauração concluída ==="
}

main "$@"
