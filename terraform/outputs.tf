# outputs.tf — valores exportados após provisionar (ADR-009 §1)
#
# Atributos Read-Only confirmados em:
#   resources/virtual_machine_instances.md  → id, ipv4, local_ipv4
#   resources/network_public_ips.md         → id, public_ip
#   resources/object_storage_buckets.md     → url, region
#   resources/container_registries.md       → id
#   resources/block_storage_volumes.md      → id, created_at

# ─── VM ──────────────────────────────────────────────────────────────────────

output "vm_id" {
  description = "ID único da VM acdg-bv-vps na Magalu Cloud."
  value       = mgc_virtual_machine_instances.acdg_bv_vm.id
}

output "vm_local_ipv4" {
  description = "IP privado (local) da VM — use para comunicação interna na VPC."
  value       = mgc_virtual_machine_instances.acdg_bv_vm.local_ipv4
}

# ─── IP Público ───────────────────────────────────────────────────────────────

output "vm_public_ip" {
  description = "IP público da VPS. Apontar no Cloudflare DNS para acdg-bv.org.br e subdomínios (ADR-009 §4)."
  value       = mgc_network_public_ips.acdg_bv_public_ip.public_ip
}

output "public_ip_id" {
  description = "ID do recurso Public IP Magalu. Necessário para reattach em caso de recriação da VM."
  value       = mgc_network_public_ips.acdg_bv_public_ip.id
}

# ─── Block Storage ────────────────────────────────────────────────────────────

output "block_storage_id" {
  description = "ID do volume Block Storage NVMe (100 GB). Referência para scripts de snapshot (ADR-009 §6)."
  value       = mgc_block_storage_volumes.acdg_bv_data.id
}

# ─── Object Storage Bucket ───────────────────────────────────────────────────

output "backups_bucket_name" {
  description = "Nome do bucket de backups. Usado em scripts/backup-postgres.sh."
  value       = mgc_object_storage_buckets.acdg_bv_backups.bucket
}

output "backups_bucket_url" {
  description = "URL endpoint do bucket de backups (S3-compatible). Usar em CLI mgc object-storage."
  value       = mgc_object_storage_buckets.acdg_bv_backups.url
}

# ─── Container Registry ───────────────────────────────────────────────────────

output "registry_id" {
  description = "ID do Container Registry acdg-bv. Usar para autenticar docker login via CLI mgc."
  value       = mgc_container_registries.acdg_bv.id
}

# ─── Conectividade SSH ────────────────────────────────────────────────────────

output "ssh_connection" {
  description = "Comando SSH para acessar a VM usando a chave provisionada."
  value       = "ssh ubuntu@${mgc_network_public_ips.acdg_bv_public_ip.public_ip}"
}

# ─── Resumo de referências cross-resource ────────────────────────────────────

output "infrastructure_summary" {
  description = "Resumo da infraestrutura ACDG-BV provisionada (ADR-009)."
  value = {
    vpc_id            = mgc_network_vpcs.acdg_bv_vpc.id
    subnet_id         = mgc_network_vpcs_subnets.acdg_bv_public_subnet.id
    security_group_id = mgc_network_security_groups.acdg_bv_sg.id
    nic_id            = mgc_network_vpcs_interfaces.acdg_bv_nic.id
    vm_id             = mgc_virtual_machine_instances.acdg_bv_vm.id
    public_ip         = mgc_network_public_ips.acdg_bv_public_ip.public_ip
    block_storage_id  = mgc_block_storage_volumes.acdg_bv_data.id
    registry_id       = mgc_container_registries.acdg_bv.id
    backups_bucket    = mgc_object_storage_buckets.acdg_bv_backups.bucket
  }
}
