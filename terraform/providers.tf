# providers.tf — configuração do provider Magalu Cloud (ADR-009 §1)
#
# Argumentos confirmados em:
#   infra/reference/iac/magalu-cloud-provider/index.md (schema do provider)
#   infra/reference/iac/magalu-cloud-provider/guides/env-variables.md
#
# Autenticação via variáveis de ambiente (recomendado — não commitar secrets):
#   MGC_API_KEY          ou TF_VAR_mgc_api_key
#   MGC_KEY_PAIR_ID      ou TF_VAR_mgc_key_pair_id      (Object Storage)
#   MGC_KEY_PAIR_SECRET  ou TF_VAR_mgc_key_pair_secret  (Object Storage)

provider "mgc" {
  region = var.region

  # api_key, key_pair_id e key_pair_secret são injetados via env vars
  # (MGC_API_KEY / MGC_KEY_PAIR_ID / MGC_KEY_PAIR_SECRET)
  # Deixar aqui como referência explícita quando usar tfvars:
  #   api_key         = var.mgc_api_key
  #   key_pair_id     = var.mgc_key_pair_id
  #   key_pair_secret = var.mgc_key_pair_secret
}
