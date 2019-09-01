---
layout: post
title:  "TIL, 2019-09-01, Angular tests, underlines, debounce vs throttle"
date:   2019-09-01 13:55:23 +0800
categories: programming
summary: "Weekend Reading"
---

# Styling Links with Real Underlines
[Reference](https://css-tricks.com/styling-links-with-real-underlines/)

- Graphically: underlines are seen as unsophisticated.
- For the web, an underline means a link. And we show links as blue.
- WCAG (accessibility group) recommends underlines for links. Color blind users need to be able to discern a link (can also use bold `font-weight`).
- If we're going to use underline, it should at least look nice.
- `text-underline-offset`: In conjunction with `text-decoration`, it controls the position of the underline.
- `text-decoration-thickness`: Controls the thickness of underlines as well as overlines and strike-through.
- This underline is nicer, because it
- Text-decoration thickness is in `em`, so that it scales with the font's thickness.
- `text-decoration-style`: Edge is moving to Chromium so we can have cross-browser support for these guys.

# Angular — A Comprehensive guide to unit-testing with Angular and Best Practices
[Reference](https://medium.com/bb-tutorials-and-thoughts/angular-a-comprehensive-guide-to-unit-testing-with-angular-and-best-practices-e1f9ef752e4e)

- `TestBed`: A dynamically constructed test module which emulates an Angular `NgModule`. The metadata that goes into `TestBed.configureTestingModule()` and `@NgModule` are pretty similar, and this is where we actually configure the spec file.
- `compileComponents()` method: This is async because we read these files from the file system before we even create a component, and this is asynchronous (why it's placed inside an async function).
- This is also why we have two `beforeEach` functions, one to asynchronously get everything, and one that is run after the first block which is when we create the actual specs.
- `NO_ERRORS_SCHEMA`: Causes us to just ignore the non-recognized elements in the test.
- Best practices:
  - Testing services: spy from jasmine.
  - When subscribing to observables, have both success and failure callbacks.
  - When testing components with service dependencies, use mock services instead of real services.
  - Access components with `debugElement`, not `nativeElement` as that is an abstraction for the underlying runtime environment.
  - `By.css` instead of `queryselector` if running the app on the server: because `queryselector` works only in the browser.
  - `fixture.detectChanges()` vs `ComponentFixtureAutoDetect`.
  - `compileComponents()` if running the tests in the non-CLI environment.
  - `PageObject` model for reusable functions across components.
  - Can use component stubs instead of `NO_ERRORS_SCHEMA` to interact with both components if necessary.

# Angular — Understanding Angular lifecycle hooks with a Sample Project
[Reference](https://medium.com/bb-tutorials-and-thoughts/angular-understanding-angular-lifecycle-hooks-with-a-sample-project-375a61882478)

- `ngOnInit()`: Occurs only one time. Use case: when getting data from API, initialising 3rd party JS library.
- `ngOnChanges()`: Occurs every time there is a change in the Input.
  - Implement `OnChanges` and take in a `SimpleChanges` Object as an input parameter. This checks both `currentValue` and `previousValue`.
  - When something changes in the `@Input` data property, we can do more changes in this method by comparing previous and current values.
- `ngDoCheck()`: Occurs every time a change detection happens and manually triggers this.
  - When something gets updated from the `@Input`, and you have to update an internal property.
- `ngOnDestroy`: Used to unsubscribe all operations and detach event handlers to avoid memory leaks.
  - RXJS `takeUntil` operator: Allows subscribing until the certain condition meets true.
- `ngAfterViewInit()`: Called once view and all other child views are loaded.
- `ngAfterViewChecked()`: Called once after `ngAfterViewInit` and every time after `ngDoCheck`.
- `ngAfterContentInit()`: After content inside `ng-content` is projected.
- `ngAfterContentChecked()`: Called after external content is projected into component's view.

# Angular — How To Proxy To Backend Server
[Reference](https://medium.com/bb-tutorials-and-thoughts/angular-how-to-proxy-to-backend-server-6fb37ef0d025)

- Proxying in the development environment: calls starting with `/api` will be redirected to the back-end server and the rest all fall back to the same port.
- `proxy.config.json` with `target`, `pathRewrite`, `changeOrigin` (if not localhost), `logLevel`, `bypass`.

```
{
    "/api/*": {
    "target": "http://localhost:3070",
    "secure": false,
    "logLevel": "debug",
    "changeOrigin": true
  }
}
```

# JavaScript Throttle and Debounce | Concept and Comparison
[Reference](https://kriss.io/javascript-throttle-and-debounce-concept-and-comparision/)

- Throttle: Higher-order function which takes a method and a timeout, and allows that function to be executed at most once per the amount of time specified. Used to ensure that a function is called at most once in a specified time period. So throttling will stop a function from running if it has run just recently.
  - Used in button clicks to prevent spam click, or in an API Call, or in a `mousemove`/`touchmove` event handler.
- Debounce is used more than throttling. Throttling slows down method calls, but in debounce, we don't execute the method at all until the previous execution of that method has stopped.
  - We can use in resize, scroll event handler, auto-complete or auto-save.
