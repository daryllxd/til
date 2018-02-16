---
layout: post
title:  "TIL, 2018-02-16, Bootstrap 4"
date:   2018-02-16 02:55:18 +0800
categories: programming
summary: "Where I try out Bootstrap 4."
---

## Musings

- Just code. You need to ship anyway to show stuff, you can refactor later. FOOWM. Focus on what matters.
- Remember again: `strip`, not `trim`.
- The struggle is real re: freaking Webpacker.
  - [Reference for Bootstrap + Webpacker.](https://gist.github.com/yalab/cad361056bae02a5f45d1ace7f1d86ef)
  - So do we just use `javascript_pack_tag` now?
  - Bootstrap will allow `$`, but you need to do the `environment.plugins.set` (which I adding the `$` to the global namespace) so it's usable in `application.js`.
- `$ yarn remove bulma` to remove unused packages with Yarn.
- `Bootswatch`, sad life. I think I'll just get a premium Theme.
- The Bootstrap guys have their own themes, apparently! Each costs $99, though.
- I sometimes find it weird/really tedious that I'm still using [Reference](https://html2slim.herokuapp.com/) to convert HTML to Slim, but I haven't researched any alternatives yet.
- `.sass` and `.scss` are also both Sass, just different syntaxes?
- On bugs re: Bootstrap. Uh sometimes I just didn't see that the thing was already applied! Sheesh.

