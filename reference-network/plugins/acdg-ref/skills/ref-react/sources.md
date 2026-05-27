# sources.md — mapa do espelho React

Base: `REFROOT/ui/react/`
onde `REFROOT = /Users/gabriel_aderaldo/Desktop/Projetos/dev/envolve/roraima/conecta-raros-edge/infra/reference`

**Versão**: React 19 · SHA do espelho: `6ec61348` · data: 2026-05-27 · ~223 arquivos .md

---

## Reference — React package (`reference/react/`)

| Tópico | Arquivo(s) |
|--------|-----------|
| Índice de APIs | `reference/react/apis.md`, `reference/react/components.md` |
| Hooks de estado | `reference/react/useState.md`, `reference/react/useReducer.md` |
| Hooks de efeito | `reference/react/useEffect.md`, `reference/react/useLayoutEffect.md`, `reference/react/useInsertionEffect.md` |
| Hooks de performance | `reference/react/useMemo.md`, `reference/react/useCallback.md`, `reference/react/useRef.md` |
| Hooks de contexto | `reference/react/useContext.md`, `reference/react/createContext.md` |
| Hooks de transição / concorrência | `reference/react/useTransition.md`, `reference/react/startTransition.md`, `reference/react/useDeferredValue.md` |
| Hooks React 19 | `reference/react/use.md`, `reference/react/useOptimistic.md`, `reference/react/useActionState.md` |
| Cache (React 19) | `reference/react/cache.md`, `reference/react/cacheSignal.md` |
| Utilitários de diagnóstico | `reference/react/useDebugValue.md`, `reference/react/useImperativeHandle.md`, `reference/react/useId.md`, `reference/react/useSyncExternalStore.md` |
| Componentes | `reference/react/Suspense.md`, `reference/react/StrictMode.md`, `reference/react/Fragment.md`, `reference/react/Profiler.md`, `reference/react/ViewTransition.md` |
| Legados / miscelânea | `reference/react/PureComponent.md`, `reference/react/Component.md`, `reference/react/Children.md`, `reference/react/cloneElement.md`, `reference/react/createElement.md`, `reference/react/createRef.md`, `reference/react/Activity.md` |
| Efetivação (experimental) | `reference/react/useEffectEvent.md`, `reference/react/addTransitionType.md`, `reference/react/captureOwnerStack.md` |
| Testing | `reference/react/act.md` |

---

## Reference — React DOM (`reference/react-dom/`)

| Tópico | Arquivo(s) |
|--------|-----------|
| Índice | `reference/react-dom/index.md` |
| Cliente: createRoot / hydrateRoot | `reference/react-dom/client/createRoot.md`, `reference/react-dom/client/hydrateRoot.md` |
| Hooks DOM | `reference/react-dom/hooks/useFormStatus.md` |
| Componentes DOM | `reference/react-dom/components/` |
| Portais | `reference/react-dom/createPortal.md` |
| flushSync | `reference/react-dom/flushSync.md` |
| Preload APIs | `reference/react-dom/preconnect.md`, `reference/react-dom/prefetchDNS.md`, `reference/react-dom/preinit.md`, `reference/react-dom/preinitModule.md` |

---

## Reference — Rules (`reference/rules/`)

| Tópico | Arquivo(s) |
|--------|-----------|
| Regras de hooks | `reference/rules/` — rules-of-hooks, componentes puros |

---

## Reference — RSC / Compiler (`reference/rsc/`, `reference/react-compiler/`)

| Tópico | Arquivo(s) |
|--------|-----------|
| React Server Components | `reference/rsc/` |
| React Compiler | `reference/react-compiler/` |
| ESLint plugin hooks | `reference/eslint-plugin-react-hooks/` |

---

## Learn (`learn/`)

| Tópico | Arquivo(s) principais |
|--------|----------------------|
| Thinking in React | `learn/thinking-in-react.md` |
| Estado / gerenciamento | `learn/managing-state.md`, `learn/choosing-the-state-structure.md`, `learn/sharing-state-between-components.md` |
| Efeitos | `learn/synchronizing-with-effects.md`, `learn/you-might-not-need-an-effect.md`, `learn/lifecycle-of-reactive-effects.md`, `learn/separating-events-from-effects.md` |
| Reducers e contexto | `learn/extracting-state-logic-into-a-reducer.md`, `learn/passing-data-deeply-with-context.md`, `learn/scaling-up-with-reducer-and-context.md` |
| Refs / DOM | `learn/manipulating-the-dom-with-refs.md` |
| Custom hooks | `learn/reusing-logic-with-custom-hooks.md` |
| TypeScript | `learn/typescript.md` |
| Tutorial | `learn/tutorial-tic-tac-toe.md` |

---

## Erros e Warnings

- `errors/index.md`, `errors/generic.md`, `errors/377.md` — erros documentados.
- `warnings/` — avisos de console documentados.

---

## Blog

- `blog/` — posts oficiais React, incluindo anúncios de novidades do React 19.

> Se algum arquivo não existir no espelho, confirme via `Glob 'ui/react/**/*.md'` +
> `Grep` — **não** assuma.
