---
layout: post
title:  "TIL, 2022-03-18, Async Await Experiments"
date:   2022-03-18 12:36:33 +0800
categories: programming
summary: "Async Await Experiments"
---

# Async await

```
async function sayHello() {
  return 'Hello World';
}

sayHello().then((value) => console.log(value));

If we just had function sayHello(), then `then` doesn't make sense.
```

```
async function sayHi() {
  return 'Hi';
}

async function sayHello(arg = 1) {
  console.log('in say hello');
  if (arg === 1) {
    const inner = await sayHi();
    return inner;
  } else {
    return 'Hello Worlds';
  }
}

sayHello().then((value) => console.log(value));;

- Will wait for 'hi'
```

- Reject in `async/await` - just throw an error. Catch it in the `then`.

# Why You Should Consider Reactive Programming
[Reference](https://goodguydaniel.com/blog/why-reactive-programming)

- Callbacks to `async/await` - callbacks allowed us to write code that is not yet ready to be executed because its parameters depend on the execution of a task that will be complete in the future.


```
doSomething(param1, param2, function(err, paramx) {
  doMore(paramx, function(err, result) {
    insertRow(result function(err) {
      yetAnotherOperation(someparameter, function(s) {
        somethingElse(function(x) {
          // ...
        });
      });
    });
  });
});
```

- Promise/promise hell:

```
function something() {
  return doSomething(param1, param2);
}

function main() {
  something().then((err, paramx) => {
    doMore(paramx).then((err, result) => {
      insertRow(result).then((err) => {
        // ...
      });
    });
  });
}
```

- `async` function - syntactic sugar above promises.
  - Not much `then` in the codebase.
