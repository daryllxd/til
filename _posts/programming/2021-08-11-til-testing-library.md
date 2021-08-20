---
layout: post
title:  "TIL, 2021-08-11"
date:   2021-08-11 13:06:38 +0800
categories: programming
summary: "Where I..."
---

# Testing Library

- Mainly for querying the DOM for nodes in a way that's similar to how the user finds elements on the page.
- Guiding principles
  - If it relates to rendering components, then it should deal with DOM nodes rather than component instances, and it should not encourage dealing with component instances.
  - It should be generally useful for testing the application components in the way the user would use it.
  - Should be simple and flexible.


# Testing Implementation Details
[Reference](https://kentcdodds.com/blog/testing-implementation-details)

- Why it is bad?
  - Can break when you refactor - False negatives.
  - May not fail when you break application code. False positives.
- Tests which test implementation details can give you a false negative when you refactor your code, which leads to brittle and frustrating tests.
- Implementation detail-free testing:

```
// __tests__/accordion.rtl.js
import '@testing-library/jest-dom/extend-expect'
import * as React from 'react'
import {render, screen} from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import Accordion from '../accordion'
test('can open accordion items to see the contents', () => {
  const hats = {title: 'Favorite Hats', contents: 'Fedoras are classy'}
  const footware = {
    title: 'Favorite Footware',
    contents: 'Flipflops are the best',
  }
  render(<Accordion items={[hats, footware]} />)
  expect(screen.getByText(hats.contents)).toBeInTheDocument()
  expect(screen.queryByText(footware.contents)).not.toBeInTheDocument()
  userEvent.click(screen.getByText(footware.title))
  expect(screen.getByText(footware.contents)).toBeInTheDocument()
  expect(screen.queryByText(hats.contents)).not.toBeInTheDocument()
})
```

- React Testing Library: We give it our own React element, then we interact with the rendered output by querying the output for the contents that will be displayed to the user (or ensuring that it won't be displayed) and clicking the buttons that are rendered.
- Make it such that the users of the component are end-users and developers, not specs.

# Why I Never Use Shallow Rendering
[Reference](https://kentcdodds.com/blog/why-i-never-use-shallow-rendering)

- With shallow rendering, I can refactor my component's implementation and my tests break. With shallow rendering, I can break my application and my tests say everything's still working.
- Problem with calling methods in the components:
  - Test can still work if typo happened in the view part of the code.
  - Refactor can break spec despite it just being a refactor.
  - *If your test uses instance() or state(), you're testing things your user couldn't know about or even care about.*
- Testing composed components introduces new dependencies that might trigger an error while the unit itself might still work as intended.. But isn't the point of testing to be confident the application works? Who cares if your unit works if the app is broken? I definitely want to know if the third party component I'm using breaks my use case. I mean, I'm not going to rewrite their entire test base, but if I can easily test my use case by not mocking out their component then why not do that and get the extra confidence?

# Angular testing: When to use shallow rendering?
[Reference](https://www.piotrl.net/angular-shallow-tests/)

- Shallow testing: `NO_ERRORS_SCHEMA`.
- When not to use: Smaller components, `ViewChild` missing, and will miss regressions like `@Input` name changes.
- Angular vs React: Either all children components compiled or all are ignored.

# Component testing scenarios
[Reference](https://angular.io/guide/testing-components-scenarios#nested-component-tests)

- `TestBed.createComponent` does not bind data. Binding happens when Angular performs change detection, and in production, CD kicks in when Angular creates a component or the user enters a keystroke or async activity completes.
- `ComponentFixtureAutoDetect` - `{ provide: ComponentFixtureAutoDetect, useValue: true }`. Responds to asynchronous activities such as promise resolution,  timers, and DOM events.
- `dispatchEvent`: It won't read that property until you raise the element's input event by calling `dispatchEvent`.

```
// simulate user entering a new name into the input box
nameInput.value = 'quick BROWN  fOx';

// Dispatch a DOM event so that Angular learns of input value change.
// In older browsers, such as IE, you might need a CustomEvent instead. See
// https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent/CustomEvent#Polyfill
nameInput.dispatchEvent(new Event('input'));

// Tell Angular to update the display binding through the title pipe
fixture.detectChanges();
```

- Service injection: `TestBed.inject`.
- Async test with `fakeAsync()`.
  - XHR Call need `waitForAsync`.
  - `tick()` advances the virtual clock.
  - `RxJS` scheduler: Can with `setTimeout` and `setInterval`, but need to import Zone.JS plugin.
  - Supports `setTimeout, setInterval`, `requestAnimationFrame`.
