---
layout: post
title:  "TIL, 2022-06-15, Initial/Inherit in CSS?"
date:   2022-06-15 15:34:43 +0800
categories: programming
summary: "Initial/Inherit in CSS"
---

- [Reference](https://stackoverflow.com/questions/41336663/console-logresult-returns-object-object-how-do-i-get-result-name)
  - `JSON.stringify` would be the fastest way to get the results of some JSON in a copy-paste compatible way.

# Understanding the “Initial”, “Inherit” and “Unset” CSS Keywords
[Reference](https://elad.medium.com/understanding-the-initial-inherit-and-unset-css-keywords-2d70b7121695)

- Every property has an initial value. Like `line-height` will have `normal`.
- Each User-Agent has a browser style. This is why font-size might be different in other browsers for H1. By itself, HTML elements do not have initial style values.
- `inherit` - tells the browser to search for the closest parent element's value and let the current element inherit that value.
- `initial` - Use the default value of the given property.
  - For a `div`, `display: initial` actually means it becomes an `inline` rather than a `block` - this is cause `block` is from the user agent.
- `unset`:
  - Inherited properties - example of this is `color`: `color` cascades down. An `unset` on the child would set
    - `inherit` - same.
    - `unset` - same.
  - Non-inherited properties - `border` does not cascade down.
    - `inherit`- set to whatever is the closest.
    - `unset` - remove style.
- So it really doesn't remove a cascaded rule :(
