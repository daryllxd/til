---
layout: post
title:  "TIL, 2018-04-02, More React: Getting state from JSON, Web Font loader."
date:   2018-04-02 16:18:52 +0800
categories: programming
summary: "More create-react-app things for Writing Prompts (it's actually usable now!) and creating a Chef cookbook."
---

# Musings, Chef/Reliably Deploying Rails apps

- WTF DOES OHAI do?
- Fixing chef problems: update the thing.
- `berks update postgresql`
- `berks vendor`: If you remove a cookbook, rerunning this doesn't remove the stuff in the `berks-cookbooks`.

# Musings, React:

- [Callback function for `setState`: `this.setState({writingPrompts:  writing_prompts}, this.sample);`](https://stackoverflow.com/questions/37401635/react-js-wait-for-setstate-to-finish-before-triggering-a-function)
- `create-react-app` has a JSON loader, so you can do this: `import { writing_prompts } from '.././data.json';` to destructively import `writing_prompts` from the inside of whatever hash was in `data.json`.
- [JSON loader doesn't load files if it's in array, make sure it has a key.](https://stackoverflow.com/a/42032709/848915)
- This thing is cool: `let filteredArray = arr.filter(e => e!== randomElement);`, re: sampling out an element. At least now I'm able to do a filter functionally. I do think this is inefficient though, I can probably just do a slice somewhere.
- [Web Font loader.](https://scotch.io/@micwanyoike/how-to-add-fonts-to-a-react-project)
  - We use this, instead of adding a `link href` in the `index.html`, to speed up page rendering. The page will render, but wait for the components to get loaded.

``` js
$ npm install webfontloader --save

import WebFont from 'webfontloader';

WebFont.load({
  google: {
    families: ['Titillium Web:300,400,700', 'sans-serif']
  }
});
```

- [Web performance/render blocking CSS.](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/render-blocking-css)
  - Usually, rendering is blocked until CSS is available, because without CSS, the page will be relatively unusable. This leads to a "flash of unstyled content".
  - CSS's media types and media queries allow us to address these use cases:
    - `<link href="print.css" rel="stylesheet" media="print">` and `<link href="other.css" rel="stylesheet" media="(min-width: 40em)">`
  - Make sure to keep your CSS lean, deliver it as quickly as possible, and use media types and queries to unblock rendering.
  - Media types and media queries allow us to mark some CSS resources as non-render blocking.
  - The browser downloads all CSS resources, regardless of blocking or non-blocking behavior.
- CSS things!
  - `:root`
  - CSS variables and  inheritance.
  - Extracted Li

# Musings, Back-end

- [DNS Resolver performance explained](https://medium.com/@nykolas.z/dns-resolvers-performance-compared-cloudflare-x-google-x-quad9-x-opendns-149e803734e5)
  - CloudFlare was the fastest DNS for 72% of the locations.
- You can make multiple directories at the same time via `mkdir dir1 dir2`?
- `tree` OMG I forgot about this.
