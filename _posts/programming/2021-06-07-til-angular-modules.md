---
layout: post
title:  "TIL, 2021-06-07"
date:   2021-06-07 12:48:15 +0800
categories: programming
summary: "Angular - Modules and Services"
---

# Angular: Understanding Modules and Services
[Reference](https://michelestieven.medium.com/organizing-angular-applications-f0510761d65a)

- Feature Modules:
  - Must declare all the components, directives, and pipes it needs.
  - *Every module which is not the `AppModule` is technically a Feature Module, and it has to declare all the components, directives, and pipes that it needs.*
  - It is not enough to declare a component once in the declarations array of `AppModule` - in order to use a component in a module, it MUST be declared in that specific module.
  - `BrowserModule` must be imported in `AppModule` (it's required in order to run the app in the browser), this module must not be imported elsewhere: we must import `CommonModule`.
  - Feature Modules define all of the views, as each view will have its own module. Also, each "view module" can be lazy loaded by the route via `loadChildren`.
  - `preloadingStrategy` - Check out `preloadingStrategy: PreloadAllModules`.
- `CoreModule`
  - Global services should be `AppModule.`
  - Every laze module has its own injector. A service provided in a lazy module is only accessible in that module. But it can still access the services provided by non-lazy modules.
- Shared modules
  - `exports` makes components, directives, pipes, and even other modules available to the importing modules!
