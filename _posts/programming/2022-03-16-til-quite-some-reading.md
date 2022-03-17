---
layout: post
title:  "TIL, 2022-03-16, Quite Some Reading"
date:   2022-03-16 08:04:48 +0800
categories: programming
summary: "Quite Some Reading"
---

# BehaviorSubject vs Observable?
[Reference](https://stackoverflow.com/questions/39494058/behaviorsubject-vs-observable)

- `BehaviorSubject` is a type of `Subject`. A subject is a special type of observable so you can subscribe to messages like any other observable.
- Unique features of `BehaviorSubject`:
  - Initial value so it must always return a value on subscription.
  - *Upon subscription, it returns the last value of the subject.*
  - At any point, you can retrieve the last value using `getValue` method.
- You can get an observable from `BehaviorSubject` using `asObservable()`.
- In Angular services, I would use BehaviorSubject for a data service as an angular service often initializes before component and behavior subject ensures that the component consuming the service receives the last updated data even if there are no new updates since the component's subscription to this data.
- Since observable is just a function, it does not have any state, so for every new Observer, it executes the observable create code again and again. BehaviorSubject stores observer details, runs the code only once
  - *Code run for each observable.*
- Subject is Hot by default, Observables are cold by default. The instant we create a subject, we can emit a value from it and that value will be emitted even if nobody is subscribed to it yet.
- *Behavior object takes in an initial "seed" value, so new subscribers instantly get that value.*
- As observable is just a function, it does not have any state, so for every new Observer, it executes the code again and again. `BehaviorSubject` stores observer details, runs the code only once and gives the result to all observers.
- `ReplaySubject` - no matter when you subscribe, you will receive all the broadcasted message. It has a history/can broadcast/emit a sequence of old values.
- Libraries will expose fields as observable, but may use Subject or BehaviorSubject behind the scenes (ex: ActivatedRoute).

# Observables vs Subjects vs BehaviorSubjects
[Reference](https://javascript.plainenglish.io/eli5-observables-vs-subjects-vs-behavior-subjects-f2494f14813d)

- Observables are synchronous like promises, but the key distinction is that Observables can return multiple values over time, and promises simply return a single value.
- Cold observable: When there's only one observer subscribed and listening for changes.
- Hot observable: When there are multiple observers listening for changes.
- Regular observable: Cold and unicast. They are usually used to read or update the current state.
- Subject/BehaviorSubject.
  - Can feed value to subject with `subject$.next`.
  - BehaviorSubject - You can access the value at any time with `getValue`. This makes it useful for storing data in a service to share across your app. It can be sort of a store that acts as a single source of truth.

# Sharing data between components using BehaviorSubject
[Reference](https://medium.com/codex/how-to-share-data-between-components-in-angular-a-shopping-cart-example-b86ce8254965)

- Requires an initial value when instantiated, which allows us to set a default value for our state.
- Emits the latest value on subscription.
- We can get snapshots of its value with `getValue()` if we need it for synchronous purposes.
- It can be used as a type of projection to derive data without modifying the original state.

# Incremental vs Virtual DOM
[Reference](https://blog.bitsrc.io/incremental-vs-virtual-dom-eb7157e43dca)

- Virtual DOM - keep a virtual representation of the UI in memory, and sync it with real DOM using the reconciliation process.
  - Reconciliation process - rendering the entire UI into virtual DOM when there's a change in UI, calculating the difference, and then updating the real DOM with the changes.
- Incremental DOM - There is no virtual representation of the real DOM in memory to calculate the difference, and the real DOM is used to diff against new trees.
- Why better?
  - Incremental DOM - compile each component to a set of instructions before compilation, and these help to identify the unused instructions.
  - Memory usage - We don't keep that virtual DOM existing always, and that virtual DOM has memory.
  - Trade-off: The virtual DOM is faster.
- Advantage of Virtual DOM:
  - Diffing algorithm.
  - Simple and help boost performance.
  - Can be used without React.
- Issue: Changing a prop makes the diff-er check and compare attributes in `div` tag.
- Comments:
  - Svelte compiles components into instructions that manipulate DOM, but it doesn't create virtual DOM and then diff against real DOM.

# React vs. Svelte: The War Between Virtual and Real DOM
[Reference](https://blog.bitsrc.io/react-vs-sveltejs-the-war-between-virtual-and-real-dom-59cbebbab9e9)

- Svelte is a compiler that converts your application into ideal JS during build time as opposed to React, which uses a virtual DOM to interpret the application code during runtime.
- Svelte Benefits
  - Build time is faster.
  - Bundle size is smaller.
  - Binding classes are relatively easy.
  - Scoping CSS within the component itself allows flexible styling.
  - Easier to understand and get started.
  - Straightforward store vs React's context API.
- Downsides
  - Don't listen to reference updates and array mutations - must re-assign arrays (eh, that is normal?).
  - Listening to DOM events means follow Svelte's syntax.
  - Community support.
  - Syntax.

# 11 JavaScript and TypeScript Shorthands You Should Know
[Reference](https://blog.bitsrc.io/11-javascript-and-typescript-shorthands-you-should-know-690a002674e0)

- Nullish coalesece: Return a value if evaluated expression is null or undefined.
- Logical nullish (`??=`): Check for a nullish coalesce and assign it if it has one.
- Bitwise = same as `Math.floor` method.
- Casting any value to boolean with `!!`.
- Spread then merge, and then do `Set` to prevent repeated values.

# Formatting Phone Numbers
[Reference](https://jhalabi.com/blog/accessibility-phone-number-formatting)

# On Being Indispensable
[Reference](https://www.sofuckingagile.com/blog/on-being-indispensable)
[Reference](https://news.ycombinator.com/item?id=30671345)

- The org was conditioned to go to me for answers instead of discovering on their own. And suggesting otherwise was met with hostility.
- We have documentation, teams in the design process, a roadmap, the documentation. But an enterprise customer is full of surprises.
- "Everything you need to know about X, ask Y".
- At some point, I need to stop understanding.
- Creating an email rule so that sales reps would be forwarded to sales managers and directors. Then they decide if I was required.
- **In a growing company, the indispensable people may find themselves being left holding the bag while new initiatives are undertaken. I very quickly learned the meaning of 'working your way out of a job' after the first time this happened to me.**
- If you are truly “indispensable”, that makes you the one with all of the leverage. If they can jerk you around without pushback, then “indispensable” sounds more like a rhetorical device / excuse.
- For knowledge/creative organisations to stay in business over the long term, they need to continuously innovate, and for innovation you want people to be strong generalists. Not just because it lets them spot opportunities they otherwise might not, but also because it lets the organisation run more efficiently with less paperwork, and because it gives people the autonomy they need to think clearly about things.

# Why's that company so big? I could do that in a weekend
[Reference](https://danluu.com/sounds-easy/)

- Businesses that actually care about turning a profit will spend a lot of time (hence, a lot of engineers) working on optimizing systems, even if an MVP for the system could have been built in a weekend. There's also a wide body of research that's found that decreasing latency has a significant effect on revenue over a pretty wide range of latencies for some businesses. Increasing performance also has the benefit of reducing costs. Businesses should keep adding engineers to work on optimization until the cost of adding an engineer equals the revenue gain plus the cost savings at the margin. This is often many more engineers than people realize.
- And that's just performance. Features also matter: when I talk to engineers working on basically any product at any company, they'll often find that there are seemingly trivial individual features that can add integer percentage points to revenue. Just as with performance, people underestimate how many engineers you can add to a product before engineers stop paying for themselves.
- Features like internationalization, security, and organizational problems.
- Ex: Lucene vs Google.
  - Even if you come up with a better algorithm than PageRank, you will still need a multi-thousand person platforms org.
  - The company will want to handle other languages.
  - The company will want to have good security.
  - Small features that all increase revenue.
  - At some point, Stripe will not cut it, you need that engineer billing team.
  - At some point, salespeople will be valuable.
  - To build reliable systems, error handling is more work than the happy path.

# Reading postmortems
[Reference](https://danluu.com/postmortem-lessons/)

- Error Handling.
  - Error handling is generally regarded as "being hard". It's not so obvious that test/static analysis are devoted to making sure that error handling works.
  - Most failures are actually from errors that are handled incorrectly.
  - 25% from ignoring an error.
  - 8% from catching the wrong exception.
  - 2% from incomplete TODO.
  - 23% are easily detectable.
- Configuration
  - More configuration bugs than code bugs. About 50% are config bugs.
  - No proper testing/staging environment that lets them test risky config changes.
- Hardware failures: DRAM errors were actually higher that Google switched back to ECC RAM.
- Process: It's under-reported.
- Monitoring.
