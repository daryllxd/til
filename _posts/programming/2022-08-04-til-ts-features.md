---
layout: post
title:  "TIL, 2022-08-04, TS features"
date:   2022-08-04 12:35:47 +0800
categories: programming
summary: "Where I..."
---

# `const` assertions are the killer new TypeScript feature
[Reference](https://blog.logrocket.com/const-assertions-are-the-killer-new-typescript-feature-b73451f35802/)

- `as const` (constant assertion)
  - No literal types in that expansion should be widened.
  - Object literals get `readonly` properties.
  - Array literals become `readonly`.

``` ts
let x = 'x'; <- this can be widened
x = 'y';

let y = 'x' as const; <- this cannot
y = 'z';

const setCount = (n: number) => {
  return {
    type: 'SET_COUNT',
    payload: n
  }
}

The return value of `setCount(123)` can still be changed.

const setCount = (n: number) => {
  return {
    type: 'SET_COUNT',
    payload: n
  } as const
}

The return value can then not be changed.
```

Other things that `const` assertions can remove - Adding a type of `ReturnType` for the returns.

```
const hello = () => {
  return [1, 2, 3] as const;
}

let aw = hello();
aw.push(1); <- Errors out due to `as const` assertion
```

# Promise
[Reference](https://basarat.gitbook.io/typescript/future-javascript/promise)

- Async version of loading JSON where mistakes can happen:

```
import fs = require('fs');

function loadJSON(filename: string, cb: (error: Error) => void) {
    fs.readFile(filename, function (err, data) {
        if (err) return cb(err);
        // Contain all your sync code in a try catch
        try {
            var parsed = JSON.parse(data);
        }
        catch (err) {
            return cb(err);
        }
        // except when you call the callback
        return cb(null, parsed);
    });
}
```

- Promise: a promise can be either `pending`, `fulfilled`, or `rejected`.

```
const promise = new Promise((resolve, reject) => {
    resolve(123);
});
promise.then((res) => {
    console.log('I get called:', res === 123); // I get called: true
});
promise.catch((err) => {
    // This is never called
});
```

- Quickly creating an already resolved promise: `Promise.resolve(result)`
- Quickly creating an already rejected promise: `Promise.reject(error)`

- Reading a file with Promise:

```
import fs = require('fs');
function readFileAsync(filename: string): Promise<any> {
    return new Promise((resolve,reject) => {
        fs.readFile(filename,(err,result) => {
            if (err) reject(err);
            else resolve(result);
        });
    });
}
```

# Top 5 TypeScript Features You Should Master
[Reference](https://betterprogramming.pub/top-5-typescript-features-you-should-master-2358db9ab3d5)

- Tuple types allow you to express an array with a fixed number of elements as `const`.
- Mapped types: `Readonly`, `ReurnType`, `NonNullable`.
- Narrowing via Type guards: Using a function whose return type is a `type predicate` and it returns `true/false`.

# TypeScript: A Gentle Introduction to Mapped Types
[Reference](https://betterprogramming.pub/typescript-a-gentle-introduction-to-mapped-types-f65e45fa2598)

- `keyof` gets the keys of an object.
- Iterating over keys of objects: `[P in keyof T]: T[P]`.
- Conditional typing.
- `never` and `infer`.
- `Partial`: Makes all keys optional.

# Master TypeScript’s Type Guards
[Reference](https://betterprogramming.pub/master-typescripts-type-guards-1fd5436bc6f2)

# TypeScript 4.1’s Advanced Mapped Types
[Reference](https://betterprogramming.pub/typescript-4-1s-advanced-mapped-types-eba9a2ba7a9)

- Mapped types: Making a type based on another type. Ex: `Readonly`
- Can add a `-` to remove `readonly` interface, and same with `?`.
- Recursive conditional types - it's okay.
- Template literal types - `Uppercase`, `Lowercase`, `Capitalize` `Uncapitalize`).
- Remapping type:

```
interface Person {
  name: string;
  surname: string;
  email: string;
}

type UpdateFactory<T> = {
  [P in keyof T as `set${Capitalize<string & P>}`]: (key: T[P], item: T) => T;
}

type PersonFactory = UpdateFactory<Person>;

// PersonFactory will now have this methods:
setName: (key: string, item: Person) => Person;
setSurname: (key: string, item: Person) => Person;
setEmail: (key: string, item: Person) => Person;
```

# How to use the `keyof` operator in TypeScript
[Reference](https://blog.logrocket.com/how-to-use-keyof-operator-typescript/)
