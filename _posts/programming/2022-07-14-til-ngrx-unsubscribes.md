---
layout: post
title:  "TIL, 2022-07-14, NGRX Unsubscribes"
date:   2022-07-14 20:23:41 +0800
categories: programming
summary: "Where I..."
---

# NGRX Common Gotcha’s
[Reference](https://medium.com/@stodge/ngrx-common-gotchas-8f59f541e47c)

- Subscribing to a selector inside the component - needs to be unsubscribed if it isn't in a pipe.
- Can do `takeUntil` or `take(1)` or `UntilDestroy`.

```
ngOnInit() {
  this.store.select(selectors.selectCustomer)
    .subscribe((customer) = > {
      this.customerIsCool = customer.supports === 'Southend'; <- Leak
  });
});
```

- Feature selectors - Memoized selector and `createFeatureSelector`?
- Flattening operators: `switchMap` cancels previous prior observables. `mergeMap` and `concatMap` need to be used if you need to process the result of each API call.
- Avoid unnecessary API calls:

```
@Effect() loadSomeData$ Observable;
constructor(private actions$: Actions, private store$: Store) {
this.loadSomeData$: Observable = this.actions$
  .ofType(actions.LOAD_DATA)
  .withLatestFrom(this.store$)
  .switchMap(([action, state]) => {
    const currentState = selectors.selectSomeState(state);
    const loading = selectors.selectLoading(state);
    if (currentState || loading) {
      // We either already have the state in the store,
      // or are already loading, so there is no need to
      // kick off another API call
      return empty();
     }
      return doApiCall()
         .map((response: LoadDataResponse) => {
            return new actions.Success(response);
         })
         .catch(() => of(new actions.Failed()));
       });
```

- Ensure none of the state tree is mutated: NGRX store freeze [Reference](https://github.com/brandonroberts/ngrx-store-freeze)

# When to Unsubscribe in Angular
[Reference](https://netbasal.com/when-to-unsubscribe-in-angular-d61c6b21bad3)

- `valueChanges`.
- `router` subscriptions.
- `renderer` service.
- Infinite sequence from `interval()` or `fromEvent()` observables.
- Select methods in NGRX.
- Don't unsubscribe:
  - `Async` pipe.
  - `@HostListener`.
