---
layout: post
title:  "TIL, 2022-06-17, Angular micro-frontend"
date:   2022-06-17 08:00:50 +0800
categories: programming
summary: "Angular micro-frontend"
---

# What to Expect from Angular 14 in 2022: Is Micro Frontend Coming?
[Reference](https://itnext.io/what-to-expect-from-angular-14-in-2022-is-micro-frontend-coming-7932566f773)

- Better typing re: `@angular/forms`.
- Independent components from module:
  - Module is not necessarily the smallest unit of re-use, which means you can't use directives, pipes, and components individually, outside the concept of the module.
  - So, components must always be dependent on Modules and be part of the module, and it can't be standalone.
  - `bootstrapModule()`.
  - Angular tooling is tightly dependent on Modules during optimising the build performance.
- Micro front-end, why it is cool, and why Angular is perfect for it.
  - Module federation - lets you have multiple separated builds in a single application.

# How Micro Frontend changes the Future of Angular?
[Reference](https://itnext.io/how-micro-frontend-changes-the-future-of-angular-bb4deb2cfdad)

- Individual components or pages are hosted in separated domains and integrated in the main shell app.
- Micro-frontend as a page - we dedicate a separate page per each of the micro-app.
- Way to share data between micro-frontends:
  -  Make sure the app doesn't have data store state.
  - `localStorage`, `sessionStorage`, cookies, indexed DB, or router query params.
- Why Angular?
  - workspace
  - Project - micro-app per client.
  - Libraries - Good for sharing the reusable data between projects.

# UNDERSTANDING THE INTRICACIES OF ANGULAR’S ASYNC PIPE
[Reference](https://www.lucidchart.com/techblog/2019/10/14/angulars-async-pipe-intricacies/)

- Use case - show the dropdown only if the document already has a status.
- In JS, the `Promise` is the fundamental building block of asynchronous code. `Promise` has `then` and `catch`. These two methods take callbacks as parameters. If they resolve successfully, any callbacks passed to `.then` are run, and if the `Promise` is rejected, callbacks passed to `.catch` are executed.
  - Code in a `.then` is guaranteed to be asynchronous.
  - ***How do I get the value of a completed `Promise` asynchronously? You can't.***

```
<lucid-drop-down
    *ngIf="hasStatus()" <- This depends on definitionsPromise, so if definitionsPromise resolves, then hasStatus() should resolve, right?
    [options]="definitionsPromise | async"
></lucid-drop-down>
```

- Because of the way `Promise` works, Angular's `async` pipe has to be impure. When the `Promise` resolves and the callback is called, the `async` pipe stores the value retrieved from the `Promise` and marks itself for check. Then, when change detection occurs again, the `transform` method will be called with the same `Promise` and the pipe returns the value that it got out of that `Promise`.

- The code has to be written like this - `ngIf` twice.
```
<ng-container *ngIf="definitionsPromise | async as options">
    <lucid-drop-down
        *ngIf="hasStatus()"
        [options]="options"
    ></lucid-drop-down>
</ng-container>
```

- The key here is the `async` pipe` isn't hidden behind an `ngIf`. The async pipe is created as soon as the containing component is created, and the null that comes out of the async pipe is handled naturally by the `ngIf` in the `ng-container`.
