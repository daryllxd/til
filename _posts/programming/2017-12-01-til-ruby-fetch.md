---
layout: post
title:  "TIL, 2017-12-01"
date:   2017-12-01 01:26:40 +0800
categories: programming
---

## Cons to using `fetch(:thingie)` vs `[:thingie]`?
[Reference](https://www.reddit.com/r/ruby/comments/7gky22/cons_to_using_fetchthingie_vs_thingie/)

- If you use `fetch`, use the block form, not the default value form, because the block runs only when the key is missing, whereas the default value runs every time.
- `fetch` if you want to produce an error if no key, or you want to specify a default value.
- The problem with `a['key']` is that you are assuming that `a` is always a hash. Strings also have the method `[]` but doesn't have the method `fetch` so you can find errors easier.
- `fetch`: Easier to debug `KeyNotFound` rather than letting a nil string trickle into your code and have to debug whatever that happens to cause.
- You can also use `Hash#dig` and `Array#dig` over fetch.
