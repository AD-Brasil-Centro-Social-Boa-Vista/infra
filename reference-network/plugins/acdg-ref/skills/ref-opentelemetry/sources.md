# sources.md — mapa do espelho OpenTelemetry

Base: `REFERENCE_ROOT/observability/opentelemetry/`

---

## Seção 1 — OTel Signals (opentelemetry.io/docs/concepts/signals/)

Versão: **OTel latest main** (SHA `c2f17629cd...`, 2026-05-27)

| Arquivo | Tópico |
|---------|--------|
| `_index.md` | Índice da seção de sinais (overview) |
| `traces.md` | Traces: Span, TraceContext, SpanKind (CLIENT/SERVER/PRODUCER/CONSUMER/INTERNAL), atributos, eventos, links, propagação |
| `metrics.md` | Metrics: Counter, UpDownCounter, Gauge, Histogram, ObservableGauge, exemplars, views |
| `logs.md` | Logs: bridge API, LogRecord, campos, correlação trace_id/span_id |
| `baggage.md` | Baggage: propagação de contexto key-value, W3C Baggage header, quando usar |
| `profiles.md` | Profiles: sinal experimental de CPU/memory profiling |

### Consultas frequentes — Seção 1

| Dúvida | Arquivo |
|--------|---------|
| O que é um span? Quais campos tem? | `traces.md` |
| Tipos de SpanKind | `traces.md` |
| Como propagar contexto entre serviços | `traces.md`, `baggage.md` |
| Diferença entre Counter e Histogram | `metrics.md` |
| Como correlacionar logs com traces | `logs.md` |
| O que é baggage e quando usar vs atributos | `baggage.md` |

---

## Seção 2 — swift-distributed-tracing (apple/swift-distributed-tracing)

Base: `swift-distributed-tracing/`
Versão: **latest main** (SHA `2d9fd5a4`, 2026-05-27)

### Guias

| Arquivo | Tópico |
|---------|--------|
| `README.md` | Visão geral, bootstrap de tracer, `withSpan`, `startSpan` |
| `Docs/README.md` | Documentação avançada |
| `Sources/Tracing/Docs.docc/index.md` | Índice do módulo Tracing |
| `Sources/Tracing/Docs.docc/Guides/TraceYourApplication.md` | Como instrumentar uma aplicação Swift |
| `Sources/Tracing/Docs.docc/Guides/InstrumentYourLibrary.md` | Como instrumentar uma biblioteca Swift |
| `Sources/Tracing/Docs.docc/Guides/ImplementATracer.md` | Como implementar um tracer personalizado |

### Referência de API

| Arquivo | Tipo |
|---------|------|
| `Sources/Tracing/Docs.docc/Reference/Span.md` | Protocol Span |
| `Sources/Tracing/Docs.docc/Reference/Tracer.md` | Protocol Tracer |
| `Sources/Tracing/Docs.docc/Reference/SpanAttributes.md` | SpanAttributes (tipo de coleção) |
| `Sources/Tracing/Docs.docc/Reference/SpanAttribute.md` | SpanAttribute (valor individual) |
| `Sources/Tracing/Docs.docc/Reference/SpanAttributeKey.md` | SpanAttributeKey |
| `Sources/Tracing/Docs.docc/Reference/SpanAttributeNamespace.md` | Namespacing de atributos |
| `Sources/Tracing/Docs.docc/Reference/SpanKind.md` | SpanKind enum |
| `Sources/Tracing/Docs.docc/Reference/SpanStatus.md` | SpanStatus (ok, error, unset) |
| `Sources/Tracing/Docs.docc/Reference/SpanEvent.md` | SpanEvent |
| `Sources/Tracing/Docs.docc/Reference/SpanLink.md` | SpanLink |
| `Sources/Tracing/Docs.docc/Reference/InstrumentationSystem.md` | InstrumentationSystem (bootstrap) |
| `Sources/Tracing/Docs.docc/Reference/NoOpTracer.md` | NoOpTracer (default antes de bootstrap) |
| `Sources/Tracing/Docs.docc/Reference/TracerInstant.md` | TracerInstant |
| `Sources/Instrumentation/Documentation.docc/Documentation.md` | Módulo Instrumentation |
| `Sources/InMemoryTracing/Documentation.docc/Documentation.md` | InMemoryTracer (para testes) |

> Se um arquivo não existir exatamente como listado, confirme via `Glob` dentro do
> subdiretório correto — **não** assuma nomes alternativos.
