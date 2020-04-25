---
layout: post
title:  "TIL, 2020-04-22"
date:   2020-04-22 16:10:13 +0800
categories: programming
summary: "Accessible SVGs"
---

# Accessible SVGs
[Reference](https://css-tricks.com/accessible-svgs/)

- &Does the graphic need alternative text? If the graphic is purely decorative, it does not need to have alternative text.
- `img` `src` attributes can be left empty and still validate.
- If the graphic has text around it that provides the alternative text, then it does not need additional `alt` text.
- For older versions of Safari or iOS, we'll need to add `role="img"`.
- Inline SVG
  - To add the (invisible) alternative text, add a `<title>A short title of the SVG</title>` - must be the first child of it's parent element.
  - This will be used as a tooltip as the pointing device moves over it.
- Not recommended to embed SVG via object or `iframe`.
- Icons
  - Decorative icons: `aria-hidden="true"`. They do not need alternative text and they should be hidden from the screen reader.
  - Linked icon, not paired with text: Need `aria-label`. `aria-label="See Picked Pens"`.
  - Linked icon, with static text: Use `aria-label` to provide descriptive, alternative text.
- Linked icon, with dynamic text: Ex: Shopping cart icon to indicate "8 items in the card".
  - Add additional span `class="offscreen-text"` that is visually hidden.
  - Add `aria-hidden="true" to the SVG.

``` html
<a href="http://example.com" id="cart">
  <span id="itemsInCart">0</span>
  <span class="offscreen-text">items in your shopping cart</span>
  <svg aria-hidden="true"> <--- Hidden in the screen reader
    <use xlink:href="#icon-cart"></use>
  </svg>
</a>
```

```
.offscreen-text{
  position: absolute!important;
  height: 1px;
  width: 1px;
  overflow: hidden;
  clip: rect(1px,1px,1px,1px);
  clip-path: polygon(0 0,0 0,0 0,0 0);
}
```

- Charts: Damn long
- SVGs and High Contrast Mode
  - This was made for people with low vision to help read content. When text and document body change, the images must change too.

```
@media screen and (-ms-high-contrast: active) {
  .icon svg {
    /* select a color that will contrast
       well on black or white because other
       color modes can be chosen and you
       need a color that will work with either
    */
    fill: green;
  }
}

/* black text on white background *.
@media screen and (-ms-high-contrast: black-on-white) {
   .icon svg {
     /* select a dark color that will
        contrast on black
        (#fff is too much contrast)
     */
    fill: #333;
  }
}

/* black text on white background */
@media screen and (-ms-high-contrast: white-on-black) {
 .icon svg {
    /* select a light color that will
       contrast on white
       (#000 is too much contrast)
    */
    fill: #efefef;
  }
}
```

# Dynamic Image Loading With Angular
[Reference](https://medium.com/allenhwkim/simple-lazy-loading-with-angular-716dd3b174a)

- ***There is no way not to load image as long as there are <img> tag in your html.*** This means you have to change html not to have image tags and change html dynamically to avoid initial image loading. However, changing html dynamically is not an easy task, and it requires a lot of scripting.
