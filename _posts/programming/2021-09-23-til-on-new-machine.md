---
layout: post
title:  "TIL, 2021-09-23"
date:   2021-09-23 11:47:05 +0800
categories: programming
summary: "More Vim setting up on New Machine"
---

# Getting this TIL to work on new machines

- Updated TIL Ruby version to 3.0.1, might as well.
- Add `pry-byebug` to Gemfile, as previously we were loading the system gem.
- FFI error: [Reference](https://github.com/ffi/ffi/issues/828)
- `Ultisnips` Error - this is cause got no Python. Just `brew install python3` and `brew install vim` and link your Homebrew Vim instead of your system vim.
- If Snippets are missing [Reference](https://stackoverflow.com/questions/37511063/why-ultisnips-does-not-recognize-my-own-snippets), then check `~/.vim/bundle/vim-snippets/UltiSnips/` directory.

```
To enable snippet on Markdown:
snippet [r
[Reference](${1:link})
endsnippet
```

# Understanding RxJS Observables and why you need them
[Reference](https://blog.logrocket.com/understanding-rxjs-observables/)

- Reactive extension to JS with better performance, modularity, better debuggable call stacks while staying mostly backwards compatible.
- Stream: A sequence of data values over time. Observables = a function that can return a stream of values to an observer over time.
- Observers and subscriptions.
  - Observables are data source wrappers, then the observer executes some instructions when there is a new value or a change in data values.
  - Creating an observable: `Observable.create((observer: any) => { observable.next('Hello World') }`.
  - You have to subscribe to it, too.
- Error value: With an error, the observer sends a JS exception. If an error is found in the Observable, nothing else can be delivered to the Observable.
- Complete - nothing else can be delivered to the observable.
- To destroy an Observable is to essentially remove it from the DOM by unsubscribing to it.

```
const haha = Observable.create((observer: any) => {
  observer.next("Hello World");
  observer.next("Hello World 2");
  setInterval(() => {                          <= This would be a normal `setInterval`.
    observer.next('Random Async log message'); <= If the observable is complete already, then this would not execute
    observer.complete();
  }, 2000);

  console.log('yolo');
  observer.next("Hello World 3");
  observer.next("Hello World 4");
});
```
- Observables:
  - Emitting multiple values asynchronously is very easily handled with Observables.
  - Error handlers can also easily be done inside Observables.
  - Observables are considered lazy, so in case of no subscription, there will be no emission of data values.
  - Observables can be resolved multiple times.

```
Other method signature

haha.subscribe({
  next(x: any):void { console.log('value', x); },
  error(err: any):void { console.error('error') },
  complete():void { console.log('done') }
});
```

# RxJS Documentation
[Reference](https://rxjs-dev.firebaseapp.com/guide/observable)

- Function - Lazily evaluated computation that synchronously returns a single value on invocation.
- Generator - a lazily evaluated computation that synchronously returns zero to potentially infinite values on iteration.
- Promise - a computation that may eventually return a single value.
- Observable - a lazily evaluated computation that can synchronously or asynchronously return zero to potentially infinite values from the time it's invoked onwards.

This:

```
function foo() {
  console.log('Hello');
  return 42;
}

const x = foo.call(); // same as foo()
console.log(x);
const y = foo.call(); // same as foo()
console.log(y);
```

Is similar to this:

```
import { Observable } from 'rxjs';

const foo = new Observable(subscriber => {
  console.log('Hello');
  subscriber.next(42);
});

foo.subscribe(x => {
  console.log(x);
});
foo.subscribe(y => {
  console.log(y);
});
```

- Both functions and Observables are lazy computations - if you don't call the function, console.log wouldn't happen.
- Calling or subscribing trigger two separate side effects. As opposed to EventEmitters which share the side effects and have eager execution regardless of the existence of subscribers.
- Observables, if no timeout/setInterval, are like functions, and are actually synchronous. However, it can return values asynchronously (unlike functions). `func.call` means "give me one value synchronously", `observable.subscribe` means "give me any amount of values, either sync or async".
- Creating observables:
  - Has only one argument, the `subscribe` function.
  - `new Observable`. But more commonly, `of`, `from`, `interval`.
  - Being subscribed to - note that the Observable does not even have a list of attached Observers.
- Subscriber:
  - Is a subscription.
  - When you subscribe, you get back a Subscription, which represents the ongoing execution. Just call unsubscribe() to cancel the execution.

```

const yolo2 = haha.subscribe((x) => {
  console.log(x)
});

console.log(yolo2); Subscriber closed: false
yolo2.unsubscribe();
console.log(yolo2); Subscriber closed: true
```

- Just a way to know that the subscription closed. BTW when a subscription is closed, then new things emitted by `next` would not be received.

```
setTimeout(() => {
  yolo2.unsubscribe(); <= If the observable that yolo2 is subscribed to emits something, yolo2 doesn't care since it's closed now.
}, 3000);
```

- Safe unsubscribe:
  - WTF was this guy saying lol.
