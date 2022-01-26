---
layout: post
title:  "TIL, 2022-01-26, Typescript Handbook"
date:   2022-01-26 15:16:19 +0800
categories: programming
summary: "Typescript Handbook"
---

# The TypeScript Handbook
[Reference](https://www.typescriptlang.org/docs/handbook/intro.html)

- Types
  - Union.
  - To learn the type of a variable, use `typeof`.
  - Generics: Variable to types.
- Structural type system: If two objects have the same shape, they are considered to be of the same type. If they have the same shape, then the code passes.
- JS provides dynamic typing - "running the code to see what happens". Static type system to make prediction about what code is expected, before it runs.
- Static type system describe the shape and behaviour of what our values will be when we run our programs.
- `tsc` is the typescript compiler.
- ES2015 - Contains template strings.
- `noImplicitAny` - TS will not try to infer types and it will fall back to the most lenient type, `any`.
- Everyday types
  - Narrowing: `typeof` or `Array.isArray`.
- Type vs interface
  - Extending an interface is `extends`. Extending a type is via intersection .
- Type assertion: `something as HTMLCanvasElement` or angle bracket syntax.
- Literal types
  - `alignment: 'left' | 'right' | 'center'`
  - `as const` can convert the entire object to be type literals.
- Non-null assertion operator: `!`.
- Narrowing
  - Use `typeof strs === "Object"`.
  - Equality narrowing, or using `switch` to narrow.
  - `in` operator

```
type Fish = { swim: () => void };
type Bird = { fly: () => void };

function move(animal: Fish | Bird) {
  if ("swim" in animal) {
    return animal.swim();
  }

  return animal.fly();
}
```

  - `is` or Type predicates - when to use?
  - Discriminated unions - having something like this:

```
interface Circle {
  kind: "circle";
  radius: number;
}

interface Square {
  kind: "square";
  sideLength: number;
}

type Shape = Circle | Square;
```

  - Exhaustiveness checking with `never`:

```
interface Triangle {
  kind: "triangle";
  sideLength: number;
}

type Shape = Circle | Square | Triangle;

function getArea(shape: Shape) {
  switch (shape.kind) {
    case "circle":
      return Math.PI * shape.radius ** 2;
    case "square":
      return shape.sideLength ** 2;
    !!!Type 'Triangle' is not assignable to type 'never'.
    default:
      const _exhaustiveCheck: never = shape;
      return _exhaustiveCheck;
  }
}
```

