# sources.md — mapa do espelho Playwright

Base: `REFERENCE_ROOT/testing/playwright/`
Versão espelhada: **Playwright latest main** (SHA `1845d3f`, captura 2026-05-27, release mais recente: v1.60)

## Metadado de origem

`_SOURCE.md` — versão, repo, SHA e data do espelho.

## Guias JS/TS (foco ACDG)

| Tópico | Arquivo |
|--------|---------|
| Introdução | `intro-js.md` |
| Escrevendo testes | `writing-tests-js.md` |
| Rodando testes | `running-tests-js.md` |
| Locators | `locators.md`, `other-locators.md` |
| Assertions | `test-assertions-js.md` |
| Fixtures | `test-fixtures-js.md` |
| Configuração | `test-configuration-js.md`, `test-use-options-js.md` |
| Projetos (multi-browser) | `test-projects-js.md` |
| Paralelismo | `test-parallel-js.md` |
| Sharding | `test-sharding-js.md` |
| Retries | `test-retries-js.md` |
| Anotações | `test-annotations-js.md` |
| Parameterize | `test-parameterize-js.md` |
| Global setup/teardown | `test-global-setup-teardown-js.md` |
| Reporters | `test-reporters-js.md` |
| TypeScript | `test-typescript-js.md` |
| Snapshots visuais | `test-snapshots-js.md` |
| UI mode | `test-ui-mode-js.md` |
| Webserver | `test-webserver-js.md` |
| Componentes | `test-components-js.md` |
| Tags | implícito em `test-annotations-js.md` |
| CLI | `test-cli-js.md` |
| Timeouts | `test-timeouts-js.md` |

## Guias gerais (cross-linguagem)

| Tópico | Arquivo |
|--------|---------|
| Network / interceptação | `network.md` |
| Mock de rede | `mock.md` |
| Auth | `auth.md` |
| Browser contexts | `browser-contexts.md` |
| Browsers suportados | `browsers.md` |
| Trace viewer | `trace-viewer-intro-js.md`, `trace-viewer.md` |
| Screenshots | `screenshots.md` |
| Aria snapshots | `aria-snapshots.md` |
| Acessibilidade | `accessibility-testing-js.md` |
| Debugging | `debug.md` |
| CI | `ci.md`, `ci-intro.md` |
| Docker | `docker.md` |
| Codegen | `codegen-intro.md`, `codegen.md` |
| Frames | `frames.md` |
| Dialogs | `dialogs.md` |
| Downloads | `downloads.md` |
| Events | `events.md` |
| Evaluating (page.evaluate) | `evaluating.md` |
| Handles | `handles.md` |
| Input | `input.md` |
| Navigations | `navigations.md` |
| Pages | `pages.md` |
| Clock | `clock.md` |
| Videos | `videos.md` |
| Service workers | `service-workers-js-python.md` |
| Mock browser APIs | `mock-browser-js.md` |
| Melhores práticas | `best-practices-js.md` |
| POM (Page Object Model) | `pom.md` |
| Actionability | `actionability.md` |
| Release notes (JS) | `release-notes-js.md` |

## API Classes (`api/`)

Arquivos no padrão `api/class-<nome>.md`. Exemplos-chave:

| Classe | Arquivo |
|--------|---------|
| Page | `api/class-page.md` |
| Locator | `api/class-locator.md` |
| BrowserContext | `api/class-browsercontext.md` |
| Browser | `api/class-browser.md` |
| Route | `api/class-route.md` |
| Request / Response | `api/class-request.md`, `api/class-response.md` |
| APIRequest / APIRequestContext | `api/class-apirequest.md`, `api/class-apirequestcontext.md` |
| Tracing | `api/class-tracing.md` |
| Frame | `api/class-frame.md` |
| LocatorAssertions | `api/class-locatorassertions.md` |
| PageAssertions | `api/class-pageassertions.md` |
| APIResponseAssertions | `api/class-apiresponseassertions.md` |
| GenericAssertions | `api/class-genericassertions.md` |
| WebSocketRoute | `api/class-websocketroute.md` |

Lista completa: `Glob 'api/class-*.md'`.

## Test API Classes (`test-api/`)

`test-api/class-test.md`, `test-api/class-fixtures.md`, `test-api/class-testconfig.md`,
`test-api/class-testinfo.md`, `test-api/class-testproject.md`, etc.

## Reporter API (`test-reporter-api/`)

`test-reporter-api/class-reporter.md`, `class-suite.md`, `class-testcase.md`, etc.

> Se algum arquivo não existir, confirme via `Glob '*.md'` ou `Glob 'api/*.md'` — **não** assuma.
