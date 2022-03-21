---
layout: post
title:  "TIL, 2022-03-21, async or subscribe in Angular"
date:   2022-03-21 08:19:12 +0800
categories: programming
summary: "async or subscribe in Angular"
---

# The Ultimate Answer To The Very Common Angular Question: subscribe() vs | async Pipe
[Reference](https://medium.com/angular-in-depth/angular-question-rxjs-subscribe-vs-async-pipe-in-component-templates-c956c8c0c794)

- Application state is usually expressed in the form of a stream of state objects.
- 2 ways to consume the observable steam:
  - `subscribe()` - `todos$.subscribe(todos => this.todos = todos)`
  - `| async` pipe to unwrap the object in the template. `<li *ngFor=”let todo of todos$ | async”></li>`

## `subscribe`

- Advantage of `subscribe()`
  - Unwrapped property can be used in multiple places in the template "as is".
  - Unwrapped property is available everywhere in the component.
- Disadvantage of `subscribe()`
  - Then, need to unsubscribe/prone to memory leaks. Solution is to do `takeUntil` which is memory leak.
  - Subscribing to the observable manually doesn't work with change detection (`cdRef.markForCheck()` is now needed).

## `async` pipe

- Advantage
  - Works with `OnPush`.
  - Angular handles `| async` so no need to unsubscribe manually.
- Disadvantage:
  - Objects have to be unwrapped using `*ngIf=something$ | async as something` syntax.
  - Objects have to be unwrapped multiple times in a single template.
  - Properties unwrapped using `*ngIf` are not accessible in the component's methods.

## Comments

- IMHO the problem with using `.subscribe` is that it allows you to save state in the component, and as we all know the “State is Evil”.
- State goes hand in hand with imperative code & mutation whereas the whole Functional Reactive Programming paradigm that Redux & Observables teach us is to go with stateless dumb components, embrace immutability and the Single Source of Truth, the Store.
- Error state: Model errors as part of your domain so errors are turned into values so that the UI always receives correct state.

# Destroyable decorator
[Reference](https://gist.github.com/masimplo/01b8f9206b795ba5cf10115c3a362702)

```
import { Observable } from 'rxjs/Observable';

export function Destroyable() {
  return (target) => {

    const originalOnDestroy: Function = target.prototype.ngOnDestroy;
    // tslint:disable-next-line:only-arrow-functions
    target.prototype.ngOnDestroy = function() {
      if (!('_componentDestroyed$' in this || !(this._componentDestroyed$ instanceof Observable))) {
        throw new Error('Destroyable components must define _componentDestroyed$ property');
      }
      if (this._componentDestroyed$) {
        this._componentDestroyed$.next();
        this._componentDestroyed$.complete();
      }
      this._componentDestroyed$ = null;
      if (originalOnDestroy)
        originalOnDestroy.apply(this, arguments);
    };
  };
}
```

# `ngrxPush` pipe
[Reference](https://ngrx.io/guide/component/push)
