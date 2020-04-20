---
layout: post
title:  "TIL, 2020-04-17"
date:   2020-04-17 10:39:24 +0800
categories: programming
summary: "Destructuring Tips"
---

# Musings

- Detecting if "scrolled down" : Done by storing `scrollTop` and comparing with the current `scrollTop` value with it.
- However, this doesn't work on Safari, so: `Math.max(window.pageYOffset, document.documentElement.scrollTop, document.body.scrollTop) (https://github.com/nuxt/nuxt.js/issues/2512#issuecomment-358215583).

# 5 JavaScript Object Destructuring Tricks
[Reference](https://hashrocket.com/blog/posts/5-javascript-object-destructuring-tricks#trick-1)

- Remove an item from an object: `const { thingToRemove, ...rest } = data;`. You get `rest` now.
- To rename while destructuring: `const { x: xCoord, y: yCoord } = data.coordinates;`. Now you have `xCoord` and `yCoord`.
- Nested destructuring. You can also combine it with the rename.

```
// const data = { coordinates: { x: 5, y: 6 }};

const { coordinates: { x, y }} = data;

console.log(x, y); // 5, 6
```

- Destructuring in Function Arguments:

```
const myFunction = ({ coordinates: { x: xCoord, y: yCoord } }) => {
  console.log('Coords:', xCoord, yCoord);
};
```

- Non-default Imports As Named Object: Instead of

```
import {
  rootPath,
  blogPath,
  aboutUsPath,
  teamPath,
  pricingPath,
  contactPath,
  signInPath,
  signOutPath,
} from '../routes';
```

We can do

```
import { * as routes } from '../routes';

console.log(routes.rootPath); // '/'
console.log(routes.blogPath); // '/blog'
```

- Downside is, the compiler won't be able to inform you if you are referencing an undefined import.
