# main.tf — recursos de infra ACDG-Boa Vista (ADR-009 §1)
#
# Todos os resource names e argumentos confirmados nos arquivos de referência:
#   infra/reference/iac/magalu-cloud-provider/resources/
#   infra/reference/iac/magalu-cloud-provider/guides/
#
# Ordem de criação (dependências):
#   SSH Key → VPC → Subnet Pool → Subnet → Security Group + Rules
#   → NIC pública → Public IP + attach → VM → Block Storage + attach
#   → Object Storage bucket → Container Registry

# ─────────────────────────────────────────────────────────────────────────────
# 0. SSH Key
# Confirmado em: resources/ssh_keys.md
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_ssh_keys" "acdg_bv" {
  name = "acdg-bv-deploy"
  key  = var.ssh_public_key
}

# ─────────────────────────────────────────────────────────────────────────────
# 1. VPC — acdg-bv-vpc (ADR-009 §1)
# Confirmado em: resources/network_vpcs.md
# Schema: required = name; optional = description
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_network_vpcs" "acdg_bv_vpc" {
  name        = "acdg-bv-vpc"
  description = "VPC principal do deploy ACDG-Boa Vista (ADR-009)"
}

# ─────────────────────────────────────────────────────────────────────────────
# 2. Subnet Pool
# Necessário antes de criar subnets.
# Confirmado em: resources/network_subnetpools.md
# Schema: required = name, description; optional = cidr
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_network_subnetpools" "acdg_bv_subnetpool" {
  name        = "acdg-bv-subnetpool"
  description = "Subnet pool para VPC ACDG-BV (${var.vpc_cidr})"
  cidr        = var.vpc_cidr
}

# ─────────────────────────────────────────────────────────────────────────────
# 3. Subnet pública (ADR-009 §1: "1 subnet pública")
# Confirmado em: resources/network_vpcs_subnets.md
# Schema: required = cidr_block, ip_version, name, subnetpool_id, vpc_id
#         optional = availability_zone, description, dns_nameservers
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_network_vpcs_subnets" "acdg_bv_public_subnet" {
  name            = "acdg-bv-public-subnet"
  description     = "Subnet pública — entrada Caddy + SSH restrito (ADR-009)"
  vpc_id          = mgc_network_vpcs.acdg_bv_vpc.id
  subnetpool_id   = mgc_network_subnetpools.acdg_bv_subnetpool.id
  cidr_block      = var.subnet_cidr
  ip_version      = "IPv4"
  availability_zone = var.availability_zone
  dns_nameservers = ["8.8.8.8", "1.1.1.1"]
}

# ─────────────────────────────────────────────────────────────────────────────
# 4. Security Group (ADR-009 §1: "security group + rules")
# Confirmado em: resources/network_security_groups.md
# Schema: required = name; optional = description, disable_default_rules
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_network_security_groups" "acdg_bv_sg" {
  name                  = "acdg-bv-sg"
  description           = "Firewall da VPS ACDG-BV: SSH restrito, HTTP, HTTPS/TCP+UDP, STUN (ADR-009)"
  disable_default_rules = true # Desabilitar regras default; controlar explicitamente abaixo
}

# ─────────────────────────────────────────────────────────────────────────────
# 4a. Regras de entrada — SSH restrito (ADR-009: "22/tcp só de IPs autorizados")
# Confirmado em: resources/network_security_groups_rules.md
# Schema: required = direction, ethertype, security_group_id
#         optional = description, port_range_max, port_range_min, protocol, remote_ip_prefix
# ─────────────────────────────────────────────────────────────────────────────

# SSH IPv4 — uma regra por CIDR autorizado (for_each sobre var.allowed_ssh_cidr)
resource "mgc_network_security_groups_rules" "acdg_bv_sg_ssh" {
  for_each = toset(var.allowed_ssh_cidr)

  description       = "SSH restrito (${each.value}) — ADR-009"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 22
  port_range_max    = 22
  protocol          = "tcp"
  remote_ip_prefix  = each.value
  security_group_id = mgc_network_security_groups.acdg_bv_sg.id
}

# HTTP/80 — redirect para HTTPS via Caddy (ADR-009)
resource "mgc_network_security_groups_rules" "acdg_bv_sg_http" {
  description       = "HTTP 80/tcp — Caddy redireciona para HTTPS (ADR-009)"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 80
  port_range_max    = 80
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.acdg_bv_sg.id
}

# HTTPS/443 TCP — tráfego web principal (ADR-009)
resource "mgc_network_security_groups_rules" "acdg_bv_sg_https_tcp" {
  description       = "HTTPS 443/tcp — tráfego web + TLS (ADR-009)"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.acdg_bv_sg.id
}

# HTTPS/443 UDP — HTTP/3 via QUIC (ADR-009: Caddy tem HTTP/3 nativo)
resource "mgc_network_security_groups_rules" "acdg_bv_sg_https_udp" {
  description       = "HTTPS 443/udp — HTTP/3 QUIC via Caddy (ADR-009)"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "udp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.acdg_bv_sg.id
}

# STUN/3478 UDP — futuro WebRTC/TURN (ADR-009: "3478/udp futuro STUN/TURN se WebRTC")
resource "mgc_network_security_groups_rules" "acdg_bv_sg_stun_udp" {
  description       = "STUN 3478/udp — reservado para futuro WebRTC/TURN (ADR-009)"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 3478
  port_range_max    = 3478
  protocol          = "udp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.acdg_bv_sg.id
}

# Egress — liberar todo tráfego de saída (padrão seguro para VPS)
resource "mgc_network_security_groups_rules" "acdg_bv_sg_egress_all" {
  description       = "Egress irrestrito — saída para internet (updates, DNS, ACME Let's Encrypt)"
  direction         = "egress"
  ethertype         = "IPv4"
  security_group_id = mgc_network_security_groups.acdg_bv_sg.id
  # Sem port_range e sem remote_ip_prefix = permite todo tráfego de saída
  # TODO confirmar arg exato para "all protocols" sem protocol= em network_security_groups_rules.md
}

# ─────────────────────────────────────────────────────────────────────────────
# 5. Network Interface — interface pública da VM
# Confirmado em: resources/network_vpcs_interfaces.md + guides/network-basics.md
# Schema: required = name, vpc_id; optional = availability_zone, ip_address, subnet_ids (write-only)
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_network_vpcs_interfaces" "acdg_bv_nic" {
  name              = "acdg-bv-primary-nic"
  vpc_id            = mgc_network_vpcs.acdg_bv_vpc.id
  availability_zone = var.availability_zone

  # subnet_ids é write-only (Terraform >= 1.11). Garantir que a subnet existe antes.
  depends_on = [mgc_network_vpcs_subnets.acdg_bv_public_subnet]
}

# ─────────────────────────────────────────────────────────────────────────────
# 5a. Attach Security Group à interface
# Confirmado em: resources/network_security_groups_attach.md + guides/network-basics.md
# Schema: required = security_group_id, interface_id
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_network_security_groups_attach" "acdg_bv_sg_attach" {
  security_group_id = mgc_network_security_groups.acdg_bv_sg.id
  interface_id      = mgc_network_vpcs_interfaces.acdg_bv_nic.id
}

# ─────────────────────────────────────────────────────────────────────────────
# 6. Public IP — IP público para apontar DNS Cloudflare (ADR-009 §4)
#
# Nota sobre Floating IP (ADR-009 §1 "perguntas em aberto #3"):
#   O provider mgc NÃO expõe um resource dedicado "floating_ip" ou "elastic_ip".
#   O equivalente disponível é mgc_network_public_ips + mgc_network_public_ips_attach.
#   Este IP persiste mesmo após deleção da VM (conforme guides/vm-network.md nota #4).
#   Para comportamento de "floating IP" (reatribuir a nova VM sem trocar DNS),
#   basta recriar o attach — o IP permanece na conta.
#
# Confirmado em: resources/network_public_ips.md
# Schema: required = vpc_id; optional = description
# Read-Only: id, public_ip
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_network_public_ips" "acdg_bv_public_ip" {
  description = "IP público da VPS ACDG-BV — apontar no Cloudflare DNS (ADR-009)"
  vpc_id      = mgc_network_vpcs.acdg_bv_vpc.id
}

# Attach do Public IP à interface primária da VM
# Confirmado em: resources/network_public_ips_attach.md
# Schema: required = public_ip_id, interface_id
resource "mgc_network_public_ips_attach" "acdg_bv_ip_attach" {
  public_ip_id = mgc_network_public_ips.acdg_bv_public_ip.id
  interface_id = mgc_network_vpcs_interfaces.acdg_bv_nic.id
}

# ─────────────────────────────────────────────────────────────────────────────
# 7. VM — BV4-16-50 (ADR-009 §1: "1 VM BV4-16-50 (4 vCPU, 16 GB RAM, 50 GB SSD)")
# Confirmado em: resources/virtual_machine_instances.md
# Schema: required = machine_type, name
#         optional = availability_zone, image, ssh_key_name, vpc_id,
#                    network_interface_id, creation_security_groups (write-only),
#                    allocate_public_ipv4 (write-only), user_data
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_virtual_machine_instances" "acdg_bv_vm" {
  name              = "acdg-bv-vps"
  machine_type      = var.vm_flavor    # BV4-16-50
  image             = var.vm_image     # cloud-ubuntu-24.04 LTS
  availability_zone = var.availability_zone
  ssh_key_name      = mgc_ssh_keys.acdg_bv.name

  # Usar a interface já criada com Public IP e Security Group attachados.
  # Nota: quando network_interface_id é usado, vpc_id, creation_security_groups
  # e allocate_public_ipv4 NÃO podem ser usados (guides/vm-network.md §Mutually Exclusive).
  network_interface_id = mgc_network_vpcs_interfaces.acdg_bv_nic.id

  # user_data: cloud-init para configuração inicial (Docker install, /data mount, etc.)
  # TODO expandir script de bootstrap quando compose/ estiver definido (INFRA-BV-COMPOSE-BASE)
  user_data = base64encode(<<-EOF
    #!/bin/bash
    set -euo pipefail
    # Atualizar e instalar Docker CE + Docker Compose plugin
    apt-get update -qq
    apt-get install -y ca-certificates curl gnupg
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
      | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    chmod a+r /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
      > /etc/apt/sources.list.d/docker.list
    apt-get update -qq
    apt-get install -y docker-ce docker-ce-cli containerd.io \
      docker-buildx-plugin docker-compose-plugin
    systemctl enable --now docker
    # Criar ponto de montagem para Block Storage NVMe (Postgres + uploads)
    mkdir -p /data
    # TODO: formatar e montar o volume NVMe após provisionar (scripts/setup-data-volume.sh)
    echo "Bootstrap ACDG-BV concluído: $(date)" >> /var/log/acdg-bootstrap.log
  EOF
  )

  depends_on = [
    mgc_network_public_ips_attach.acdg_bv_ip_attach,
    mgc_network_security_groups_attach.acdg_bv_sg_attach,
  ]
}

# ─────────────────────────────────────────────────────────────────────────────
# 8. Block Storage NVMe 100 GB (ADR-009 §1: "Block Storage NVMe 100 GB @ 5k IOPS")
# Confirmado em: resources/block_storage_volumes.md
# Schema: required = name, size, type; optional = availability_zone, encrypted, snapshot_id
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_block_storage_volumes" "acdg_bv_data" {
  name              = "acdg-bv-data"
  size              = var.block_size_gb   # 100 GB
  type              = var.block_storage_type # cloud_nvme1k
  availability_zone = var.availability_zone  # Deve ser mesma AZ da VM
  encrypted         = true                   # Dados de saúde — LGPD exige proteção em repouso
}

# Attach Block Storage à VM
# Confirmado em: resources/block_storage_volume_attachment.md
# Schema: required = block_storage_id, virtual_machine_id
resource "mgc_block_storage_volume_attachment" "acdg_bv_data_attach" {
  block_storage_id   = mgc_block_storage_volumes.acdg_bv_data.id
  virtual_machine_id = mgc_virtual_machine_instances.acdg_bv_vm.id
}

# ─────────────────────────────────────────────────────────────────────────────
# 9. Object Storage Bucket — backups (ADR-009 §1 + §6)
#
# ADR-009 especifica "tier Cold" para backups (pg_dump cron 03:00 BRT).
# O provider mgc NÃO expõe argumento "storage_class" ou "tier" no resource
# mgc_object_storage_buckets (confirmado em resources/object_storage_buckets.md).
# O tier Cold pode ser configurado via lifecycle policy (JSON) no campo `policy`
# ou via console Magalu após criação.
#
# Confirmado em: resources/object_storage_buckets.md
# Schema: required = bucket; optional = cors, lock, policy, versioning
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_object_storage_buckets" "acdg_bv_backups" {
  bucket     = var.backups_bucket_name # "acdg-bv-backups"
  versioning = true                    # Versionamento para retenção histórica (ADR-008: 5 anos audit, 10 anos Protection BC)

  # TODO confirmar arg para definir storage class "Cold" no provider mgc.
  # O resource mgc_object_storage_buckets não expõe "storage_class" diretamente
  # (verificar em resources/object_storage_buckets.md — campo não encontrado).
  # Alternativa: configurar lifecycle policy via campo `policy` (JSON S3-compatible)
  # após validar sintaxe com Magalu suporte.
}

# ─────────────────────────────────────────────────────────────────────────────
# 10. Container Registry (ADR-009 §1: "1 Container Registry acdg-bv namespace")
# Confirmado em: resources/container_registries.md
# Schema: required = name; optional = proxy_cache_id; read-only = id
# ─────────────────────────────────────────────────────────────────────────────

resource "mgc_container_registries" "acdg_bv" {
  name = var.registry_name # "acdg-bv"
  # proxy_cache_id não necessário no MVP — registro privado direto
}
