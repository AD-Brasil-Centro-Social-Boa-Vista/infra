#!/usr/bin/env bash
# =============================================================================
# snapshot-block.sh — Snapshot do Block Storage NVMe via mgc CLI (ADR-009 §6)
# -----------------------------------------------------------------------------
# Cria um snapshot do volume NVMe que hospeda /data (Postgres, NATS, backups
# locais, volumes dos serviços).
#
# Retenção: ADR-009 §6 recomenda retenção diária + semanal.
# O mgc CLI suporta agendamento nativo (mgc block-storage schedulers) — ver nota
# abaixo. Este script pode ser usado como alternativa via cron externo.
#
# Crontab sugerida (01:00 UTC — 30 min antes do backup postgres às 07:00 UTC):
#   0 1 * * * /srv/acdg-bv/scripts/snapshot-block.sh >> /var/log/acdg-snapshot.log 2>&1
#
# NOTA SOBRE AGENDAMENTO NATIVO:
# O mgc CLI (≥ 0.48.0) oferece mgc block-storage schedulers para snapshots
# diários automáticos com retenção gerenciada pelo serviço:
#   mgc block-storage schedulers create \
#     --name "acdg-bv-nvme-daily" \
#     --policy.frequency.daily.start-time "01:00" \
#     --policy.retention-in-days 7 \
#     --snapshot.type object
# Use o scheduler nativo em produção estável; este script é útil para snapshots
# ad-hoc e ambientes sem CLI persistente configurado.
#
# Pré-requisitos:
#   - mgc CLI autenticado (mgc auth login ou api-key configurada)
#   - VOLUME_ID exportado (ver abaixo) ou passado como argumento
#
# Uso:
#   VOLUME_ID=<uuid-do-volume> ./scripts/snapshot-block.sh
#   ./scripts/snapshot-block.sh --volume-id <uuid> [--retain-daily 7] [--retain-weekly 4]
# =============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Configuração
# ---------------------------------------------------------------------------
# ID do volume NVMe de /data — obrigatório.
# Obtenha via: mgc block-storage volumes list --raw | grep <nome>
VOLUME_ID="${VOLUME_ID:-}"

# Nome base dos snapshots (sufixo com data será adicionado automaticamente)
SNAPSHOT_NAME_PREFIX="${SNAPSHOT_NAME_PREFIX:-acdg-bv-data}"

# Tipo de snapshot: "object" para long-term (armazenado em object storage, menor custo)
# Use "instant" (NVMe) para snapshots rápidos de recuperação de falha pontual
SNAPSHOT_TYPE="${SNAPSHOT_TYPE:-object}"

# Retenção: número de snapshots a manter de cada categoria
RETAIN_DAILY="${RETAIN_DAILY:-7}"
RETAIN_WEEKLY="${RETAIN_WEEKLY:-4}"

# ---------------------------------------------------------------------------
# Parsing de argumentos (override das variáveis acima)
# ---------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --volume-id)
      VOLUME_ID="$2"; shift 2 ;;
    --retain-daily)
      RETAIN_DAILY="$2"; shift 2 ;;
    --retain-weekly)
      RETAIN_WEEKLY="$2"; shift 2 ;;
    --snapshot-type)
      SNAPSHOT_TYPE="$2"; shift 2 ;;
    -h|--help)
      grep '^#' "$0" | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *)
      echo "[ERRO] Argumento desconhecido: $1" >&2
      exit 1 ;;
  esac
done

# ---------------------------------------------------------------------------
# Validação
# ---------------------------------------------------------------------------
if [[ -z "$VOLUME_ID" ]]; then
  echo "[ERRO] VOLUME_ID não definido." >&2
  echo "  Defina via variável de ambiente: VOLUME_ID=<uuid> $0" >&2
  echo "  Ou via flag: $0 --volume-id <uuid>" >&2
  echo ""
  echo "  Para listar volumes disponíveis:" >&2
  echo "    mgc block-storage volumes list" >&2
  exit 1
fi

# ---------------------------------------------------------------------------
# Funções auxiliares
# ---------------------------------------------------------------------------
log() { echo "[$(date -u '+%Y-%m-%dT%H:%M:%SZ')] $*"; }

# Determina tipo de snapshot pelo calendário
snapshot_category() {
  local dow
  dow=$(date -u '+%u')  # 1=segunda … 7=domingo
  if [[ "$dow" == "7" ]]; then
    echo "weekly"
  else
    echo "daily"
  fi
}

# Lista snapshots do volume ordenados por nome (que inclui timestamp)
list_snapshots_for_prefix() {
  local prefix="$1"
  # Comando confirmado no handbook: mgc block-storage snapshots list
  # Filtramos por nome com grep pois a CLI não tem --filter nativo
  mgc block-storage snapshots list --raw 2>/dev/null \
    | grep "\"name\"" \
    | grep "\"${prefix}" \
    | sed 's/.*"name": "\(.*\)".*/\1/' \
    | sort \
    || true
}

# Obtém ID de snapshot pelo nome
get_snapshot_id_by_name() {
  local name="$1"
  # Extrai o id do JSON retornado
  mgc block-storage snapshots list --output json 2>/dev/null \
    | python3 -c "
import sys, json
data = json.load(sys.stdin)
snapshots = data if isinstance(data, list) else data.get('snapshots', data.get('results', []))
for s in snapshots:
    if s.get('name') == '${name}':
        print(s.get('id', ''))
        break
" || true
}

# Deleta snapshot por ID
delete_snapshot_by_id() {
  local snap_id="$1"
  local snap_name="$2"
  log "  Deletando snapshot expirado: ${snap_name} (${snap_id})"
  # Comando confirmado no handbook: mgc block-storage snapshots delete --id <uuid>
  mgc block-storage snapshots delete --id "${snap_id}" --no-confirm
}

# Aplica retenção: mantém apenas os N snapshots mais recentes com determinado prefixo
apply_snapshot_retention() {
  local prefix="$1"
  local keep="$2"

  local names
  # shellcheck disable=SC2207
  names=($(list_snapshots_for_prefix "$prefix"))
  local count="${#names[@]}"

  if [[ "$count" -le "$keep" ]]; then
    log "  Retenção OK: ${count}/${keep} snapshots para prefixo '${prefix}'"
    return 0
  fi

  local to_delete=$(( count - keep ))
  log "  Retenção: ${count} snapshots, mantendo ${keep}, deletando ${to_delete}"

  for i in $(seq 0 $(( to_delete - 1 ))); do
    local snap_name="${names[$i]}"
    local snap_id
    snap_id=$(get_snapshot_id_by_name "$snap_name")
    if [[ -n "$snap_id" ]]; then
      delete_snapshot_by_id "$snap_id" "$snap_name"
    else
      log "  [AVISO] ID não encontrado para snapshot '${snap_name}' — ignorando"
    fi
  done
}

# ---------------------------------------------------------------------------
# Criação do snapshot
# ---------------------------------------------------------------------------
create_snapshot() {
  local category="$1"
  local date_str
  date_str=$(date -u '+%Y%m%d-%H%M%S')
  local snap_name="${SNAPSHOT_NAME_PREFIX}-${category}-${date_str}"

  log "Criando snapshot do volume ${VOLUME_ID}..."
  log "  Nome: ${snap_name}"
  log "  Tipo: ${SNAPSHOT_TYPE}"
  log "  Categoria: ${category}"

  # Comando confirmado no handbook:
  #   mgc block-storage snapshots create --name "<nome>" --volume.id "<uuid>" --type "<tipo>"
  mgc block-storage snapshots create \
    --name "${snap_name}" \
    --volume.id "${VOLUME_ID}" \
    --type "${SNAPSHOT_TYPE}"

  log "  Snapshot criado: ${snap_name}"
  echo "$snap_name"
}

# ---------------------------------------------------------------------------
# Entrypoint
# ---------------------------------------------------------------------------
main() {
  log "=== Início do snapshot Block Storage ACDG-BV ==="
  log "  Volume ID : ${VOLUME_ID}"
  log "  Tipo      : ${SNAPSHOT_TYPE}"

  local category
  category=$(snapshot_category)
  log "  Categoria : ${category}"

  # Cria o snapshot
  create_snapshot "$category"

  # Aplica retenção separada por categoria
  log "Aplicando política de retenção..."
  apply_snapshot_retention "${SNAPSHOT_NAME_PREFIX}-daily"   "$RETAIN_DAILY"
  apply_snapshot_retention "${SNAPSHOT_NAME_PREFIX}-weekly"  "$RETAIN_WEEKLY"

  log "=== Snapshot concluído com sucesso ==="
}

main "$@"
