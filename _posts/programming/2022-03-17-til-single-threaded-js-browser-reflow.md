---
layout: post
title:  "TIL, 2022-03-17, Single Threaded JS, Browser Reflow"
date:   2022-03-17 09:57:18 +0800
categories: programming
summary: "Single Threaded JS, Browser Reflow"
---

# If Javascript Is Single Threaded, How Is It Asynchronous?
[Reference](https://dev.to/bbarbour/if-javascript-is-single-threaded-how-is-it-asynchronous-56gd)

- JS is single threaded - one call stack, one memory heap. So it executes code in order and must finish executing a piece of code before moving onto the next.
- Ex: `alert` means you can't interact with the webpage at all until you hit OK.
- Asynchronous - the JS engine has a Web API that handles these tasks in the background. Once those tasks are finished by the browser, they return and are pushed onto the stack as a callback.
- `setTimeout` isn't handled by JS and pushes it off to the Web API to be done asynchronously.

# What does it mean by Javascript is single threaded language
[Reference](https://medium.com/swlh/what-does-it-mean-by-javascript-is-single-threaded-language-f4130645d8a9)

- JS engine runs on a V8 engine that has a memory heap and a call stack.
- JS is single threaded which means only one statement is executed at a time.
- Async implementation: call stack, call back queue, web API and event loop.
- In JS, all instructions are put on a call stack. When the stack arrives at `setTimeout`, the engine sees it as a Web API instruction and pops it out and sends it to Web API.

# Asynchronous and Single-threaded JavaScript? Meet the Event Loop
[Reference](https://thecodest.co/blog/asynchronous-and-single-threaded-javascript-meet-the-event-loop/)

- JS is interpreted - it needs an interpreter which converts the JS code to machine code.
- Interpreters - V8 (Chrome), Quantum (Firefox), and Webkit (Safari).
- Each engine contains a memory heap, a call stack, even loop, callback queue, and a WebAPI with HTTP requests, timers, events, etc.
- Blocking call stack: `readFileSync`.
- JS engines can be non-blocking and behave as if it were multi-threaded. It means that it doesn't wait for the response of an API call, I/O events, etc. and can continue the code execution.
- `setTimeout` goes  to the `WebApi` queue.
- Event loop: How does the runtime know that the call stack is empty?

## Synchronous and Asynchronous in a Single and Multi-threaded Environment

- Synchronous with a single thread: Tasks are executed one after another. Each task waits for its previous task to get executed.
- Synchronous with multiple threads: Tasks are executed in different threads but wait for any other executing tasks on any other thread.
- Asynchronous with a single thread: Tasks start being executed without waiting for a different task to finish. At a given time, only a single task can be executed.
- Asynchronous with multiple threads: Tasks get executed in different threads without waiting for other tasks to be completed and finish their executions independently.

# Javascript is single-threaded? You’re kidding me!!!
[Reference](https://codeburst.io/is-javascript-single-threaded-youre-kidding-me-80b11d74f4e5)

- JS runtime is single-threaded.
- `setTimeout` is not a JS feature, it's provided by the browser. The browser controls the trigger and execution of the `setTimeout` method asynchronously.
- Web API - the suite of APIs that provide AJAX, cache, audio, geolocation, etc.
- Event loop:
  - Event table - maintains the triggers of the asynchronous calls against the reference for the callback methods.
  - Event queue - is a placeholder to temporarily keep the references of the callback method before it can be pushed into the JS runtime stack.

# Web APIs
[Reference](https://developer.chrome.com/docs/extensions/api_other/)

- Standard JS APIs - DOM APIs.
- XMLHttpRequest - request data from server.
- HTML APIs - audio, cache, canvas, geolocation, local storage, notifications, video, web database.

# Minimizing browser reflow
[Reference](https://developers.google.com/speed/docs/insights/browser-reflow)

- Reflow: the browser process for re-calculating the positions and geometries of elements in the document, for the purpose of re-rendering part or all of the document.
- Actions that can trigger a reflow:
  - Resizing browser window.
  - JS methods involving computed styles.
  - Adding/removing elements from the DOM.
  - Changing element's classes.
- Minimising reflow:
  - Reduce unnecessary DOM depth. Changes at one level in the DOM tree can cause changes at every level of the tree, all the way up to the root.
  - Minimise CSS rules.
  - If you make complex rendering changes such as animations, do so out of the flow. Use position-absolute or position-fixed to accomplish this.
  - Avoid unnecessary complex CSS selectors which require more CPU power to do selector mapping.

# Animations
[Reference](https://developers.google.com/web/fundamentals/design-and-ux/animations)

- Changing the `box-shadow` of an element requires a much more expensive paint operation than changing its text color.
- Changing the width of an element in likely to be more expensive than changing `transform`.
- `will-change` [Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/will-change) - hints to browsers how an element is expected to change. Browsers may set up optimisations before an element is actually changed. Try not to use it as much as possible.
- Performance
  - CSS-based animations, and Web Animations where supported natively, are typically handled on a thread known as the "compositor thread". This is different from the browser's "main thread", where styling, layout, painting, and JavaScript are executed. This means that if the browser is running some expensive tasks on the main thread, these animations can keep going without being interrupted.
- If any animation triggers paint, layout, or both, the "main thread" will be required to do work. This is true for both CSS- and JavaScript-based animations, and the overhead of layout or paint will likely dwarf any work associated with CSS or JavaScript execution, rendering the question moot.
- To check: [Reference](https://csstriggers.com/)


## CSS Versus JavaScript Animations

- CSS for one-shot transitions.
  - For smaller, self-contained states.
- JS for advanced effects.
  - If you need control for this.
  - `requestAnimationFrame` if you want to orchestrate an entire scene by hand.
- Use Web Animations API or the framework.
- CSS animation using `transform` and `transition`.
  - Classes toggled via JS `classList`.
- JS Web Animations API - written inline like:

```
var target = document.querySelector('.box');
var player = target.animate([
  {transform: 'translate(0)'},
  {transform: 'translate(100px, 100px)'}
], 500);
player.addEventListener('finish', function() {
  target.style.transform = 'translate(100px, 100px)';
});
```
