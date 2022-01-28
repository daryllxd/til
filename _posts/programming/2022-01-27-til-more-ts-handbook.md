---
layout: post
title:  "TIL, 2022-01-27, More TS Handbook"
date:   2022-01-27 10:41:30 +0800
categories: programming
summary: "More TS Handbook"
---

- In JavaScript, if you call a function with more arguments than there are parameters, the extra arguments are simply ignored. TypeScript behaves the same way. Functions with fewer parameters (of the same types) can always take the place of functions with more parameters.

# More Typescript Handbook
[Reference](https://www.typescriptlang.org/docs/handbook/2/functions.html)

- `void` - return value of functions that don't return a value.
- Object - any value that isn't a primitive. Function values are objects - they have properties, can call `Object.prototype` in their prototype chain, can call `Object.keys` on them.
- `unknown` - Represents `any` value, but is safer because it's not legal to do anything with an `unknown` value.
- `never`
  - Some functions never return a value - can be from error.
  - `never` also appears when TS determines there's nothing left in a union.
- `Function` - generally an untyped function call. Much better to do `() => void`.
- Rest parameters:

```
function multiply(n: number, ...m: number[]) {
  return m.map((x) => n * x);
}
```
