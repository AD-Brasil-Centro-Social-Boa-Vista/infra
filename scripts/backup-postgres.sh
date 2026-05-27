#!/usr/bin/env bash
# =============================================================================
# backup-postgres.sh — Backup PostgreSQL → Object Storage Cold (ADR-009 §5/§6)
# -----------------------------------------------------------------------------
# Faz pg_dump --format=custom de cada banco ACDG-BV e faz upload para o bucket
# de backup no Object Storage Magalu Cloud com classe cold_instant.
#
# Retenção implementada localmente (antes do upload) — ADR-009 §6:
#   - 7 backups diários
#   - 4 backups semanais (domingo)
#   - 6 backups mensais (dia 1 do mês)
# Backups expirados são deletados do Object Storage.
#
# Crontab sugerida (03:00 BRT = 07:00 UTC — Boa Vista é UTC-4):
#   0 7 * * * /srv/acdg-bv/scripts/backup-postgres.sh >> /var/log/acdg-backup.log 2>&1
#
# Pré-requisitos:
#   - docker (com compose plugin)
#   - mgc CLI autenticado (mgc auth login ou api-key configurada)
#   - Bucket de backup criado: mgc object-storage buckets create $BACKUP_BUCKET
#   - Variáveis de ambiente abaixo (ou sobrescreva na invocação)
#
# Uso:
#   ./scripts/backup-postgres.sh
#   BACKUP_BUCKET=meu-bucket ./scripts/backup-postgres.sh
# =============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Configuração (sobrescrevível via variável de ambiente)
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INFRA_DIR="$(dirname "$SCRIPT_DIR")"
COMPOSE_DIR="${INFRA_DIR}/compose"

# Nome do bucket de backup no Object Storage Magalu Cloud
BACKUP_BUCKET="${BACKUP_BUCKET:-acdg-bv-backups}"

# Diretório temporário local para os dumps (limpado ao final)
TMP_DIR="${TMP_DIR:-/tmp/acdg-pg-backup}"

# Container / serviço Postgres no compose
POSTGRES_SERVICE="${POSTGRES_SERVICE:-postgres}"

# Prefixo dentro do bucket para organização dos backups
BUCKET_PREFIX="${BUCKET_PREFIX:-postgres}"

# Retenção
RETAIN_DAILY=7
RETAIN_WEEKLY=4   # semanas (domingo)
RETAIN_MONTHLY=6  # meses (dia 1)

# Bancos a fazer backup (todos os serviços ACDG-BV + plataforma)
DATABASES=(
  social_care
  people
  analysis_bi
  authentik
  infisical
)

# Usuário superuser do Postgres (sem senha — autenticação via peer/trust interna)
PG_SUPERUSER="${POSTGRES_SUPERUSER:-postgres}"

# ---------------------------------------------------------------------------
# Funções auxiliares
# ---------------------------------------------------------------------------

log() { echo "[$(date -u '+%Y-%m-%dT%H:%M:%SZ')] $*"; }

cleanup() {
  log "Limpando arquivos temporários em $TMP_DIR"
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Determina tipo de backup pelo calendário (daily/weekly/monthly)
backup_type() {
  local dow
  local dom
  dow=$(date -u '+%u')  # 1=segunda … 7=domingo
  dom=$(date -u '+%d')  # dia do mês com zero
  if [[ "$dom" == "01" ]]; then
    echo "monthly"
  elif [[ "$dow" == "7" ]]; then
    echo "weekly"
  else
    echo "daily"
  fi
}

# Retorna o prefixo completo no bucket para um banco e tipo
object_prefix() {
  local db="$1"
  local type="$2"
  echo "${BUCKET_PREFIX}/${db}/${type}"
}

# Lista objetos no bucket com determinado prefixo (um por linha)
list_objects() {
  local prefix="$1"
  # Comando confirmado no handbook: mgc object-storage objects list BUCKET
  # Filtramos por prefixo via grep pois a CLI não tem --prefix nativo.
  mgc object-storage objects list "${BACKUP_BUCKET}" --raw 2>/dev/null \
    | grep "^${prefix}/" \
    | sort \
    || true
}

# Deleta objeto do bucket
delete_object() {
  local obj_key="$1"
  log "  Deletando objeto expirado: ${obj_key}"
  # Comando confirmado: mgc object-storage objects delete BUCKET/OBJECT
  mgc object-storage objects delete "${BACKUP_BUCKET}/${obj_key}" --no-confirm
}

# Aplica política de retenção: mantém apenas os N mais recentes para um prefixo
apply_retention() {
  local prefix="$1"
  local keep="$2"

  local objects
  # shellcheck disable=SC2207
  objects=($(list_objects "$prefix"))
  local count="${#objects[@]}"

  if [[ "$count" -le "$keep" ]]; then
    return 0
  fi

  local to_delete=$(( count - keep ))
  log "  Retenção: ${count} objetos encontrados, mantendo ${keep}, deletando ${to_delete}"

  # Os mais antigos ficam no início (sort lexicográfico por nome com data)
  for i in $(seq 0 $(( to_delete - 1 ))); do
    delete_object "${objects[$i]}"
  done
}

# ---------------------------------------------------------------------------
# Backup de um único banco
# ---------------------------------------------------------------------------
backup_database() {
  local db="$1"
  local type="$2"
  local date_str
  date_str=$(date -u '+%Y%m%d_%H%M%S')
  local filename="${db}_${date_str}.dump"
  local local_path="${TMP_DIR}/${filename}"
  local prefix
  prefix=$(object_prefix "$db" "$type")
  local object_key="${prefix}/${filename}"

  log "Backup de '${db}' (${type}) → ${filename}"

  # pg_dump via docker compose exec
  # -T desabilita pseudo-TTY (necessário para pipes/scripts não-interativos)
  # --format=custom gera arquivo binário comprimido otimizado para pg_restore
  docker compose \
    --project-directory "${COMPOSE_DIR}" \
    --file "${COMPOSE_DIR}/compose.yml" \
    exec -T "${POSTGRES_SERVICE}" \
    pg_dump \
      --username="${PG_SUPERUSER}" \
      --format=custom \
      --no-password \
      "${db}" \
    > "${local_path}"

  local size
  size=$(du -sh "${local_path}" | cut -f1)
  log "  Dump concluído: ${size}"

  # Upload para Object Storage com classe cold_instant (ADR-009 §5 — backup long-term)
  # Comando confirmado no handbook:
  #   mgc object-storage objects upload ARQUIVO BUCKET --storage-class=cold_instant
  # Nota: cold_instant disponível apenas em br-se1. Para br-ne1, omitir --storage-class
  # e usar standard; ajuste OBJECT_STORAGE_REGION conforme necessário.
  log "  Enviando para Object Storage: ${BACKUP_BUCKET}/${object_key}"
  mgc object-storage objects upload \
    "${local_path}" \
    "${BACKUP_BUCKET}/${prefix}" \
    --storage-class=cold_instant

  log "  Upload concluído: ${object_key}"
  rm -f "${local_path}"
}

# ---------------------------------------------------------------------------
# Entrypoint principal
# ---------------------------------------------------------------------------
main() {
  log "=== Início do backup ACDG-BV PostgreSQL ==="

  # Cria diretório temporário
  mkdir -p "$TMP_DIR"

  local type
  type=$(backup_type)
  log "Tipo de backup: ${type}"

  # Verifica se o serviço postgres está rodando
  if ! docker compose \
      --project-directory "${COMPOSE_DIR}" \
      --file "${COMPOSE_DIR}/compose.yml" \
      ps "${POSTGRES_SERVICE}" \
      --format json 2>/dev/null | grep -q '"Running"'; then
    log "[ERRO] Serviço '${POSTGRES_SERVICE}' não está em estado Running. Abortando." >&2
    exit 1
  fi

  # Faz backup de cada banco
  for db in "${DATABASES[@]}"; do
    backup_database "$db" "$type"
  done

  # Aplica retenção por banco e por tipo
  log "Aplicando política de retenção..."
  for db in "${DATABASES[@]}"; do
    log "  Banco: ${db}"
    apply_retention "$(object_prefix "$db" "daily")"   "$RETAIN_DAILY"
    apply_retention "$(object_prefix "$db" "weekly")"  "$RETAIN_WEEKLY"
    apply_retention "$(object_prefix "$db" "monthly")" "$RETAIN_MONTHLY"
  done

  log "=== Backup concluído com sucesso ==="
}

main "$@"
