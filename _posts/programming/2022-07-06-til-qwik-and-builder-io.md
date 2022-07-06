---
layout: post
title:  "TIL, 2022-07-06, Qwik and Builder IO"
date:   2022-07-06 08:35:40 +0800
categories: programming
summary: "Qwik and Builder IO"
---

# A first look at Qwik - the HTML first framework
[Reference](https://dev.to/builderio/a-first-look-at-qwik-the-html-first-framework-af)

- The visual editor will generate the same sites in different technologies - everything from Angular to Web components and every framework in between.
- Product is focused on eCommerce, which needs ***a very fast site***. Those sites cannot get fast PageSpeed insights unless they serve only static HTML.
- Goal: Delay JS as much as possible to take advantage of the browser's lazy loading capabilities.
  - Other frameworks think server-side rendering and time-to-interactive as an afterthought.
  - Other frameworks have a ton of crap before time-to-interactive is in mind.
- Quick resumability - the qwikloader will take the static HTML generated from SSR and resume it.

# Don't blame the developer for what the frameworks did!
[Reference](https://www.builder.io/blog/dont-blame-the-developer-for-what-the-frameworks-did)

- History of bundling - concatenating all the JS code -> Bundlers via Webpack etc. -> Lazy loading to support bigger bundle sizes. The new company thinks FE can be better.
- Framework can only lazily load components not in the render tree. There is no quick (or friendly) way to lazily load the components that are on the page itself.
- Ideal "next framework":
  - Change the frameworks so they don’t eagerly load the render tree on hydration
  - Allow the component render function to be loaded independently from the component event handlers. (I.e. if you are loading "HelloComponent" with onClick method “world”, you shouldn’t load the “world” function code until you actually clicked it (quite ambitious)
- Entry points
  - More entry points (smaller chunks) is better than few entry points (big index.ts files - this is a big problem in RD already since it has big SharedModule and big MaterialModule, big all modules. The team is trying to break them apart.
