---
layout: post
title:  "TIL, 2022-08-31, Preloading and lifecycle hook for module loading"
date:   2022-08-31 16:24:53 +0800
categories: programming
summary: "Preloading and lifecycle hook for module loading"
---

# Preloading Strategies to Speed Up Angular App Loading Time
[Reference](https://blog.bitsrc.io/preloading-strategies-boost-up-angular-app-loading-time-ffb19da63155)

- Preloading modules: Loading modules async in the background.
- Preloading component data via Angular resolver.
- Available strategies:
  - Built-in preloading via no preloading, or `PreloadAllModules`.
  - Custom preloading strategies: preload after some time, preload based on network quality, load required modules first, frequently used second, and others lazy load/last.
- Commands to see:
  - `return of(null)` - don't preload.
  - `return fn()` - preload.

```
import {Injectable} from '@angular/core';
import {PreloadingStrategy, Route} from '@angular/router';
import {Observable, of} from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class CustomPreloadingStrategyService implements PreloadingStrategy {
preload(route: Route, fn: () => Observable<any>): Observable<any> {
    if (route.data && route.data.preload) {
      return fn();
    }
    return of(null);
  }
}
```

- We can do `canActivate` and `canLoad` router guard.

# Angular 2 - Lifecycle hooks for lazy loaded modules
[Reference](https://stackoverflow.com/questions/47094998/angular-2-lifecycle-hooks-for-lazy-loaded-modules)

- Constructor should do this.

```
@NgModule({...})
export class MyLazyModule {
  constructor(/* service injection here if required */) {
    console.log('lazy module loaded');
  }
}
```
