---
layout: post
title:  "TIL, 2022-01-03, Mock pipe?"
date:   2022-01-03 15:47:45 +0800
categories: programming
summary: "Mock pipe?"
---

- Declaring a pipe in a test:

```
TestBed.configureTestingModule({
  declarations: [CartItemSummaryPipe],
  providers: [
    { provide: CurrencyService, useClass: MockCurrencyService },
    { provide: NumberService, useClass: MockNumberService },
    { provide: AppSettingService, useClass: MockAppSettingService },
  ],
}).compileComponents();
```

- You can also probably create a `MockPipe`.

- Semantic difference between `div`, `span`, and `p`? [Reference](https://stackoverflow.com/questions/2961889/is-there-a-semantic-difference-spans-and-divs/2961920)
  - Really it's just `display block`. They have no intrinsic meaning, other than their default value.
- When to use <span> instead <p>? [Reference](https://stackoverflow.com/questions/1908234/when-to-use-span-instead-p)
  - `span` is an inline tag, `p` is a block tag. HTML is intended to describe the content it contains. It has to be like this: `span` is a thing to "hook' the CSS to, but it's otherwise an empty tag devoid of semantic meaning.
  - `p` will add line breaks by default.

- What's the difference between the HTML width / height attribute and the CSS width / height property on the `img` element? [Reference](https://stackoverflow.com/questions/3562296/whats-the-difference-between-the-html-width-height-attribute-and-the-css-widt)
  - Width and height in the HTML `img` tag already adds that by default if let's say the CSS is not there, but they are weak and are overridden by inline CSS styles.
  - If the attributes contradict the style, the style wins.

# The Best Way To Unsubscribe RxJS Observables In The Angular Applications!
[Reference](https://medium.com/angular-in-depth/the-best-way-to-unsubscribe-rxjs-observable-in-the-angular-applications-d8f9aa42f6a0)

- Cold observable is an Observable which will do nothing by itself. Somebody has to subscribe to it to start its execution. Infinite means that once subscribed, the observable will never complete.
- Why is this a memory leak? Because the component will get destroyed but the subscription will live on.
- For `AppComponent` and most of the services, they will be instantiated only once during the application startup.
