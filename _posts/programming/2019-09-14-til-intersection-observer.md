---
layout: post
title:  "TIL, 2019-09-14, Intersection Observer, Infinite Scroll, Angular Ivy"
date:   2019-09-14 23:03:02 +0800
categories: programming
summary: "Intersection Observer and Infinite Scroll, Angular Ivy"
---

- [Reference](https://medium.com/@nikjohn/cast-to-number-in-javascript-using-the-unary-operator-f4ca67c792ce) Unary operator in JS: `(+)` Operator
- This converts operand to number type.
- Other ways to cast to Number in Javascript: `Number()`, `parseInt()`, `parseFloat()`, `~~`, `>>>0`

```
+false  // 0
+‘123’  // 123
+0xBABE // 47806 (Hexadecimal)
+null   // 0
+function(val) {return val } // NaN
```

- Virtual scrolling:
  - Altering anything in the DOM is very slow compared to other operations you can do in the browser, because when we add/remove/update something in the DOM, the browser will have to recalculate the layout, re-render, so all in all, it's just slow.
  - Showing a long list not only means many elements in the DOM, but scrolling causes layout recalculation and rendering quite often.
  - How to avoid adding too many elements to the DOM?
  - As a user can only see a limited amount of rows in a list, why not just add those elements visible to the DOM right now in the viewport.
  - When scrolling down, add the remaining rows of the list only when they become visible. When the DOM gets quite big after scrolling, remove rows when they scroll away from the viewport.
  - Can add additional rows before and after the viewport, so when the user scrolls, the browser has time to render the new rows to show.

# Intersection Observer API
[Reference](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API)

- This is an API that allows us to asynchronously observe changes in the intersection of a target element with an ancestor element or with a top-level document's viewport.
- Applications:
  - Lazy-loading of images or other content as a page is scrolled.
  - Implementing "infinite scrolling" web sites, where more and more content is loaded and rendered as you scroll, so that the user doesn't have to flip through pages.
  - Reporting of visibility of advertisements to calculate ad revenues.
  - Deciding whether to perform tasks or animation processes based on whether or not the use will see the result.
- ***The Intersection Observer API lets code register a callback function that is executed whenever an element they wish to monitor enters or exits another element (or the viewport), or when the amount by which the two intersect changes by a requested amount. This way, sites no longer need to do anything on the main thread to watch for this kind of element intersection, and the browser is free to optimize the management of intersections as it sees fit.***
- The degree of intersection between the target element and its root is the intersection ratio. This is a representation of the percentage of the target element which is visible as a value between 0.0 and 1.0.

# Build an Infinite Scroll Component in Angular
[Reference](https://netbasal.com/build-an-infinite-scroll-component-in-angular-a9c16907a94d)

- Get current element of a component: `this.host.nativeElement;`
- Strategy is inside the infinite scroll component inside, you create an `ng-content` with an empty `<div #anchor>` inside to serve as the target element that we watch.
- Checking the element's visibility status: look at the `isIntersection` property.
- Checking if something is scrollable:

```
  private isHostScrollable() {
    const style = window.getComputedStyle(this.element);

    return style.getPropertyValue('overflow') === 'auto' ||
      style.getPropertyValue('overflow-y') === 'scroll';
  }
```

- Because `overflow: auto` + `overflow-y: scroll` is the combination to cause the scrollbars to appear.
- To support IE, you can load a polyfill.

# Keyed collections
[Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Keyed_collections)

- `Map` object: a simple key/value map that can iterate its elements in insertion order.
-

# Little Blah
[Reference](https://littleblah.com/post/2019-09-01-senior-engineer-checklist/)

- Understand business aspect of the work.
- Get involved with hiring for your team/company, and maintain a high bar for hiring quality candidates.
- Design and develop systems appropriate to scale, extensibility, and scope of the problem, and avoids over-engineering.
- Question everything and ask why until you get to the root of problems and situations.
- Demand accountability and ownership from others.
- Lead at least one high-impact project with a clear definition and target of successful delivery.
- Work towards disambiguating ambiguous problem statements.
- Cultivate relationships with other teams and develop trust.
- Listen to others and accept that there is more than one way to look at a problem statement, and multiple valid solutions to a problem.
- Be involved with multiple projects as a consultant, a reviewer, and/or a mentor.
- Follow the principles of extreme ownership.
- Have strong mentors to help you navigate and grow in the company.
- Take projects with high risk and high rewards.
- Strive for deep technical expertise in technologies used in your team.
- Ask for stretch projects from your manager, or help her identify one for you.
- Discuss the goals of your manager, and how you align your work with it.
- Network with seniors, peers, and juniors.
- Be a mentor to a couple of junior engineers.
- Increase your breadth of knowledge in the domain of your team/company.
- Drive your one-on-ones. Maintain a list of topics for the next one-on-one discussion.
- Discuss problems with your manager, but have some solutions beforehand.
- Increase your breadth of knowledge in technology.
- Explore emerging tech by building small prototypes.
- Read a few technical books per year.
- Understand pros and cons thoroughly of new technologies.
- Schedule a regular one-on-one with your manager.
- Actively seek feedback from your manager.
- Keep your manager up-to-date in things you are involved with, but don't get bogged down in unnecessary detail.
- Keep your manager up-to-date on people you have difficulty working with.
- Give constructive feedback to your manager.
- Talk to your manager about your expectations.
- Measure what you want to improve, make your efforts measurable.
- Maintain high visibility projects which have a high risk.
- To deal with difficult folks, discuss with your managers and mentors.
- Be reachable to other engineers.
- Have a huge bias for action and delivery but do not over-compromise on quality. Push back if required.
- Simplify code, systems, and architectures relentlessly.
- Demand high-quality work from others, but be pragmatic.
- Prioritise fixing tech debt in code when the incremental cost to develop keeps rising.
- Document extensively ("why" more than "how").
- Respect code and systems that come before you. There are reasons for every code and every guard that exists in production.

# Practical Ways to Write Better JavaScript
[Reference](https://stackoverflow.blog/2019/09/12/practical-ways-to-write-better-javascript/)

- TS: This makes refactoring larger applications possible.
  - *Most of the pain of refactoring JS is due to the fact that it doesn't enforce function signatures.*
  - When TS is setup correctly, it will be difficult to write code without first defining your interface and classes. This provides a way to share concise, communicative architecture proposals.
  - I believe forcing developers to define interfaces and APIs first results in better code.
- Use modern features:
  - `async` and `await`: this is functionally equivalent to `Promise`.
  - `let` and `const` and `arrow` or anonymous functions.
  - Spread operator, template literals/interpolating, object destructuring.

```
function animalParty({ dog, cat }) {} // Can destructure in method signature

const myDict = {
  dog: 'woof',
  cat: 'meow',
};
```

- Assume your system is distributed.
  - JS is single threaded, but not single-file. Even though it isn't parallel, it's still concurrent.
  - JS solves HTTP blockage with the event loop. The event loop loops through registered events and executes them based on internal scheduling/prioritisation logic.
  - JS for loops should only be used if absolutely necessary. Otherwise, use `map`, `map` with index, `for-each`.
  - Map can be run concurrently.
- Lint your code and enforce a style. As they are opinionated, take it with a grain of salt.
- Test your code:
  - Test driver: Jest, Mocha, Jasmine, Ava.
  - Spies and stubs: Sinon.
  - Mocks: Nock.
  - Web automation: Selenium, Cypress, PhantomJS.

# What is Angular Ivy?
[Reference](https://blog.ninja-squad.com/2019/05/07/what-is-angular-ivy/)

- In Angular, when you write a component, you write the component in TS and its template in HTML, augmented by Angular template syntax. *This HTML will never touch the browser. It will be compiled by Angular into JS instructions, to create the appropriate DOM when the component appears on the page, and to update the component when its state changes.*
- Think about this as the React Fiber rewrite, which offered a more incremental rendering.
  - Better build times
  - Better build sizes/compatible with tree-shaking
  - Metaprogramming/higher order components, lazy loading of components instead of modules, a new change detection system not based on zone.js.
- Ideally, this should just be a switch to turn on for most projects.
- Angular pre-Ivy generates an `ng_factory`, a function defining a view definition with two parts: A static description of the DOM to generate, and a function called when the state of the component changed.
- Angular post-Ivy inlines the generated code in a static field. A `@Directive` decorator becomes a field called `ngDirectiveDef`, same with Injectable and Component.
- When we use an app with an Ivy-ready library, then we don't need to recompile the components of the library.
- Tree-shakeable: If you don't use a particular feature of Angular, the instructions corresponding to that feature won't be in your final bundle.
- Angular compiler option: `fullTemplateTypeCheck`.
- It is also backward-compatible with non-Ivy updated libraries. Angular built a compatibility compiler: takes the `node_modules` of our app, looks for Angular libraries and converts the JS code in those libraries to be Ivy-compatible.
