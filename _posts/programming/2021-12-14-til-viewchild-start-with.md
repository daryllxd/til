---
layout: post
title:  "TIL, 2021-12-14, ViewChild, `startWith`"
date:   2021-12-14 08:57:30 +0800
categories: programming
summary: "`ViewChild`, `startWith`"
---

- `@ViewChild` `static: true` or `static: false` [Reference](https://stackoverflow.com/questions/56359504/how-should-i-use-the-new-static-option-for-viewchild-in-angular-8)
  - `static: false` will ensure that query matches that are dependent on binding resolution like structural directives `*ngIf` will be found.
  - `static: false` is the default fallback behaviour in Angular 9.
  - `static: true` is to support creating embedded views on the fly. When you are creating a view dynamically and you want to access the `TemplateRef`, you won't be able to do so in `ngAfterViewInit` as it will cause a `ExpressionHasChangedAfterChecked` error.
  - Use case for `static: true` is if you are using `fromEvent` to bind to an element defined in the template.

```
@Component({})
export class ThumbComponent {
  @ViewChild('thumb', { static: true })
  thumb?: ElementRef<HTMLElement>;

  readonly thumbStyle$ = defer(() => fromEvent(this.thumb, 'pointerdown').pipe(
    switchMap((startEvent) => fromEvent(document, 'pointermove', { passive: true })
    // transform to proper positioning
  ));
}
```

  - { static: true } needs to be set when you want to access the `ViewChild` in `ngOnInit`.
  - { static: false } can only be accessed in `ngAfterViewInit`. This is also what you want to go for when you have a structural directive (i.e. `*ngIf`) on your element in your template.
  - static - whether or not to resolve query results before change detection runs (i.e. return static results only). If this option is not provided, the compiler will fall back to its default behavior, which is to use query results to determine the timing of query resolution. If any query results are inside a nested view (e.g. `*ngIf`), the query will be resolved after change detection runs. Otherwise, it will be resolved before change detection runs.
- `RxJS` Operator Tips - `startWith`
  - Solves: How can I subscribe to a Refresh Event that updates the list even when the seed doesn't change?
- For the Angular router events Observable, why is there no unsubscribe()? [Reference](https://stackoverflow.com/questions/48332797/for-the-angular-router-events-observable-why-is-there-no-unsubscribe)
  - `ActivatedRoute` observables clean up, but not `router` events.
  - Router or HTTP - no need to unsubscribe.
  - Single emission (finite) - use first(); no need to unsubscribe.
  - Infinite emissions - unsubscribe in `ngOnDestroy()`.
- Using several shared modules in Angular [Reference](https://stackoverflow.com/questions/46749027/using-several-shared-modules-in-angular)
- Do unused components in shared modules slows down my application? [Reference](https://stackoverflow.com/questions/45024406/do-unused-components-in-shared-modules-slows-down-my-application)
  - Simply declaring your components there won't meaningfully affect performance, it just makes Angular aware of their existence, so they can be matched to your component selectors.
  - Components you declare on your modules are going to be bundled in your output JS (they won't be removed by tree-shaking).
