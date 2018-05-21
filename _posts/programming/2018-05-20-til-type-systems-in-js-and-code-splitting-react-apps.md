---
layout: post
title:  "TIL, 2018-05-20, Type Systems in JS and Code Splitting React Apps"
date:   2018-05-20 02:25:31 +0800
categories: programming
summary: "Marathon watching conf talks."
---

- `Pomodoro.first(5)` and `Pomodoro.last(5)` becomes an Array, not an AR::Relation.
- Weird bug on `eager_load`. Fix: [Reference](https://github.com/rails/rails/issues/32356)

- [Preload, Eager load, Includes and Joins](https://blog.bigbinary.com/2013/07/01/preload-vs-eager-load-vs-joins-vs-includes.html)
  - `User.preload(:posts).to_a`: Loads the data in a separate query.

# Jared Forsyth - Type Systems Will Make You a Better JavaScript Developer - React Conf 2017
[Reference](https://www.youtube.com/watch?v=V1po0BT7kac)

- Type systems: Linter, run-time type checking,
- PropTypes: Not too much extra code, and free documentation, but only works at Runtime, and only works for React components.
- Static type check via TypeScript and Flow. Runs ahead of time, not much boilerplate, applies to all functions/variables, free documentation.
- Reactions to Flow
  - It finds bugs
  - Editor integration
  - Feel much safe making changes as a team
  - Code is self-documenting
  - New syntax
- Clever code: If you write "clever code", it's hard to debug this.
  - Ex: Ternaries.
  - Ex: Different signature based on the number of arguments.
  - If it's hard for Flow to check, it's often hard to understand.
- Implicit invariant: if you find yourself throwing errors, you have to check the invariant.
- State machines: Example, "loading" but you don't have the thing yet. In Swift/Flow, you can do a state representation via a Javascript object. Illegal states won't typecheck.
- Types First Approach: If you have any complex data types, write down the types before you start coding.

# Neehar Venugopal - A Beginner's Guide to Code Splitting Your React App - React Conf 2017
[Reference](https://www.youtube.com/watch?v=bb6RCrDaxhw)

- Ex: When you ship, you ship it into `bundle.js`. Why not have a `vendor.js` and `app.js`? Send two files down.
- Long term caching: hash in the file name, cache in CDN or browser, max-age infinity.
- How? Now we have built-in modules and built-in async modules.
- Webpack async is available now?
- Lazy load component.
- Patterns
  - HOC
  - Cache resolved modules in the store
  - Cache resolved modules as a static
  - Wrappers lazy load children in parallel
- Route level splitting
  - Almost always the best place to start
- Mobile?
  - Always load mobile then replace with desktop. Lazy load the shit.
- Carousel on mobile = CSS is okay. Carousel on web = needs JS/potentially touch.
- Server-side rendering: Must be in sync.
- `import()` is always async.
