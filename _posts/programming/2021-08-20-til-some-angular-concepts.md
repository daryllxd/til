---
layout: post
title:  "TIL, 2021-08-20, Some Angular Concepts"
date:   2021-08-20 11:59:31 +0800
categories: programming
summary: "Some Angular Concepts"
---

# `NgIf` You Want To Learn Angular
[Reference](https://medium.com/slalom-build/ngif-you-want-to-learn-angular-d694f29598de)

- App Module - declare and bootstrap the app component and import everything that needs to be available app-wide like the `Router` and the `Store`.
- Shared Module - No providers in the Shared module, if the provider is used in a lazy loaded module, then the child injector will create a new instance of the provider instead of using the app-wide singleton that Angular injected into one of the eagerly loaded components which breaks the singleton pattern for services.
- Core Module - Use providers here so we have singleton services?
- Lifecycle hooks:
  - `ngOnInit` - perform initialisation - set up subscriptions, private variables to manage local state. Initialisation logic that relies on inputs being set must be defined in the `ngOnInit` hook.
  - When reacting to route changes, subscribing to the route change observable in the constructor might be required because the events can be missed if subscribing in the `ngOnInit`.
  - `ngOnDestroy` - Usually to unsubscribe from any observables so memory leaks are avoided.
  - `ngOnChanges`: *Will be run before ngOnInit*. Can add conditionals so that it only fires when specific inputs are updated.
- Templates
  - Try to not call functions in the template, as it will be reevaluated every change detection cycle.
  - To fix, move the formatting function to a pure pipe, do the formatting before displaying on the template.
- Pipes: Pure pipes will only be executed when it detects a pure change to the input value.
