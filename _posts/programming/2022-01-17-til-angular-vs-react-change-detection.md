---
layout: post
title:  "TIL, 2022-01-17, `@Input` Inpout"
date:   2022-01-17 08:34:51 +0800
categories: programming
summary: "Angular vs React Change Detection, Intercept @Input"
---

# Angular 5.0 change detection strategy VS React's change detection strategy
[Reference](https://stackoverflow.com/questions/47386408/angular-5-0-change-detection-strategy-vs-reacts-change-detection-strategy)

-Angular
  - Change detection is triggered by Zone.js at the end of each call stack in the zone. After callback to every async action, CD is triggered.
  - CD starts from the root component and goes down through the components tree.
  - `ChangeDetectionStrategy.onPush` to omit components and descendants during tree traversal.
- React
  - CD is triggered after callbacks of async actions.
  - CD starts from the component where `setState` was called.
  - Reconcile phase to traverse for checking which values need to be updated in real DOM.

# Intercept @Input property change in Angular
[Reference](https://medium.com/@bharat.tiwari/intercept-input-property-change-in-angular-690567eb63ec)

- `Typescript` accessors via `get` and `set`.
- `ngOnChanges`.
- `ngOnChanges` is more "in-built".

```
class MyComponent implements OnChanges {
  @Input() name: string;
  @Input() email: string;

  private username$ = new Subject<string>();

  ngOnChanges({ name, email }: SimpleChanges) { // ngOnChanges syntax
    const username = name.currentValue || email.currentValue;
    this.username$.next(username);
  }
}
```
- [Reference](https://stackoverflow.com/questions/40577929/angular-2-setters-vs-ngonchanges) - `ngOnChanges` gets you all the changes at once if your component has several `@Input()`.
- [Reference](https://javascript.plainenglish.io/dumb-angular-input-setter-getter-vs-ngonchanges-f30e61937926)
