---
layout: post
title:  "TIL, 2021-08-23, Angular Performance"
date:   2021-08-23 15:00:41 +0800
categories: programming
summary: "Properties vs Methods, Performance"
---

# Properties vs Methods
[Reference](https://stackoverflow.com/questions/601621/properties-vs-methods)

- ***In general, methods represent actions and properties represent data. Properties are meant to be used like fields, meaning that properties should not be computationally complex or produce side effects. When it does not violate the following guidelines, consider using a property, rather than a method, because less experienced developers find properties easier to use.***
- Property should also provide encapsulation for the fields. If you leave your fields public, end user may assign any value.
- Properties - getters should be simple and thus unlikely to throw exceptions - no network or database access.
  - They should not have dependencies on each other.
  - Settable in any order.
  - Getter does not have an observable side effect.
  - Method must return immediately (no DB call, no web service call).
  - Method if the member returns an array (cause pass by reference?).
  - Get should not return a reference to internal data structure.
- Semantically, properties are `attributes`, and methods are `behaviours` of the object.
- Think about properties like attributes. A car has many attributes. Color, MPG, Model, etc.. Not all properties can be set, some are calculated.
- Meanwhile, a Method is an action. `GetColor` should be a property. `GetFile()` should be a function. Another rule of thumb is, if it doesn't change the state of the object, then it should be a function. For example, `CalculatePiToNthDigit(n)` should be a function, because it's not actually changing the state of the Math object it's attached to.

# Difference between Constructor and ngOnInit
[Reference](https://stackoverflow.com/questions/35763730/difference-between-constructor-and-ngoninit)

- Mostly we use ngOnInit for all the initialization/declaration and avoid stuff to work in the constructor. The constructor should only be used to initialize class members but shouldn't do actual "work".
- So you should use `constructor()` to setup Dependency Injection and not much else. `ngOnInit()` is better place to "start" - it's where/when components' bindings are resolved.
- Angular Bootstrap consists of: constructing components tree and running change detection.
- The `@Input` communication mechanism is processed during change detection so you cannot expect to have the properties available in the constructor. It will be available on after ngOnInit.
- Angular will construct the tree of elements first before doing the change detection.

# Angular Performances Part 1 - First Load
[Reference](https://blog.ninja-squad.com/2018/09/06/angular-performances-part-1/)

- First load - when opening the app for the first time. Reload - coming back to the application. Runtime - what happens when the application is running.
- Tree-shaking - first, don't import modules that you don't use, use `providedIn` for the services. ***If you don't register in the providers, but use `providedIn: root` instead, if you never use the service, it will not end up in the bundle.***
- `UglifyJS` - the library that renames all variables, method names, class names to use one/two character name in the entire codebase.
- Compression - All modern browsers accept a compressed version to users - you can serve a compressed version to your users, and the browser will unzip before parsing it. Every server on the market has an option to activate the compression of assets. We use GZIP, but `Brotli` can also be used.
- Ahead of Time compilation:
  - In development mode, when opening the application in the browser, it will receive the JS code from TS compilation + the HTML templates of the components. This is not optimal in production because every user pays the cost of this template, and the Angular compiler must also be shipped to your users . JIT.
  - The problem is, the generated JS is generally FAR bigger than the uncompiled HTML templates, so the bundles tend to be bigger after AOT compilation.

# Angular Performances Part 2 - Reload
[Reference](https://blog.ninja-squad.com/2018/09/13/angular-performances-part-2/)

- Caching the assets of the application - by configuring your server and using `Cache-Control1` and `ETag` headers. To invalidate, then have a different type for each asset deployed.
- Service worker - Angular has `@angular/service-worker`.
- It can cache external resources, redirect routes, do dynamic content fetching (with different strategies possible) - always fetch for fresh data or always serve from cache? `ServiceWorkerModule` that you can use in your application to react to push events and notifications.

# Angular Performances Part 3 - Profiling and runtime performances
[Reference](https://blog.ninja-squad.com/2018/09/20/angular-performances-part-3/)

- `ng.profiler`: allows us to measure how long a change detection run in the current page took.
- `ng.getComponent` or `ng.probe` to get components.
- When you are in development mode (by default), Angular will run the change detection twice every time there is a change. This is a security to make sure you are not doing strange things, like updating data without following the one-way data flow. If you break the rules, Angular will warn you about it in development, by throwing an exception that will force you to fix your code. But if you are not careful, you will deploy the application in this mode, and change detection will still run twice, slowing your application.
  - To go in production mode, you need to call a function provided by Angular called `enableProdMode`. This method will disable the double check, and also make the generated DOM “lighter” (less attributes on the elements, attributes that are added to debug the application).
- `trackBy` in `ngFor` - help Angular track the objects, not by their references, but by something that will identify the object, typically an ID.

# Angular Performances Part 4 - Change detection strategies
[Reference](https://blog.ninja-squad.com/2018/09/27/angular-performances-part-4/)

- `OnPush` - Angular will only run the change detection if the `reference` of the pony input changes.
- Would rather create a new object instead of mutating references.
- `async` pipe will trigger change detection with `async` pipe if change detection is `OnPush`.
- `ChangeDetectorRef`:
  - `detach`: Make Angular not care about the component, and then use `detectChanges()` when you want the change detection to run.
  - You can do a `detectChanges()` to force a change detection. Alternatively, you can even update the DOM manually yourself, and not trigger a complete change detection.
  - Or you can run the code outside of Zone.js (`zone.runOutsideAngular(() => {})`.
  - `markForCheck`: can also manually trigger the change detection in an `OnPush` component.

# Angular Performances Part 5 - Pure pipes, attribute decorator and other tips
[Reference](https://blog.ninja-squad.com/2018/10/04/angular-performances-part-5/)

- Pure pipe:
  - A pure pipe is not called as often as a method in a component
  - But it doesn't run again if the input value is mutated, so use carefully.
- Attribute decorator?







