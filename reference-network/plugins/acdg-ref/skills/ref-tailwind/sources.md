# sources.md — mapa do espelho Tailwind CSS

Base: `HBROOT/ui/tailwind/`
onde `HBROOT = web/handbook/reference`

> **Localização especial:** este universo está em `web/handbook/reference/`, NÃO em `infra/reference/`.
> Versão espelhada: **Tailwind CSS v4.3** (fonte: `tailwindlabs/tailwindcss.com` branch `main`, pasta `src/docs/`).
> Total: ~221 arquivos .md (~2.0 MB).

## Navegação principal

| Tópico | Arquivo(s) |
|--------|------------|
| **Índice completo** | `README.md` |
| Compatibilidade browser/Node | `compatibility.md` |
| Migração v3 → v4 | `upgrade-guide.md` |
| Editor setup, IntelliSense | `editor-setup.md` |

## Core Concepts

| Tópico | Arquivo(s) |
|--------|------------|
| Utility classes (filosofia, uso básico) | `styling-with-utility-classes.md` |
| Variantes: hover, focus, active, group, peer | `hover-focus-and-other-states.md` |
| Responsive design, breakpoints | `responsive-design.md` |
| Dark mode | `dark-mode.md` |
| Tema (`@theme`, CSS variables, design tokens) | `theme.md` |
| Paleta de cores padrão | `colors.md` |
| Custom styles (`@layer`, `@utility`, `@variant`) | `adding-custom-styles.md` |
| Detecção de classes em source files (`@source`) | `detecting-classes-in-source-files.md` |
| Diretivas e funções (`@apply`, `@reference`, `theme()`) | `functions-and-directives.md` |
| Preflight (reset CSS) | `preflight.md` |

## Instalação por framework

Pasta: `installation/`

| Framework | Arquivo |
|-----------|---------|
| Vite | `installation/using-vite.md` |
| PostCSS | `installation/using-postcss.md` |
| Tailwind CLI | `installation/tailwind-cli.md` |
| Play CDN | `installation/play-cdn.md` |
| TanStack Start | `installation/framework-tanstack-start.md` |
| Next.js | `installation/framework-nextjs.md` |
| Astro | `installation/framework-astro.md` |
| SvelteKit | `installation/framework-sveltekit.md` |
| Nuxt | `installation/framework-nuxtjs.md` |

## Utilities por categoria

| Categoria | Arquivos principais |
|-----------|---------------------|
| **Layout** | `display.md`, `position.md`, `overflow.md`, `z-index.md`, `visibility.md`, `aspect-ratio.md`, `columns.md`, `float.md`, `clear.md` |
| **Flexbox** | `flex.md`, `flex-direction.md`, `flex-wrap.md`, `flex-grow.md`, `flex-shrink.md`, `flex-basis.md`, `order.md` |
| **Grid** | `grid-template-columns.md`, `grid-column.md`, `grid-template-rows.md`, `grid-row.md`, `grid-auto-flow.md`, `grid-auto-columns.md`, `grid-auto-rows.md` |
| **Alinhamento** | `justify-content.md`, `justify-items.md`, `justify-self.md`, `align-content.md`, `align-items.md`, `align-self.md`, `place-content.md`, `place-items.md`, `place-self.md`, `gap.md` |
| **Espaçamento** | `padding.md`, `margin.md` |
| **Tamanho** | `width.md`, `height.md`, `min-width.md`, `max-width.md`, `min-height.md`, `max-height.md` |
| **Tipografia** | `font-size.md`, `font-weight.md`, `font-family.md`, `line-height.md`, `text-align.md`, `text-overflow.md`, `text-wrap.md`, `letter-spacing.md`, `color.md`, `text-shadow.md`, `line-clamp.md` |
| **Backgrounds** | `background-color.md`, `background-image.md`, `background-size.md`, `background-position.md`, `background-clip.md` |
| **Bordas** | `border-width.md`, `border-color.md`, `border-style.md`, `border-radius.md`, `outline-width.md`, `outline-color.md`, `outline-style.md` |
| **Efeitos** | `box-shadow.md`, `opacity.md`, `mix-blend-mode.md` |
| **Máscaras** | `mask-image.md`, `mask-size.md`, `mask-position.md`, `mask-composite.md` |
| **Filtros** | `filter.md`, `filter-blur.md`, `filter-brightness.md`, `filter-contrast.md`, `filter-drop-shadow.md`, `backdrop-filter.md`, `backdrop-filter-blur.md` |
| **Transições / Animações** | `transition-property.md`, `transition-duration.md`, `transition-timing-function.md`, `transition-delay.md`, `animation.md`, `transition-behavior.md` |
| **Transforms** | `transform.md`, `rotate.md`, `scale.md`, `translate.md`, `skew.md`, `transform-origin.md` |
| **Interatividade** | `cursor.md`, `pointer-events.md`, `user-select.md`, `resize.md`, `appearance.md`, `scroll-behavior.md`, `scroll-snap-type.md`, `scroll-snap-align.md`, `touch-action.md` |
| **SVG** | `fill.md`, `stroke.md`, `stroke-width.md` |
| **Acessibilidade** | `forced-color-adjust.md` |

> Se o arquivo não aparecer nesta tabela, tente `Glob 'HBROOT/ui/tailwind/*.md'` + `Grep` pelo termo — **não assuma** que não existe.

## Notas de versão importantes (v3 → v4)

O arquivo `upgrade-guide.md` cobre as breaking changes. Pontos críticos a verificar:
- `@theme` substitui `tailwind.config.js` para tokens
- `bg-opacity-*`, `text-opacity-*` etc. foram **removidas** (use modificadores `bg-black/50`)
- Escala de espaçamento padrão mudou
- `@utility` e `@variant` para customizações (v4 não usa `theme()` da mesma forma)
- Sem arquivo `tailwind.config.js` obrigatório em v4
