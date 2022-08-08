---
layout: post
title:  "TIL, 2022-08-05, JS runtime, tasks"
date:   2022-08-05 14:43:03 +0800
categories: programming
summary: "JS runtime, tasks"
---

# Be proactive when you join an Angular project
[Reference](https://timdeschryver.dev/blog/be-proactive-when-you-join-an-angular-project#git-hooks)

- Detect/remove "unused objects" - via `ts-prune`.


- Husky - how not to run hooks.

# What is Javascript runtime?
[Reference](https://stackoverflow.com/questions/30838412/what-is-javascript-runtime)

- Where the JS code is executed. So JS is executed on `Chrome`/`V8` or `Mozilla`/`Spidermonkey`.
- Chrome compiles the JS code to native machine code instead of interpreting bytecode which gives a major performance boost to JS.
- Node.js contains `libuv` to handle asynchronous events - V8 provides the run-time for JS.
- Google's V8:
  - An engine for processing JS in the browser and is used by Google Chrome.

# What is the JavaScript runtime?
[Reference](https://dev.to/snickdx/what-is-the-javascript-runtime-4n09)

- Runtime: The environment in which a programming language executes - storing functions, variables, and managing memory by using data structures such as queues, heaps, and stacks.
- ***By design, JS interpreter is single-threaded. But it executes tasks in a concurrent fashion - it can break up tasks so quickly that they appear to progress at the same time.***
- Scheduling mech to know which task's turn is next: the queue and event loop.
- When is a function going to be executed?
  - Normal function call - straight to call stack.
  - Web APIs like `setTimeout` - goes to task queue then onto the call stack.
  - Promise resolve - goes into the microtask queue and then onto the call stack.
- Event loop: Moves tasks and microtask from their respective queue onto the call stack.
- Different operations in JS are executed with different priority levels.
- Because fetch is `async`, then whatever is inside a `then` will always execute **after**.

```
fetch('https://data.org/users')
   .then(function(response){
      myresponse = response; //executes 2nd
    });

handleResponse(myresponse); //executes 1st, does not get the response
```

# Tasks, Microtasks, queues and schedules
[Reference](https://jakearchibald.com/2015/tasks-microtasks-queues-and-schedules/)

```
console.log('script start');

setTimeout(function () {
  console.log('setTimeout');
}, 0);

Promise.resolve()
  .then(function () {
    console.log('promise1');
  })
  .then(function () {
    console.log('promise2');
  });

console.log('script end');
```

- Correct answer: Start, end, 1, 2, timeout. Why?
- Each thread gets its own event loop, so each web worker gets its own, so it can execute independently.
- Browser picks which task to take from at the start of the loop.
- Tasks are scheduled so the browser can get its stuff from JS/DOM land and ensure that these actions happen sequentially. Ex: mouse click, parsing HTML, `setTimeout`.
- Microtask: Used for things that should happen straight after the currently executing script, such as reacting to a batch of actions, or to make something async
  - *The microtask queue is processed after callbacks as long as no other JS is mid-execution, and at the end of each task. Any additional micro-tasks queued during the micro-tasks are added to the end of the queue and are also processed.*
  - Flush non-task non-micro-task, then do micro-task, then do task.

```
// Let's get hold of those elements
var outer = document.querySelector('.outer');
var inner = document.querySelector('.inner');

// Let's listen for attribute changes on the
// outer element
new MutationObserver(function () {
  console.log('mutate');
}).observe(outer, {
  attributes: true,
});

// Here's a click listener…
function onClick() {
  console.log('click');

  setTimeout(function () {
    console.log('timeout');
  }, 0);

  Promise.resolve().then(function () {
    console.log('promise');
  });

  outer.setAttribute('data-random', Math.random());
}

// …which we'll attach to both elements
inner.addEventListener('click', onClick);
outer.addEventListener('click', onClick);
```

```
click
promise
mutate
click
promise
mutate
timeout
timeout
```

- Click is a task, mutation observer is microtask, setTimeout is a ask.
- The event will bubble up after `mutate` happens, this is why the outer click event logs first before timeout.
