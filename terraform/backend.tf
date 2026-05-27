# backend.tf — state Terraform em Magalu Object Storage (ADR-009 §1)
#
# Configuração confirmada em:
#   infra/reference/iac/magalu-cloud-provider/guides/backend-tsstate.md
#
# Flags obrigatórias para S3-compatible (não AWS nativo):
#   skip_region_validation      = true
#   skip_credentials_validation = true
#   skip_requesting_account_id  = true
#   skip_s3_checksum            = true
#   endpoints.s3                = endpoint regional Magalu
#
# ATENÇÃO: O bucket de state DEVE ser criado manualmente ANTES do primeiro
# `tofu init`. O bucket provisionado em main.tf (acdg-bv-backups) é para
# backups de dados — o bucket de state é separado e gerenciado fora do TF.
#
# Credenciais do backend via env vars:
#   AWS_ACCESS_KEY_ID     = MGC key_pair_id
#   AWS_SECRET_ACCESS_KEY = MGC key_pair_secret

terraform {
  backend "s3" {
    bucket = "acdg-bv-tfstate"
    key    = "acdg-bv/production/terraform.tfstate"

    # Região do bucket de state (deve ser a mesma do deploy)
    region = "br-ne1"

    # Flags requeridas para Object Storage S3-compatible Magalu
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

    # Endpoint regional Magalu Object Storage
    # Confirmado em: guides/backend-tsstate.md
    endpoints = {
      s3 = "https://br-ne1.magaluobjects.com/"
    }

    # Magalu Object Storage não tem DynamoDB-like para lock distribuído.
    # Usar lock via arquivo local ou desabilitar se deploy single-runner.
    # TODO confirmar suporte a state locking nativo em br-ne1
  }
}
