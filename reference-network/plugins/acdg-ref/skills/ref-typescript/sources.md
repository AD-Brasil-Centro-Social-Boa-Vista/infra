# sources.md — mapa do espelho TypeScript

Base: `REFERENCE_ROOT/language/typescript/`
Versão do espelho: **6.0.3** (para `web`) · Versão de `people-context`: **5.9** (sem espelho próprio)
Formato: Markdown (.md) · Data: 2026-05-27 · Arquivos: 133
Fonte original: `github.com/microsoft/TypeScript-Website`
  (subpath `packages/documentation/copy/en`, commit `e89bda93f56aaa7b07f7795fcd1ecb222b19e9c5`)

## AVISO DE DIVERGÊNCIA

| Consumidor | Versão TS em uso | Coberto pelo espelho? |
|------------|------------------|-----------------------|
| `web` | 6.0.3 | Sim — versão exata do espelho |
| `people-context` | 5.9 | Parcial — conteúdo até 6.0 incluso; features 5.9→6.0 podem não existir em prod do serviço |

Ao responder, declare sempre qual versão consultada e avise sobre a divergência quando a
feature pedida puder estar entre 5.9 e 6.0.

## Mapa temático principal

| Tópico | Arquivo(s) inicial(is) |
|--------|------------------------|
| **Handbook v2 — fonte primária** | |
| Tipos básicos e primitivos | `handbook-v2/Basics.md`, `handbook-v2/Everyday Types.md` |
| Narrowing | `handbook-v2/Narrowing.md` |
| Funções | `handbook-v2/More on Functions.md` |
| Tipos de objeto | `handbook-v2/Object Types.md` |
| Generics | `handbook-v1/Generics.md` |
| Classes | `handbook-v1/Classes.md`, `handbook-v2/Classes.md` |
| Módulos | `handbook-v2/Modules.md` |
| Manipulação de tipos | `handbook-v2/Type Manipulation/` |
| Inferência e narrowing avançado | `handbook-v2/Narrowing.md` |
| **Referência** | |
| Utility Types | `reference/Utility Types.md` |
| Decorators | `reference/Decorators.md` |
| Enums | `reference/Enums.md` |
| JSX | `reference/JSX.md` |
| Symbols | `reference/Symbols.md` |
| Namespaces | `reference/Namespaces.md` |
| Declaration Merging | `reference/Declaration Merging.md` |
| Type Compatibility | `reference/Type Compatibility.md` |
| Type Inference | `reference/Type Inference.md` |
| Iterators and Generators | `reference/Iterators and Generators.md` |
| Variable Declarations | `reference/Variable Declarations.md` |
| Triple-Slash Directives | `reference/Triple-Slash Directives.md` |
| **Project config** | |
| tsconfig.json | `project-config/tsconfig.json.md` |
| Compiler Options | `project-config/Compiler Options.md` |
| Project References | `project-config/Project References.md` |
| **Módulos** | |
| Teoria | `modules-reference/Theory.md` |
| Referência | `modules-reference/Reference.md` |
| **Declaration files** | |
| Introdução | `declaration-files/Introduction.md` |
| By Example | `declaration-files/By Example.md` |
| Do's and Don'ts | `declaration-files/Do's and Don'ts.md` |
| **Release notes (seleção relevante)** | |
| TypeScript 6.0 | `release-notes/TypeScript 6.0.md` |
| TypeScript 5.9 | `release-notes/TypeScript 5.9.md` |
| TypeScript 5.8 | `release-notes/TypeScript 5.8.md` |
| TypeScript 5.7 | `release-notes/TypeScript 5.7.md` |
| TypeScript 5.5 | `release-notes/TypeScript 5.5.md` |
| TypeScript 5.0 | `release-notes/TypeScript 5.0.md` |
| (todas versões 1.1–6.0) | `release-notes/TypeScript <X.Y>.md` |

> Confirme existência de arquivos via `Glob 'language/typescript/**/*.md'` antes de `Read`.
