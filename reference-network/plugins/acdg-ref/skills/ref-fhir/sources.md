# sources.md — mapa do espelho FHIR R4

Base: `REFERENCE_ROOT/interop-health/fhir-br-core/`

## Arquivos disponíveis sem descompactar

| Arquivo | Tamanho | Conteúdo |
|---------|---------|----------|
| `extracted/overview.html` | 33 KB | Visão geral da especificação FHIR R4: propósito, arquitetura, recursos base |
| `extracted/modules.html` | 21 KB | Mapa de módulos (Foundation, Base, Clinical, Financial, Workflow, Conformance) |
| `extracted/index.html` | 166 B | Entrada do site (redirect para site/) |
| `extracted/zip-index.txt` | ~40 linhas | Índice dos HTMLs-chave do zip para referência cruzada |
| `_SOURCE.md` | — | Metadados do espelho; referências BR Core / RNDS (Simplifier.net, GitHub kyriosdata/rnds) |

## O zip (fhir-r4-spec.zip — 201 MB, ~35 700 entradas)

Contém a especificação FHIR R4 completa em HTML, JSON schemas, XML schemas e exemplos.
**NÃO descompactado.** Estrutura interna: `site\<recurso>.html` (usando separador `\` do Windows).

Páginas-chave identificadas no zip (via `unzip -l`):

| Tópico | Arquivo no zip |
|--------|----------------|
| Overview geral | `site\overview.html` ← já em `extracted/` |
| Módulos | `site\modules.html` ← já em `extracted/` |
| Lista completa de recursos | `site\resourcelist.html` |
| Tipos de dados | `site\datatypes.html` |
| Extensibilidade | `site\extensibility.html` |
| Formatos (JSON/XML/RDF) | `site\formats.html`, `site\json.html`, `site\xml.html`, `site\rdf.html` |
| REST / HTTP | `site\http.html` |
| Operações | `site\operations.html` |
| Busca | `site\search.html` |
| Segurança | `site\security.html` |
| Referências entre recursos | `site\references.html` |
| Narrativa | `site\narrative.html` |
| Assinaturas | `site\signatures.html` |
| Bundle | `site\bundle.html` |
| Patient | `site\patient.html` |
| Observation | `site\observation.html` |
| Condition | `site\condition.html` |
| Encounter | `site\encounter.html` |
| Procedure | `site\procedure.html` |
| Medication | `site\medication.html` |
| Immunization | `site\immunization.html` |
| CapabilityStatement | `site\capabilitystatement.html` |
| StructureDefinition | `site\structuredefinition.html` |
| ValueSet | `site\valueset.html` |
| CodeSystem | `site\codesystem.html` |
| ConceptMap | `site\conceptmap.html` |
| TOC completo | `site\toc.html` (3 MB — pesado) |

Para extrair um HTML específico do zip (instrução ao consultante, não execução):
```bash
unzip -p fhir-r4-spec.zip "*patient.html" > patient.html
```

## BR Core / RNDS (não offline)

Perfis FHIR BR específicos do Brasil **não estão no zip**. Referências do `_SOURCE.md`:
- Simplifier.net RNDS: https://simplifier.net/redenacionaldedadosemsaude
- Portal RNDS DATASUS: https://rnds-guia.datasus.gov.br/
- GitHub kyriosdata/rnds: https://github.com/kyriosdata/rnds

## Versão do espelho

- Especificação: **FHIR R4** (HL7, dezembro 2019)
- Data de coleta do zip: 2026-05-27
- Fonte: https://hl7.org/fhir/R4/fhir-spec.zip
