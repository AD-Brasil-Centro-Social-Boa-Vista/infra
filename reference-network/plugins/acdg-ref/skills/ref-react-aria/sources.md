# sources.md — mapa do espelho React Aria Components

Base: `REFROOT/ui/react-aria-components/`
onde `REFROOT = /Users/gabriel_aderaldo/Desktop/Projetos/dev/envolve/roraima/conecta-raros-edge/infra/reference`

**Versão**: RAC 1.17+ · SHA do espelho: `8e4498fa` · data: 2026-05-27 · ~224 arquivos .md/.mdx

---

## Componentes (`components/`) — ~51 componentes .mdx

| Componente | Arquivo |
|-----------|---------|
| Autocomplete | `components/Autocomplete.mdx` |
| Breadcrumbs | `components/Breadcrumbs.mdx` |
| Button | `components/Button.mdx` |
| Calendar / RangeCalendar | `components/Calendar.mdx`, `components/RangeCalendar.mdx` |
| Checkbox / CheckboxGroup | `components/Checkbox.mdx`, `components/CheckboxGroup.mdx` |
| Color (Area, Field, Picker, Slider, Swatch, SwatchPicker, Wheel) | `components/ColorArea.mdx`, `components/ColorField.mdx`, `components/ColorPicker.mdx`, `components/ColorSlider.mdx`, `components/ColorSwatch.mdx`, `components/ColorSwatchPicker.mdx`, `components/ColorWheel.mdx` |
| ComboBox | `components/ComboBox.mdx` |
| Date (DateField, DatePicker, DateRangePicker, TimeField) | `components/DateField.mdx`, `components/DatePicker.mdx`, `components/DateRangePicker.mdx`, `components/TimeField.mdx` |
| Dialog | `components/Dialog.mdx` |
| Disclosure / DisclosureGroup | `components/Disclosure.mdx`, `components/DisclosureGroup.mdx` |
| DropZone | `components/DropZone.mdx` |
| FileTrigger | `components/FileTrigger.mdx` |
| Form | `components/Form.mdx` |
| GridList | `components/GridList.mdx` |
| Group | `components/Group.mdx` |
| Link | `components/Link.mdx` |
| ListBox | `components/ListBox.mdx` |
| Menu | `components/Menu.mdx` |
| Meter | `components/Meter.mdx` |
| Modal | `components/Modal.mdx` |
| NumberField | `components/NumberField.mdx` |
| Popover | `components/Popover.mdx` |
| ProgressBar | `components/ProgressBar.mdx` |
| RadioGroup | `components/RadioGroup.mdx` |
| SearchField | `components/SearchField.mdx` |
| Select | `components/Select.mdx` |
| Slider | `components/Slider.mdx` |
| Switch | `components/Switch.mdx` |
| Table | `components/Table.mdx` |
| Tabs | `components/Tabs.mdx` |
| TagGroup | `components/TagGroup.mdx` |
| TextField | `components/TextField.mdx` |
| Toast | `components/Toast.mdx` |
| ToggleButton / ToggleButtonGroup | `components/ToggleButton.mdx`, `components/ToggleButtonGroup.mdx` |
| Toolbar | `components/Toolbar.mdx` |
| Tooltip | `components/Tooltip.mdx` |
| Tree | `components/Tree.mdx` |
| Virtualizer | `components/Virtualizer.mdx` |
| Padrões avançados / styling | `components/advanced.mdx`, `components/styling.mdx` |
| Visão geral RAC | `components/react-aria-components.mdx` |

---

## Guias (`guides/`) — padrões transversais

| Tópico | Arquivo |
|--------|---------|
| Getting started | `guides/getting-started.mdx` |
| Por que RAC? | `guides/why.mdx` |
| Acessibilidade (ARIA, keyboard, focus) | `guides/accessibility.mdx` |
| Collections (listas, trees, grids) | `guides/collections.mdx` |
| Selection (single, multiple) | `guides/selection.mdx` |
| Forms (validação, integração) | `guides/forms.mdx` |
| Routing (Link com router, navigate) | `guides/routing.mdx` |
| SSR | `guides/ssr.mdx` |
| Testing | `guides/testing.mdx` |
| Hooks avulsos | `guides/hooks.mdx` |
| Componentes genéricos | `guides/components.mdx` |

---

## Spectrum 2 (`s2-docs/`) — design system Adobe

`s2-docs/` contém versões S2 dos mesmos componentes acima (com variantes visuais
do design system). Quando a pergunta fixar S2, prefira esses arquivos; para RAC
genérico/headless, use `components/`.

---

## Índice rápido (`llms.txt`)

`llms.txt` — 114 linhas, machine-readable. Use como ponto de entrada para
localizar rapidamente qual arquivo cobre um componente/tópico específico antes
de fazer `Glob`/`Grep` mais amplos.

> Se algum arquivo não existir no espelho, confirme via
> `Glob 'ui/react-aria-components/**/*.mdx'` + `Grep` — **não** assuma.
