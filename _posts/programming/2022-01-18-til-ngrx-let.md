---
layout: post
title:  "TIL, 2022-01-18 - NgRx Let"
date:   2022-01-18 00:33:56 +0800
categories: programming
summary: "NgRx Let"
---

- [Reference](https://stackoverflow.com/questions/49127332/nullinjectorerror-no-provider-for-reducermanager) - This is just cause there wasn't NgRx.
 - `StoreModule.forRoot` should only be called once in the root of your project `NgModule`. If you want to register a feature, use `StoreModule.forFeature`. Using `forRoot` registers the global providers needed for Store.
- `@ngrx/store` and `@ngrx/effects` are what you install, not `ngrx`.
- [Reference](https://ngrx.io/guide/component) - `*ngrxLet` directive.
  - Binding is always present. (`*ngIf="truthy$"`)
  - Takes away the multiple usages of the async or `ngrxPush` pipe
  - Provides a unified/structured way of handling null and undefined
  - Triggers change-detection differently if zone.js is present or not (`ChangeDetectorRef.detectChanges` or `ChangeDetectorRef.markForCheck`)
  - Triggers change-detection differently if `ViewEngine` or Ivy is present.
  - Distinct same values in a row (`distinctUntilChanged` operator),
