---
layout: post
title:  "TIL, 2021-10-04, Load Time Optimisation"
date:   2021-10-04 17:56:10 +0800
categories: programming
summary: "Angular Load Time Optimisation"
---

# The Ten Commandments Of Angular Development
[Reference](https://christianlydemann.com/the-ten-commandments-of-angular-development/)

- What has worked on the back-end will also work on the front-end.
- Smart vs dumb components
  - Smart component containing all the dumb components.
  - Smart components that delegate using services and dumb components.
  - Dumb components are always `onPush` change detection.
  - Dumb components don't inject service.
  - Dumb components only use `Input/Output` for interaction with other components.
  - Don't inject services in dumb components. Don't do presentation logic in smart components.
- Decouple code from vendor libraries so you can change implementation without needing to update all the usages.
  - This is why you can hopefully change state management frameworks, HTTP communication and logging frameworks.
  - Do encapsulate trivial UI components through adapter UI components
  - Don't reference `NgRx` state management framework directly in components, refer them through a service/facade.
  - Don't do HTTP requests directly from components, instead us abstraction/service.
- Testing
  - Unit/integration test: Services - unit test with 100% code coverage.
  - Pure functions/pipes - unit test with 100% code coverage.
  - Smart components - integration tests for "happy paths".
- E2E specs
  - Cover the top 5 use cases.
  - Make sure they are retrying commands so they don't randomly break because of timing problems. Cypress?
- Reactive architecture
  - Separate read from write - All reads should come from an observable stream + `async` pipe.
  - If possible, do observable translations and don't do `instant` translations with `ngx-translate`.
  - Try not to have `tap` - need it to open modal etc., but never use it to map state to a variable, as that will break the reactive architecture.
- UI and layouting library - don't do it all by yourself.
- Code style/formatting rules: Nitpicks can be standardised, or even better, automated.
- PRs:
   - Provide clear description. Don't write nothing/just the commit messages.
   - Call in for pair review/programming if the PR has over 20 comments.
- Run-time performance
  - `ChangeDetectionStrategy.OnPush` by default.
  - Avoid method binding in template - use observable + async, pure pipes, pass down to dumb component/directive, map to a state property.

# Typescript Do's and Don'ts
[Reference](https://www.typescriptlang.org/docs/handbook/declaration-files/do-s-and-don-ts.html)

- Don't use `Number`, `String`, etc. Use the lower case.
- No `any`.
- Return type of callback - no `any`. Set `void` as default.
- Non-optional parameter in callback.
- Don't write separate overloads for a callback with a different arity.
- Don't put more general overloads before specific overloads.

# The Complete Guide To Angular Load Time Optimization
[Reference](https://christianlydemann.com/the-complete-guide-to-angular-load-time-optimization/)

- Use Webpack bundle analyzer.
  - Runtime bundle: Webpack loader.
  - Polyfills.
  - Main - Vendor and source code that is not lazy-loaded.
  - Common chunk - lazily loaded modules that are loaded in the background after the load of the main bundle.
- Angular CLI can be configured to create a separate bundle for vendor. For the most part, it's the most performant to have these together in one main bundle.
- Split code above the fold for the main bundle, and below the fold for the lazily-loaded bundles?
- NEVER import the `SharedModule`, and always use the `main-shared` module instead. That will make sure the shared source code goes to the common bundle instead of going to the main bundle and slowing down the load time for all routes.
- Component-level lazy loading:
  - `ngx-loadable`
  - `hero-loader`.
- Flash of invisible text:
  - `font-display: swap`.
  - Preload fonts.
- ES6 imports - these import in a tree-shakeable way.
- Measure with Audit/Lighthouse
  - First contentful paint, first meaning paint, and time to interactive.
- Subsequent request with service worker caching. [Reference](https://christianlydemann.com/how-to-create-a-progressive-web-app-pwa-with-angular/) [Reference](https://christianlydemann.com/how-to-cache-http-requests-in-an-angular-pwa/)
- Hosting
  - Cloud provider with easy scaling hosting with at least 2 replicas of the application and a load balancer in front.
  - Compression - `Brotli` over `gzip`.

Checklist:

- Did you make sure to NOT lazy load the initial route (/)?
- Did you make sure to lazy load all routes except initial route?
- Did you make sure to lazy load everything under the fold on the initial route and pages which are having load performance problems?
- Did you look in Webpack bundle analyzer for any lib not needed in the initial over-the-fold load and lazy-loaded everything else?
- Did you preloaded fonts or use font-display: swap to avoid blank text?
- Are you using Angular PWA to cache static resources?
- Did I only import the shared module in lazy loaded modules?
- Are you using solid and fast hosting and CDN including compression (Brotli if possible)?
- Do you have a green score in Audit/Lighthouse? (if not, do another iteration from step 1)
