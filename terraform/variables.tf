# variables.tf — variáveis do deploy ACDG-BV (ADR-009 §1)

# ─── Região ──────────────────────────────────────────────────────────────────

variable "region" {
  description = "Região Magalu Cloud. ADR-009: br-ne1 (Fortaleza) — menor latência Roraima→Fortaleza."
  type        = string
  default     = "br-ne1"

  validation {
    condition     = contains(["br-ne1", "br-se1", "br-mgl1", "br-mc1"], var.region)
    error_message = "Região inválida. Valores aceitos: br-ne1, br-se1, br-mgl1, br-mc1."
  }
}

# ─── VM ──────────────────────────────────────────────────────────────────────

variable "vm_flavor" {
  description = "Flavor da VM. ADR-009: BV4-16-50 (4 vCPU, 16 GB RAM, 50 GB SSD). Folga calculada para 7 serviços."
  type        = string
  default     = "BV4-16-50"
}

variable "vm_image" {
  description = "Imagem base da VM. Ubuntu 24.04 LTS para máxima compatibilidade com Docker Compose v5."
  type        = string
  default     = "cloud-ubuntu-24.04 LTS"
}

variable "availability_zone" {
  description = "Availability zone dentro de br-ne1. ADR-009 pergunta em aberto #1: verificar se br-ne1 tem multi-AZ."
  type        = string
  default     = "br-ne1-a"
  # TODO confirmar AZs disponíveis em br-ne1 com Magalu comercial (ADR-009 §perguntas-em-aberto #1)
}

# ─── Block Storage ────────────────────────────────────────────────────────────

variable "block_size_gb" {
  description = "Tamanho do Block Storage NVMe em GB. ADR-009: 100 GB @ 5k IOPS para Postgres + uploads em /data."
  type        = number
  default     = 100

  validation {
    condition     = var.block_size_gb >= 50
    error_message = "Block Storage mínimo recomendado é 50 GB para Postgres + uploads."
  }
}

variable "block_storage_type" {
  description = "Tipo do volume Block Storage. Confirmado em: resources/block_storage_volumes.md (exemplo usa cloud_nvme1k)."
  type        = string
  default     = "cloud_nvme1k"
  # TODO confirmar se cloud_nvme1k está disponível em br-ne1 e entrega 5k IOPS conforme ADR-009
  # Consultar: data "mgc_block_storage_volume_types" para listar tipos disponíveis
}

# ─── SSH ──────────────────────────────────────────────────────────────────────

variable "ssh_key_name" {
  description = "Nome da SSH key já cadastrada na conta Magalu. Usada para acesso inicial à VM."
  type        = string
  # Sem default — obrigatório informar via tfvars ou env var TF_VAR_ssh_key_name
}

variable "ssh_public_key" {
  description = "Conteúdo da chave pública SSH (ex: 'ssh-ed25519 AAAA...'). Cadastrada como mgc_ssh_keys."
  type        = string
  sensitive   = true
  # Sem default — injetar via env var TF_VAR_ssh_public_key ou secrets manager
}

variable "allowed_ssh_cidr" {
  description = "Lista de CIDRs autorizados para SSH (porta 22). ADR-009: SSH restrito a IPs autorizados, nunca 0.0.0.0/0."
  type        = list(string)
  # Sem default — obrigatório definir explicitamente (não expor SSH para internet toda)

  validation {
    condition     = length(var.allowed_ssh_cidr) > 0
    error_message = "Informe ao menos 1 CIDR para SSH. Nunca deixar vazio ou usar 0.0.0.0/0."
  }
}

# ─── Rede ─────────────────────────────────────────────────────────────────────

variable "vpc_cidr" {
  description = "CIDR do subnet pool da VPC acdg-bv-vpc."
  type        = string
  default     = "10.10.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR da subnet pública. Deve ser subconjunto de vpc_cidr."
  type        = string
  default     = "10.10.1.0/24"
}

# ─── Domínio ─────────────────────────────────────────────────────────────────

variable "domain" {
  description = "Domínio principal do deploy (ex: acdg-bv.org.br). ADR-009: DNS via Cloudflare free tier."
  type        = string
  default     = "acdg-bv.org.br"
}

# ─── Object Storage ───────────────────────────────────────────────────────────

variable "backups_bucket_name" {
  description = "Nome do bucket Object Storage para backups. ADR-009: pg_dump cron 03:00 BRT → bucket Cold."
  type        = string
  default     = "acdg-bv-backups"
}

# ─── Container Registry ───────────────────────────────────────────────────────

variable "registry_name" {
  description = "Nome do Container Registry. ADR-009: namespace acdg-bv para imagens dos serviços."
  type        = string
  default     = "acdg-bv"
}
