---
layout: post
title:  "TIL, 2022-03-19, NodeJS Hacking, RxJS"
date:   2022-03-19 16:22:38 +0800
categories: programming
summary: "NodeJS Hacking, RxJS"
---

# NodeJS hacking

- `execSync` and `readFileSync` to make our lives easier if we have to do Node things in sync mode anyway.
- Can destructure like this:

```
const { execSync } = require('child_process');
const { readFileSync } = require('fs');
```

- `console.error` can have a primary argument for color.
- `execSync` needs to `toString()` after.

# Angular meets RxJS: Basic concepts
[Reference](https://javascript.plainenglish.io/angular-meets-rxjs-basic-concepts-f178d8fe0e02)

- Reactive programming: It will allow the application to "listen to the changes" and react to them by updating the main component to display the messages received along with other information (who sent it, when).
- Calling a subscription to an observable - the observer will receive the data of the observable only once it subscribed to it.
- To fix the issue of the observable existing even if we unsubscribed, when creating the observable, return an object with an `unsubscribe` function.

```
const observable$ = new Observable(observer => {
  let interval = setInterval(() => {
    ...
  }, 1000);

  return {
    unsubscribe: () => clearInterval(interval)
  }
});
```

- Catching error:

```
observable$.subscribe({
  next: x => console.log(`Observer 1: ${x} at ${new Date()}`),
  error: err => console.error(`The observable thrown the exception "${err}"`)
});
```

- An observable that throws an exception is considered as broken and will not emit new values - its state is unrecoverable.
- Observables - are COLD, and values are not shared with all.
- Subjects - are HOT, and values are shared by all.
  - Even if no one subscribed to it, it will produce values.

## Types of Subject

- `BehaviorSuject` will always emit a value upon subscription.
  - If values have already been emitted, the last one is emitted.
- `ReplaySubject` - Will emit the X last emitted values upon subscription.
  - `const subject: ReplaySubject<number> = new ReplaySubject<number>(3);`
- `AsyncSubject`?
- `asObservable` - This allows a subscriber to a Subject to be not allowed to do a `subject.next()`.
- `SubSink`: Remove all subscriptions in a component.

## Operators

- Pure functions: No side effects, and given the same parameters, it should always return the same values.
- `fromEvent` - when a DOM event occurs.
- `interval` - every X MS where X is specified during creation.
- `timer` - more granular `interval`.
- `concat` - takes 2 or more observables in parameter and creates an observable concatenating them. They must end.
- `merge` - does not wait for the source observable to complete before emitting the values of the next.
- `range` - observable emitting a sequential range of numbers.
- `combineLatest`: emits as soon as all observables have emitted at least one value.
- `distinctUntilKeyChanged` - TIL.
- `pluck` is a light weighted version of `map`.
- `bufferCount` - groups observables every X emissions.
- `scan` - something like accumulate.
- `debounceTime` - no emit until a certain period of time without values being emitted occurs. Ex: `type-ahead`.
- `sampleTime` - check every X milliseconds whether a value has been emitted, and if so, emit it.
- `bufferTime` - emit array with all emitted values every interval.
- `throttleTime` - emit value, then ignore for x amount of time.

## `takeUntil` and `async`
[Reference](https://javascript.plainenglish.io/angular-meets-rxjs-takeuntil-and-the-async-pipe-4d9c6e3d5c2d)

- Idea: create a base component:

```
import { Directive, OnDestroy } from '@angular/core';
import { Observable, Subject } from 'rxjs';

@Directive()
export class BaseComponent implements OnDestroy {

  private _subject: Subject<void> = new Subject<void>();

  protected get destroy$(): Observable<void> {
    return this._subject.asObservable();
  }

  public ngOnDestroy() {
    this._subject.next();
    this._subject.complete();
  }

}

```

- Async pipe: The pipe would take care of subscribing and unsubscribing the subscription.
- Continue later

# Why You Should Consider Reactive Programming
[Reference](https://goodguydaniel.com/blog/why-reactive-programming)

- Callbacks to
