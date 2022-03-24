---
layout: post
title:  "TIL, 2022-03-23, ngrxLet and current value of RxJS subject"
date:   2022-03-23 11:16:00 +0800
categories: programming
summary: "ngrxLet and current value of RxJS subject?"
---

- Simple way to get the current value of a BehaviorSubject with RxJS [Reference](https://stackoverflow.com/questions/38784566/simple-way-to-get-the-current-value-of-a-behaviorsubject-with-rxjs5)
  - `myBehaviorSubject.value`.
- `ReplaySubject` - replays/emits old values to new subscribers.
- How to get the last value from a `ReplaySubject`? [Reference](https://stackoverflow.com/questions/46437704/how-do-i-get-the-last-value-from-a-replaysubject)
  - `last` will wait for a stream to complete, then give you the last value emitted before the stream ended. So in order for it to work, the stream will need to end. To make subscribers receive the last value emitted, consider reaching for `BehaviorSubject`, which was designed for this use case.

# How to get current value of RxJS Subject or Observable?
[Reference](https://stackoverflow.com/questions/37089977/how-to-get-current-value-of-rxjs-subject-or-observable)

- The only way you should be getting values "out of" an Observable/Subject is with subscribe!
If you're using `getValue()` you're doing something imperative in declarative paradigm. It's there as an escape hatch, but 99.9% of the time you should NOT use `getValue().` **There are a few interesting things that `getValue()` will do: It will throw an error if the subject has been unsubscribed, it will prevent you from getting a value if the subject is dead because it's errored, etc. But, again, it's there as an escape hatch for rare circumstances.**

There are several ways of getting the latest value from a Subject or Observable in a "Rx-y" way:

- Using BehaviorSubject: But actually subscribing to it. When you first subscribe to BehaviorSubject it will synchronously send the previous value it received or was initialized with.
- Using a ReplaySubject(N): This will cache N values and replay them to new subscribers.
A.withLatestFrom(B): Use this operator to get the most recent value from observable B when observable A emits. Will give you both values in an array [a, b].
- A.combineLatest(B): Use this operator to get the most recent values from A and B every time either A or B emits. Will give you both values in an array.
- shareReplay(): Makes an Observable multicast through a ReplaySubject, but allows you to retry the observable on error. (Basically it gives you that promise-y caching behavior).
- publishReplay(), publishBehavior(initialValue), multicast(subject: BehaviorSubject | ReplaySubject), etc: Other operators that leverage BehaviorSubject and ReplaySubject. Different flavors of the same thing, they basically multicast the source observable by funneling all notifications through a subject. You need to call connect() to subscribe to the source with the subject.

# `@ngrx/component`

- `ngrxPush` is a drop-in replacement for the async pipe.
- `ngrxLet` directive provides a structural directive with better support for handling observables.

Async pipe:

```
<ng-container *ngIf="observableNumber$ | async as n">
  <app-number [number]="n">
  </app-number>
  <app-number-special [number]="n">
  </app-number-special>
</ng-container>
```

- The problem is `*ngIf` is also interfering with rendering and in case of a falsy value the component would be hidden.

## Features

- Binding is always present. (`*ngIf="truthy$"`)
- Takes away the multiple usages of the async or ngrxPush pipe
- **Provides a unified/structured way of handling null and undefined.**
- Triggers change-detection differently if zone.js is present or not (ChangeDetectorRef.detectChanges or ChangeDetectorRef.markForCheck).
- Triggers change-detection differently if ViewEngine or Ivy is present (ChangeDetectorRef.detectChanges or ɵdetectChanges)
- Distinct same values in a row (distinctUntilChanged operator),

# With the `ngrxLet` directive we could get rid of that `*ngIf` trick that we love-hated
[Reference](https://dev.to/nickraphael/with-the-ngrxlet-directive-we-could-get-rid-of-that-ngif-trick-that-we-lovehated-20m4)

- So what's wrong with that? Sounds perfect. And it almost is. We don't like the fact that we co-opted the `*ngIf` for something that wasn't really a show/hide issue. In fact, we may have a different `*ngIf` statement that we want to use here. Also, using `*ngIf` here can interfere with Angular's rendering and if your observable returns a falsy value, your div will hidden. Messy.

# Interesting Reddit thread
[Reference](https://www.reddit.com/r/Angular2/comments/soaz12/how_to_handle_errors_reactively_with_the_async/)

- View model approach - it's a love-hate thing.
