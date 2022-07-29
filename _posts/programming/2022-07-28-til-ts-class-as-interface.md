---
layout: post
title:  "TIL, 2022-07-28, TS class as interface"
date:   2022-07-28 08:41:23 +0800
categories: programming
summary: "Where I..."
---

# Why must must NGRX/Redux effects return actions? Is using a noop action like elm considered bad practice?
[Reference](https://stackoverflow.com/questions/44055379/why-must-must-ngrx-redux-effects-return-actions-is-using-a-noop-action-like-e)

- `{ dispatch:  false }` to opt out of `@Effects`. Under the hood, this is achieved with the `ignoreElements` operator.
- Effect conditionally:


```
@Effect() foo$ = this.actions$
  .ofType(ChatActions.FOO)
  .withLatestFrom(this.store, (action, state) => ({ action, state }))
  .mergeMap(({ action, state }) => {
    if (state.foo.isCool) {
      return Observable.of({ type: Actions.BAR });
    } else {
      return Observable.empty();
    }
  });
```

# Typescript: Use class as interface
[Reference](https://stackoverflow.com/questions/47114181/typescript-use-class-as-interface)

```
class Test {
  foo: any;
  private bar: any;
}

class SpecialTest implements Pick<Test, keyof Test> {
  foo: any;
}
```

- This saves writing a base interface type. Can just write the mock interface based on the original one.
