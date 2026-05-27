# sources.md — mapa do espelho NATS

Base: `REFERENCE_ROOT/` (três pastas — ver SKILL.md para caminho absoluto)

---

## 1. Docs oficiais — `messaging/nats-jetstream/`

Versão: docs.nats.io HEAD (commit 7880a38, capturado 2026-05-27).
Navegação principal: `SUMMARY.md` (índice GitBook completo).

### Conceitos NATS (`nats-concepts/`)

| Tópico | Caminho |
|--------|---------|
| Visão geral | `nats-concepts/what-is-nats/README.md` |
| Subject-based messaging | `nats-concepts/subjects.md` |
| Subject mapping / particionamento | `nats-concepts/subject_mapping.md` |
| Acknowledgements (core NATS) | `nats-concepts/acks.md` |
| Segurança | `nats-concepts/security.md` |
| Conectividade | `nats-concepts/connectivity.md` |
| Pub-Subscribe (Core NATS) | `nats-concepts/core-nats/publish-subscribe/pubsub.md` |
| Request-Reply (Core NATS) | `nats-concepts/core-nats/request-reply/reqreply.md` |
| Queue Groups | `nats-concepts/core-nats/queue-groups/queue.md` |
| Número de sequência | `nats-concepts/seq_num.md` |

### JetStream — Conceitos (`nats-concepts/jetstream/`)

| Tópico | Caminho |
|--------|---------|
| README / visão geral | `nats-concepts/jetstream/README.md` |
| Streams (config, limites, retenção) | `nats-concepts/jetstream/streams.md` |
| Consumers (durable, pull, push, ordered) | `nats-concepts/jetstream/consumers.md` |
| Consumers — exemplo de config | `nats-concepts/jetstream/example_configuration.md` |
| Headers | `nats-concepts/jetstream/headers.md` |
| Source and Mirror Streams | `nats-concepts/jetstream/source_and_mirror.md` |
| Source/Mirror — exemplo | `nats-concepts/jetstream/source_and_mirror_example.md` |
| JetStream Walkthrough | `nats-concepts/jetstream/js_walkthrough.md` |
| Key/Value Store — visão geral | `nats-concepts/jetstream/key-value-store/README.md` |
| KV Walkthrough | `nats-concepts/jetstream/key-value-store/kv_walkthrough.md` |
| Object Store | `nats-concepts/jetstream/object-store/obj_store.md` |
| Object Store Walkthrough | `nats-concepts/jetstream/object-store/obj_walkthrough.md` |

### Using NATS — JetStream (`using-nats/jetstream/`)

| Tópico | Caminho |
|--------|---------|
| Model Deep Dive (deduplicação, acks, redelivery) | `using-nats/jetstream/model_deep_dive.md` |
| Develop with JetStream | `using-nats/jetstream/develop_jetstream.md` |
| Getting Started | `using-nats/jetstream/getting_started/README.md` |
| Concepts (using-nats view) | `using-nats/jetstream/concepts/README.md` |
| NATS API Reference | `using-nats/jetstream/nats_api_reference.md` |

### Desenvolvendo com NATS (`using-nats/developing-with-nats/`)

| Tópico | Caminho |
|--------|---------|
| Developer overview | `using-nats/developing-with-nats/developer.md` |
| Anatomia de um app NATS | `using-nats/developing-with-nats/anatomy.md` |
| Conectando | `using-nats/developing-with-nats/connecting/README.md` |
| Reconexão automática | `using-nats/developing-with-nats/reconnect/README.md` |
| JetStream (using-nats/js/) | `using-nats/developing-with-nats/js/` |

### Rodando o servidor (`running-a-nats-service/`)

| Tópico | Caminho |
|--------|---------|
| Instalação | `running-a-nats-service/installation.md` |
| Flags de linha de comando | `running-a-nats-service/running/flags.md` |
| Configuração — README | `running-a-nats-service/configuration/README.md` |
| JetStream config | `running-a-nats-service/configuration/jetstream-config/resource_management.md` |
| JetStream config — mgmt | `running-a-nats-service/configuration/jetstream-config/configuration_mgmt/` |
| Clustering | `running-a-nats-service/configuration/clustering/` |
| Monitoramento | `running-a-nats-service/configuration/monitoring.md` |
| Logging | `running-a-nats-service/configuration/logging.md` |
| Segurança do servidor | `running-a-nats-service/configuration/securing_nats/` |
| Docker | `running-a-nats-service/running/nats_docker/` |

### Release Notes (`release_notes/`)

| Arquivo | Conteúdo |
|---------|----------|
| `release_notes/whats_new.md` | Índice de releases |
| `release_notes/whats_new_214.md` | NATS 2.14 |
| `release_notes/whats_new_212.md` | NATS 2.12 |
| `release_notes/whats_new_211.md` | NATS 2.11 |
| `release_notes/whats_new_210.md` | NATS 2.10 |
| `release_notes/whats_new_22.md` | NATS 2.2 (introdução JetStream) |

### Referência (`reference/`)

| Tópico | Caminho |
|--------|---------|
| FAQ | `reference/faq.md` |
| Protocolo NATS | `reference/nats-protocol/` |
| Servidor NATS — protocolo | `reference/nats-server-protocol.md` |

---

## 2. Cliente Go — `messaging-client/nats-go/` (v1.50.0)

| Tópico | Caminho |
|--------|---------|
| README principal (core pub/sub, API básica) | `README.md` |
| JetStream — API nova (preferida) | `jetstream/README.md` |
| JetStream — Streams, Consumers, KV, Object Store, Publish | `jetstream/README.md` (seções internas) |
| JetStream — MIGRATION (legado → novo) | `jetstream/MIGRATION.md` |
| JetStream — API legada (`nats.JetStream()`) | `legacy_jetstream.md` |
| Micro services framework | `micro/README.md` |
| Dependências (go.mod) | `dependencies.md` |
| _SOURCE (versão e commit) | `_SOURCE.md` |

> O pacote `jetstream/` (novo) substitui o `js.go`/`jsm.go` legado. Para novos
> projetos (como `analysis-bi`), usar `jetstream.New(nc)` — não `nc.JetStream()`.

---

## 3. Cliente JS — `messaging-client/nats-js/` (v3.4.0 — monorepo)

| Módulo | Caminho | Pacote npm/JSR |
|--------|---------|----------------|
| README principal | `README.md` | — |
| Guia de migração v2→v3 | `migration.md` | — |
| Core (pub/sub, request/reply) | `core/README.md` | `@nats-io/nats-core` |
| JetStream | `jetstream/README.md` | `@nats-io/jetstream` |
| Key/Value Store | `kv/README.md` | `@nats-io/kv` |
| Object Store | `obj/README.md` | `@nats-io/obj` |
| Services | `services/README.md` | `@nats-io/services` |
| Runtimes suportados | `runtimes.md` | — |
| _SOURCE (versão e commit) | `_SOURCE.md` | — |

> **ATENÇÃO — divergência de versão:** o espelho contém v3.4.0. O `people-context`
> fixa `nats` 2.29.3 (API legada). A tag v2.29.3 não existe no upstream atual.
> Ao citar API JS, sempre declare essa divergência. Ver SKILL.md para detalhes.

---

## Estratégia de busca recomendada

1. Para conceitos (streams, consumers, acks, KV): comece em `nats-concepts/jetstream/`.
2. Para semântica de redelivery/ack-policy/durable: `nats-concepts/jetstream/consumers.md` e
   `using-nats/jetstream/model_deep_dive.md`.
3. Para API Go: `messaging-client/nats-go/jetstream/README.md`.
4. Para API JS: `messaging-client/nats-js/jetstream/README.md` (e módulos específicos).
5. Para config do servidor: `running-a-nats-service/configuration/`.
6. Para versão de introdução de feature: `release_notes/whats_new_*.md`.
7. Se não encontrar: `Grep` pelo termo no universo inteiro, depois recuse se ausente.
