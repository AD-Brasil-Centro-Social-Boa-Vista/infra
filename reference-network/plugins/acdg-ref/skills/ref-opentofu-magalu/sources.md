# sources.md — mapa do espelho OpenTofu / Terraform / provider mgc

Base: `REFERENCE_ROOT/iac/`
onde `REFERENCE_ROOT = infra/reference`

---

## 1. OpenTofu (`iac/opentofu-terraform/opentofu/`)

Fonte: `github.com/opentofu/opentofu` — `website/docs` (SHA ef00d6ed, 2026-05-27).

### Linguagem HCL (`language/`)

| Tópico | Arquivo(s) principal(is) |
|--------|--------------------------|
| Visão geral da linguagem | `language/index.mdx` |
| Sintaxe HCL | `language/syntax/` |
| Resources | `language/resources/index.mdx`, `language/resources/syntax.mdx`, `language/resources/behavior.mdx`, `language/resources/tf-data.mdx` |
| Data sources | `language/data-sources/index.mdx` |
| Variables (input) | `language/values/variables.mdx` |
| Locals | `language/values/locals.mdx` |
| Outputs | `language/values/outputs.mdx` |
| Módulos | `language/modules/index.mdx`, `language/modules/syntax.mdx`, `language/modules/sources.mdx` |
| Providers | `language/providers/index.mdx`, `language/providers/configuration.mdx`, `language/providers/requirements.mdx` |
| State | `language/state/index.mdx`, `language/state/backends.mdx`, `language/state/locking.mdx`, `language/state/remote.mdx`, `language/state/remote-state-data.mdx`, `language/state/workspaces.mdx` |
| Backends (configuração) | `language/settings/backends/` (subpasta com local.mdx, s3.mdx, pg.mdx, gcs.mdx, azurerm.mdx, http.mdx, …) |
| Expressions | `language/expressions/index.mdx`, `language/expressions/references.mdx`, `language/expressions/for.mdx`, `language/expressions/conditionals.mdx`, `language/expressions/dynamic-blocks.mdx` |
| Meta-arguments | `language/meta-arguments/` |
| Funções built-in | `language/functions/` (abs.mdx, base64encode.mdx, cidrsubnet.mdx, file.mdx, …) |
| Settings / terraform block | `language/settings/index.mdx` |
| Checks | `language/checks/` |
| Ephemerality | `language/ephemerality/` |
| Import | `language/import/` |

### CLI OpenTofu (`cli/`)

| Comando | Arquivo |
|---------|---------|
| `tofu init` | `cli/commands/init.mdx` |
| `tofu plan` | `cli/commands/plan.mdx` |
| `tofu apply` | `cli/commands/apply.mdx` |
| `tofu destroy` | `cli/commands/destroy.mdx` |
| `tofu import` | `cli/commands/import.mdx` |
| `tofu state` | `cli/commands/state/` |
| `tofu fmt` | `cli/commands/fmt.mdx` |
| `tofu output` | `cli/commands/output.mdx` |
| `tofu show` | `cli/commands/show.mdx` |
| Workspaces | `cli/workspaces/` |

---

## 2. Terraform v1.12.x (`iac/opentofu-terraform/terraform/`)

Fonte: `github.com/hashicorp/web-unified-docs` — `content/terraform/v1.12.x/docs` (SHA bc276bd6, 2026-05-27).

### Linguagem HCL (`language/`)

| Tópico | Arquivo(s) principal(is) |
|--------|--------------------------|
| Resources | `language/resources/index.mdx`, `language/resources/configure.mdx`, `language/resources/destroy.mdx` |
| Data sources | `language/data-sources/index.mdx` |
| Variables / Locals / Outputs | `language/values/` |
| Módulos | `language/modules/` |
| Providers | `language/providers/` |
| State | `language/state/` |
| **Backends** | `language/backend/index.mdx`, `language/backend/s3.mdx`, `language/backend/pg.mdx`, `language/backend/gcs.mdx`, `language/backend/http.mdx`, `language/backend/local.mdx`, … |
| Expressions | `language/expressions/` |
| Meta-arguments | `language/meta-arguments/` |
| Funções | `language/functions/` |
| Testes | `language/tests/` |
| Manage sensitive data | `language/manage-sensitive-data/` |
| Stacks | `language/stacks/` |

### CLI Terraform (`cli/`)

Estrutura análoga ao OpenTofu: `cli/commands/`, `cli/state/`, `cli/workspaces/`, etc.

---

## 3. Provider mgc v0.50.x (`iac/magalu-cloud-provider/`)

Fonte: `github.com/MagaluCloud/terraform-provider-mgc` — `docs/` (SHA 3931a722, 2026-05-27).
Gerado com `tfplugindocs`. Pin de versão: **v0.50.x** (conforme ADR-009).

### Índice e configuração do provider

| Arquivo | Conteúdo |
|---------|----------|
| `index.md` | Configuração do provider: argumentos `api_key` (required), `region`, `env`, `key_pair_id`, `key_pair_secret`; regiões disponíveis: `br-ne1`, `br-se1`, `br-mgl1`, `br-mc1`; default `br-se1`. |

### Resources (`resources/`)

| Resource | Arquivo | Categoria |
|----------|---------|-----------|
| `mgc_virtual_machine_instances` | `resources/virtual_machine_instances.md` | Virtual Machine |
| `mgc_virtual_machine_snapshots` | `resources/virtual_machine_snapshots.md` | Virtual Machine |
| `mgc_virtual_machine_interface_attach` | `resources/virtual_machine_interface_attach.md` | Virtual Machine |
| `mgc_block_storage_volumes` | `resources/block_storage_volumes.md` | Block Storage |
| `mgc_block_storage_volume_attachment` | `resources/block_storage_volume_attachment.md` | Block Storage |
| `mgc_block_storage_snapshots` | `resources/block_storage_snapshots.md` | Block Storage |
| `mgc_block_storage_schedule` | `resources/block_storage_schedule.md` | Block Storage |
| `mgc_block_storage_schedule_attach` | `resources/block_storage_schedule_attach.md` | Block Storage |
| `mgc_object_storage_buckets` | `resources/object_storage_buckets.md` | Object Storage |
| `mgc_network_vpcs` | `resources/network_vpcs.md` | Networking |
| `mgc_network_vpcs_subnets` | `resources/network_vpcs_subnets.md` | Networking |
| `mgc_network_vpcs_interfaces` | `resources/network_vpcs_interfaces.md` | Networking |
| `mgc_network_vpcs_route` | `resources/network_vpcs_route.md` | Networking |
| `mgc_network_public_ips` | `resources/network_public_ips.md` | Networking |
| `mgc_network_public_ips_attach` | `resources/network_public_ips_attach.md` | Networking |
| `mgc_network_security_groups` | `resources/network_security_groups.md` | Networking |
| `mgc_network_security_groups_attach` | `resources/network_security_groups_attach.md` | Networking |
| `mgc_network_security_groups_rules` | `resources/network_security_groups_rules.md` | Networking |
| `mgc_network_subnetpools` | `resources/network_subnetpools.md` | Networking |
| `mgc_network_nat_gateway` | `resources/network_nat_gateway.md` | Networking |
| `mgc_lbaas_network` | `resources/lbaas_network.md` | Load Balancer |
| `mgc_ssh_keys` | `resources/ssh_keys.md` | SSH |
| `mgc_kubernetes_cluster` | `resources/kubernetes_cluster.md` | Kubernetes |
| `mgc_kubernetes_nodepool` | `resources/kubernetes_nodepool.md` | Kubernetes |
| `mgc_dbaas_instances` | `resources/dbaas_instances.md` | DBaaS |
| `mgc_dbaas_clusters` | `resources/dbaas_clusters.md` | DBaaS |
| `mgc_dbaas_replicas` | `resources/dbaas_replicas.md` | DBaaS |
| `mgc_dbaas_instances_snapshots` | `resources/dbaas_instances_snapshots.md` | DBaaS |
| `mgc_dbaas_parameter_groups` | `resources/dbaas_parameter_groups.md` | DBaaS |
| `mgc_container_registries` | `resources/container_registries.md` | Container Registry |
| `mgc_container_registry_proxy_cache` | `resources/container_registry_proxy_cache.md` | Container Registry |

### Data sources (`data-sources/`)

Contém data sources correspondentes (singular e plural) para a maioria dos resources acima,
além de `availability_zones.md`, `virtual_machine_images.md`, `virtual_machine_types.md`,
`block_storage_volume_types.md`, `dbaas_engines.md`, `dbaas_instance_types.md`, etc.

### Guides (`guides/`)

| Guia | Arquivo | Tema |
|------|---------|------|
| State backend no MGC (S3) | `guides/backend-tsstate.md` | State via S3-compatible Object Storage |
| Regiões e Zonas | `guides/region.md` | Regiões `br-ne1`/`br-se1`, AZ naming `br-ne1-a` |
| Chaves SSH | `guides/ssh.md` | Gerenciamento de SSH keys |
| VM + Volumes | `guides/vm-volumes.md` | Block storage + attach a VMs |
| VM + Rede | `guides/vm-network.md` | VPC, interfaces, IPs públicos |
| VM + user-data | `guides/vm-user-data.md` | Cloud-init / user data |
| VMs Windows | `guides/vm-windows.md` | Instâncias Windows |
| API Key | `guides/api-key.md` | Autenticação via api_key |
| Env variables | `guides/env-variables.md` | Variáveis de ambiente do provider |
| Network basics | `guides/network-basics.md` | VPC, subnets, security groups |
| DBaaS creation | `guides/dbaas-creation.md` | Criação de instâncias DBaaS |
| DBaaS migration | `guides/dbaas-migration.md` | Migração de banco de dados |
| Kubernetes cluster | `guides/k8s-cluster.md` | Criação de cluster K8s |
| Load Balancer | `guides/lbaas.md` | LBaaS configuration |

> **Nota:** Os nomes de arquivo acima são verificados (listagem real do espelho em 2026-05-27).
> Se algum não responder, use `Glob 'iac/magalu-cloud-provider/resources/*.md'` para confirmar.
