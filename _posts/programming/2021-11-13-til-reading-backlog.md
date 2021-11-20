---
layout: post
title:  "TIL, 2021-11-13"
date:   2021-11-13 09:33:19 +0800
categories: programming
summary: "Scrub through reading backlog."
---

- `npm outdated` to check what's outdated.
- `@use sass:list` and `sass:list`.
- Sass does not raise a syntax error in `['hello' world']`.
- Babel = JS compiler where next-generation JS is put in, and browser-compatible JS goes out.
- Why Completing/Unsubscribing Your Observable Stream Is Important [Reference](https://betterprogramming.pub/why-completing-unsubscribing-your-observable-stream-is-important-f96b513e83c1)
  - Angular async pipe - will unsubscribe or clean up the stream.
  - Completion observable - `AsyncSubject` with `takeUntil` operator.
  - `take(n)` - amount of times you expect to receive data before navigating.
- Best Practices for Managing RxJS Subscriptions [Reference](https://www.thisdot.co/blog/best-practices-for-managing-rxjs-subscriptions)
  - When an Observable emits a new value, its Observers execute code that was set up during the subscription.
  - Unsubscribing manually - `unsubscribe`? Create variable to store the subscription and unsubscribe - tedious.
  - Array of subscriptions.
  - RxJS operators
    - `first` - literally only the first value emitted, then complete.

```
function onEnterView() {
    obs$.pipe(first())
        .subscribe(data => doSomethingWithDataReceived(data))
}
```

    - `take` and `takeUntil` - being used in `x.next()` and `x.complete()`.
    - `takeWhile`.
  - Angular `async` pipe.
  - `UntilDestroy` decorator?
- How to Test Asynchronous Code with Jest [Reference](https://www.pluralsight.com/guides/test-asynchronous-code-jest)
  - Jest typically expects to execute the tests' functions synchronously. If we do an asynchronous operation, but we don't let Jest know that it should wait for the test to end, it will give a false positive.

- Complexity and Strategy [Reference](https://hackernoon.com/complexity-and-strategy-325cd7f59a92)
  - Would adding functionality in the future be **easier, because you develop more and more infrastructure, expertise, and tooling**, which makes it easier to add new features?
  - Or would adding functionality be harder, as the system gets more functional?
  - Example: FrontPage editor had key well-factored components like the lexical analyzer, HTML parser that made it easy to support new HTML tags.
  - Counter-example: FP also had a feature called "Preview view" which was hackish and was just supposed to be just a preview to make it easier to see things introduced complexity whenever new functionality was added.
  - Word wanting to add the Table feature that was in PowerPoint - PowerPoint code architecture was better structured to add these visual features. Word had more cases to think about - spanning rows and columns, running table headers, style sheets. These were **essential** complexity, not **accidental** complexity.
    - If essential complexity growth is inevitable, you want to do everything you can to reduce ongoing accidental or unnecessary complexity.
  - MS OneNote - they didn't build on top of rich Word editing surface - which they didn't regret.
  - **Advocates of new technologies tended to confuse the productivity benefits of working on a small code base with the benefits of the new technology itself - efforts of using a new technology inherently start small so the benefits got conflated.**
    - In actual practice, if the product stays small, you can essentially "book" that initial productivity gain — a clear win.
    - If the product starts to grow complex — and you can predict that fairly directly by looking at the size of the development team — then costs will come to be dominated by that increasing feature interaction and essential complexity.
  - Framework code: "You ship it, you own it". You eventually pay for all that code that lifted your initial productivity.
  - Continuous delivery: It helps prevent the team from building features that increase complexity but do not add user value. **The highest cost feature you can build is the one that is not used or valued — your cost / benefit ratio is infinite. You continue paying to integrate with that useless feature as you build every additional feature from that point forward.**
  - Office vs Google Docs: Cloud/browser strategy vs device-based licensing.
    - Google docs were really quite simple when they started.
    - What Google was doing was to use their simplicity to deliver sharing and co-editing features. These were clearly differentiated and would be hard for Office to deliver.
    - Developing the "word web app" vs a "web-based word processor not compatible with Word" was because they though that the moat was the Office file format.
  - **Determining which components are worth isolating, getting teams to agree and unify on them rather than letting “a thousand flowers bloom” is hard ongoing work. It does not end up looking like a breakthrough — it looks like an engineering team that is just getting things done. That always seemed like a worthy goal to me.**


- Questions - when to use subject
  - Difference between the different subjects
  - Difference between complete and unsubscribe
