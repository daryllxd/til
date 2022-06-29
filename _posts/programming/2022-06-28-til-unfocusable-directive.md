---
layout: post
title:  "TIL, 2022-06-28, `UnfocusableDirective`"
date:   2022-06-28 12:49:20 +0800
categories: programming
summary: "Can a Directive Access HostComponent"
---

- `switchMap` to do 2 effects

[Reference](https://vdsabev.medium.com/the-simple-difference-between-rxjs-switchmap-and-mergemap-397c311552a5)
[Reference](https://github.com/timdeschryver/eslint-plugin-ngrx/blob/main/docs/rules/no-multiple-actions-in-effects.md)
[Reference](https://stackoverflow.com/questions/41701138/dispatch-multiple-actions-in-one-effect/41758523#41758523)
[Reference](https://medium.com/@amcdnl/dispatching-multiple-actions-from-ngrx-effects-c1447ceb6b22)



- HTMLAnchorElement represents `<a>`. Not to be confused with HTMLLinkElement which is `<link>`. (There is also an HTMLButtonElement.)
- Accessing Host component from a directive [Reference](https://stackoverflow.com/questions/46014761/how-to-access-host-component-from-directive)
  - Host + Self + Optional.

```
import { Host, Self, Optional } from '@angular/core';

export class ExampleDirective {
  constructor(
    @Host() @Self() @Optional() public hostCheckboxComponent : MdlCheckboxComponent,
    @Host() @Self() @Optional() public hostSliderComponent   : MdlSliderComponent
  ) {
    if(this.hostCheckboxComponent) {
      console.log("host is a checkbox");
    } else if(this.hostSliderComponent) {
      console.log("host is a slider");
    }
}
```

  -  Using `vcRef` to access private properties.

```
class MyDirective {
  constructor(private vcRef: ViewContainerRef) {}

  private getHostElementFromViewContainerRef(): unknown | null {
    // TL;DR of the below method:
    // return this.vcRef._lContainer[0][8];
    // Inspired by https://stackoverflow.com/questions/46014761/how-to-access-host-component-from-directive#comment119646192_48563965

    const vcRef = this.vcRef as any; // We're accessing private properties so we cast to any to avoid awkward TS validation issues

    // We fetch the component associated with the element this directive is attached to by navigating via the ViewContainerRef.
    // The VCRef contains a reference to the LContainer, which represents the state associated with the container:
    // https://github.com/angular/angular/blob/12.2.x/packages/core/src/render3/interfaces/container.ts#L65
    const lContainer = vcRef._lContainer;

    if (!lContainer) {
      return null;
    }

    // LView has all its elements defined as array elements, with keys hardcoded to numeric constants:
    // https://github.com/angular/angular/blob/12.2.x/packages/core/src/render3/interfaces/view.ts#L26-L57
    // We care about two of them:
    const HOST = 0; // https://github.com/angular/angular/blob/12.2.x/packages/core/src/render3/interfaces/view.ts#L29
    const CONTEXT = 8; // https://github.com/angular/angular/blob/12.2.x/packages/core/src/render3/interfaces/view.ts#L37

    // LContainer is an array, with the element at the HOST position being an LView if the container is on a Component Node.
    // This means that this may not work if this directive is declared on a native HTML element.
    // Note that LContainer uses the same indexes as LView, so it's the same HOST constant as declared in the LView interfaces file.
    // https://github.com/angular/angular/blob/12.2.x/packages/core/src/render3/interfaces/container.ts#L66-L72

    const lView = lContainer[HOST];
    if (!lView) {
      return null;
    }

    // For a non-root component, the context is the component instance.
    // So if this directive is correctly attached to an Angular Component (e.g. `<app-*`),
    // this array entry will contain the instance of that component.
    // https://github.com/angular/angular/blob/12.2.x/packages/core/src/render3/interfaces/view.ts#L173-L180
    const contextElement = lView[CONTEXT];

    return contextElement || null;
  }
}
```

[Reference](https://javascript.plainenglish.io/angular-what-is-forwardref-and-how-does-it-work-54f567e37636)
