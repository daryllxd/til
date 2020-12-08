---
layout: post
title:  "TIL, 2020-12-07, Typescript 4.1"
date:   2020-12-07 10:40:51 +0800
categories: programming
summary: "Typescript 4.1"
---

# Articles

- Angular — Utilizing custom pure pipe to improve performance - [Reference](https://medium.com/@liutingchun_95744/angular-utilizing-custom-pure-pipe-to-improve-performance-b363774423e7)
  - Custom pipe is a bit more heavy weighted than a static `Util` class, with more code to write, classes to maintain, and restrictions for usage.
  - Main benefit of pipe - performance, not functionality. As long as pipes are pure, it's memoized. Transformation logic inside `trim()` are always re-executed in each change detection cycle, even when there isn't any change in value. Even if there is no change in value, there is code executed.
  - If we want to use this "anchor" behaviour, the `pure` pipe in the `@Pipe` decorator needs to be true.
  - Pipe has to be stateless. Each call with the same input will always give the same output.
  - Input is immutable - pure pipes check the reference rather than the value. The transformation will be re-triggered only when there is a change in reference.
- Angular — Performance issue caused by function calls in template [Reference](https://medium.com/@liutingchun_95744/angular-performance-issue-caused-by-function-calls-in-template-a1a930f40464)
  - Angular relies on its change detection mechanism to find out the changed data such that it knows which part of the DOM to update. However, there is no way for Angular to know whether there is change in values from function calls. As a result, all function calls in templates will always be re-executed in every change detection cycle for comparison.
  - Getter method is also a function call, which has the same problem.
  - I had some problems in a application that I maintain that people was calculating colors, size via function calls in a component that is shown 1000+ in the screen without virtual scroll. That was really slow.  I wrote some directives to recalculate the style and worked fine. (Needed to remove the function calls and created a input for each variable that could trigger a style change).
- Angular — Four Approaches to Implement Interdependent Components [Reference](https://medium.com/@liutingchun_95744/angular-four-approaches-to-implement-interdependent-components-769e9b39fd96)
  - Component injection: The limitation is that it's child-driven logic rather than parent-driven.

``` ts
    @Component(...)
    export class DropDownComponent {
      constructor(
        parent: DropDownGroupComponent
      ) {
        ...
      }
      ...
    }
```

  - Service: Instead of injecting the parent component directly from the children, a service is created and provided as a middleman to handle the cross-component logic.
  - Content reference: Use `ContentChildren`. Never tried this lol.
  - `TemplateOutlet`: Takes a template reference and renders that template with a given context.

# TypeScript 4.1
[Reference](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-1.html)

- Template literal types: `function setVerticalAlignment(color: "top" | "middle" | "bottom")`. These things can spell check in string values.
  - Template literal type as key ("allowable keys"): `type Options = { [K in "noImplicitAny" | "strictNullChecks" | "strictFunctionTypes"]?: boolean; };`

```
type World = "world";

type Greeting = `hello ${World}`;
//   ^ = type Greeting = "hello world"

We can do shit like this:

type VerticalAlignment = "top" | "middle" | "bottom";
type HorizontalAlignment = "left" | "center" | "right";

// Takes
//   | "top-left"    | "top-center"    | "top-right"
//   | "middle-left" | "middle-center" | "middle-right"
//   | "bottom-left" | "bottom-center" | "bottom-right"

declare function setAlignment(value: `${VerticalAlignment}-${HorizontalAlignment}`): void;

setAlignment("top-left");   // works!
setAlignment("top-middel"); // error!
Argument of type '"top-middel"' is not assignable to parameter of type '"top-left" | "top-center" | "top-right" | "middle-left" | "middle-center" | "middle-right" | "bottom-left" | "bottom-center" | "bottom-right"'.
setAlignment("top-pot");    // error! but good doughnuts if you're ever in Seattle
Argument of type '"top-pot"' is not assignable to parameter of type '"top-left" | "top-center" | "top-right" | "middle-left" | "middle-center" | "middle-right" | "bottom-left" | "bottom-center" | "bottom-right"'.

Some of the real value comes from dynamically creating new string literals. For example, imagine a makeWatchedObject API that takes an object and produces a mostly identical object, but with a new on method to detect for changes to the properties.

let person = makeWatchedObject({
  firstName: "Homer",
  age: 42, // give-or-take
  location: "Springfield",
});

person.on("firstNameChanged", () => {
  console.log(`firstName was changed!`);
});

type PropEventSource<T> = {
    on(eventName: `${string & keyof T}Changed`, callback: () => void): void;
};

/// Create a "watched object" with an 'on' method
/// so that you can watch for changes to properties.
declare function makeWatchedObject<T>(obj: T): T & PropEventSource<T>;

// error!
person.on("firstName", () => {});
Argument of type '"firstName"' is not assignable to parameter of type '"firstNameChanged" | "ageChanged" | "locationChanged"'.

Uppercase
$UpperCase<T>, Lowercase, Capitalize, Uncapitalize type aliases.

Mapped types

type Options = {
  [K in "noImplicitAny" | "strictNullChecks" | "strictFunctionTypes"]?: boolean;
};

You can re-map keys in mapped types with new `as` clause.

type MappedTypeWithNewKeys<T> = {
    [K in keyof T as NewKeyType]: T[K]
    //            ^^^^^^^^^^^^^
    //            This is the new syntax!
}

type Getters<T> = {
    [K in keyof T as `get${Capitalize<string & K>}`]: () => T[K]
};

interface Person {
    name: string;
    age: number;
    location: string;
}

type LazyPerson = Getters<Person>;

// Remove the 'kind' property
type RemoveKindField<T> = {
    [K in keyof T as Exclude<K, "kind">]: T[K]
};

interface Circle {
    kind: "circle";
    radius: number;
}

type KindlessCircle = RemoveKindField<Circle>;
//   ^ = type KindlessCircle = {
//       radius: number;
//   }

Recursive conditional - skip

Indexed accesses with flag `--noUncheckedIndexedAccess`. With this on, you have to explicitly tell the TS compiler that you're accessing a value in a key that might be nil.

interface Options {
  path: string;
  permissions: number;

  // Extra properties are caught by this index signature.
  [propName: string]: string | number;
}

function checkOptions(opts: Options) {
  opts.path; // string
  opts.permissions; // number

  // These are not allowed with noUncheckedIndexedAccess
  opts.yadda.toString();
Object is possibly 'undefined'.
  opts["foo bar baz"].toString();
Object is possibly 'undefined'.
  opts[Math.random()].toString();
Object is possibly 'undefined'.

  // Checking if it's really there first.
  if (opts.yadda) {
    console.log(opts.yadda.toString());
  }

  // Basically saying "trust me I know what I'm doing"
  // with the '!' non-null assertion operator.
  opts.yadda!.toString();
}

Path-mapping - in TS 4.1, the `paths` option can be used without `baseUrl`.
```
