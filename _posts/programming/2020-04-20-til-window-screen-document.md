---
layout: post
title:  "TIL, 2020-04-20"
date:   2020-04-20 12:32:41 +0800
categories: programming
summary: "Window, screen, and document"
---

# What is the difference between window, screen, and document in Javascript?
[Reference](https://stackoverflow.com/questions/9895202/what-is-the-difference-between-window-screen-and-document-in-javascript)

- `Window` is the main JS object root, and can also be treated as the root of the DOM.
- `window.screen` or just `screen` is a small information object about physical screen dimensions. The physical display's full screen.
- `window.document` or `document` is the main object of the visible document object/model/DOM.
- Each browser tab has its own top-level `window` object, and each `iframe` has its own `window` too, nested within a parent window. `window.window` always refers to `window`, but `window.parent` and `window.top` might refer to enclosing windows. `window` also has:
  - `setTimeout` and `setInterval`, binding event handlers to a timer.
  - `location` giving the current URL.
  - `history` with `back()` and `forward()`.
  - `navigator` describing the browser software
- `document`: Each `window` has a `document` object to be rendered. Then you can access stuff with `document.body.something`.
- The `document` is your document that gets loaded into the browser.
