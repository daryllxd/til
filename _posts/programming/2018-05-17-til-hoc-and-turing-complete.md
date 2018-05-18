---
layout: post
title:  "TIL, 2018-05-17, HOC, Turing complete."
date:   2018-05-17 20:24:58 +0800
categories: programming
summary: "Axios error handling, Serverspec"
---

# Musings, JS

- [Axios Network Error](https://github.com/axios/axios/issues/383)

``` js
if (!error.status) {
  toast.error('Network problem.')
  return Promise.reject(error);
}
```

- JavaScript `apply`: Similar to Ruby's `send`. Ruby then can use the splat operator to turn the arguments into an array.
- [Javascript `call()` & `apply()` vs `bind()`?](https://stackoverflow.com/questions/15455009/javascript-call-apply-vs-bind)
  - `call` and `apply` call a function while `bind` creates a function. Though with `call()` you pass arguments individually, and with `apply()`, you pass them as an argument array.
  - Use `bind()` when you want that function to later be called with a certain context, useful in events. Use `call()` or `apply()` when you want to invoke the function immediately, and modify the context.

- [Can I use a higher order component to add an onClick to my component without adding a wrapper DOM element?](https://stackoverflow.com/questions/49385060/can-i-use-a-higher-order-component-to-add-an-onclick-to-my-component-without-add). Uh, apparently no? You still have to pass the prop to the wrapped component.

# What is Turing Complete?
[Reference](https://stackoverflow.com/questions/7284/what-is-turing-complete)

- A TC system means a system in which a program can be written that will find an answer (no guarantees regarding runtime or memory).
- A TC language is one that can perform any computation. The Church-Turing thesis states that any performable computation can be done by a Turing machine (a machine with infinite RAM and a finite 'program' that dictates when it should read, write, and move across that memory.

# JavaScript Is Turing Complete— Explained
[Reference](https://medium.freecodecamp.org/javascript-is-turing-complete-explained-41a34287d263)

- In computability theory, a system of data-manipulation rules is said to be Turing complete or computationally universal it it can be used to simulate any single-taped Turing machine.
- Calculator: not a Turing machine, because it can only perform a small, pre-defined subset of calculations.
- PowerPoint: A Turing machine (you can use auto-shapes and the click thing).

- Serverspec is a thing?
