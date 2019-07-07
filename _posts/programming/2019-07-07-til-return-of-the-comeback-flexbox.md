---
layout: post
title:  "TIL, 2019-07-07, Return of the Comeback: Flexbox"
date:   2019-07-07 11:33:00 +0800
categories: programming
summary: "Revisiting if I really know flexbox"
---

# Return of Flexbox Froggy

- `flex-wrap` is the wrapping for flex.
- `flex-flow` is the shorthand for `flex-direction` and `flex-wrap`.
- `align-items`: How the items are aligned as a whole in the container.
- `align-content`: Determines the spacing between lines.

- To ensure wrapping for one line, CSS solution:

```
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
```

## Fluke out

- Sibling selector: `bento ~ pickle`
- Direct descendant: `plate > apple`
- Only child: `plate apple:only-child`, `plate pickle:only-child`
- Start from the back: `bento:nth-last-child(2)`
- Empty selector: Those who have no elements inside of them.
- Not selector: `apple:not('.small')`.
- `[attribute*="value"]` selector exists.

# Web Components

- They aren't supported by most browsers yet, so it's nice to check out but I don't want to learn them yet.
