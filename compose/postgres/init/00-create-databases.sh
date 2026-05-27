#!/bin/bash
# =============================================================================
# 00-create-databases.sh — init do Postgres 16 único (ADR-009 §5)
# Cria database-per-service + role por serviço, lendo senhas de /run/secrets.
# Roda UMA vez no primeiro boot (docker-entrypoint-initdb.d), como superuser.
# =============================================================================
set -euo pipefail

# lê uma senha de /run/secrets/<name> (ou env de fallback p/ dev)
read_secret() {
	local file="/run/secrets/$1"
	if [[ -f "$file" ]]; then cat "$file"; else echo "${2:-}"; fi
}

create_db_role() {
	local db="$1" role="$2" pw="$3"
	echo "[init] criando role/db: $role / $db"
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-SQL
		DO \$\$ BEGIN
		  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '${role}') THEN
		    CREATE ROLE ${role} LOGIN PASSWORD '${pw}';
		  END IF;
		END \$\$;
		SELECT 'CREATE DATABASE ${db} OWNER ${role}'
		  WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '${db}')\gexec
	SQL
}

# database-per-service (mesmo nome dos DBs de dev de cada serviço)
create_db_role "social_care"  "social_care" "$(read_secret social_care_db_password change-me)"
create_db_role "people"       "people"      "$(read_secret people_db_password change-me)"
create_db_role "analysis_bi"  "analysis_bi" "$(read_secret analysis_db_password change-me)"
# plataforma
create_db_role "authentik"    "authentik"   "$(read_secret authentik_db_password change-me)"
create_db_role "infisical"    "infisical"   "$(read_secret infisical_db_password change-me)"

echo "[init] databases ACDG-BV prontos."
