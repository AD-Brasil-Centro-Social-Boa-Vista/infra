# versions.tf — pin estrito de versões (ADR-009 §1)
# OpenTofu >= 1.9 requerido; provider Magalu pinado em ~> 0.50 (patch updates ok, minor não)

terraform {
  required_version = ">= 1.9"

  required_providers {
    mgc = {
      source  = "MagaluCloud/mgc"
      version = "~> 0.50"
    }
  }
}
