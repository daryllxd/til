---
layout: post
title:  "TIL, 2023-02-14, Themer, More Radix Select, Tailwind"
date:   2023-02-14 11:54:18 +0800
categories: programming
summary: "Themer"
---

- Color library - [Reference](https://github.com/Qix-/color)
  - Setting CSS variable to be darker/lighter from another CSS variable - just declare a new CSS variable.
  - "Forcing a redraw"
- ReactJS re-render is not applied on CSS: [Reference](https://stackoverflow.com/questions/60339095/reactjs-re-render-is-not-applied-on-css)
  - ReactJS: only changed objects in the DOM are updated.
    - This modularity gives you all kinds of speed, simplicity and abstractness advantages - even if your site contains thousands of components.
    - If you want to other boxes to be rerendered, you need to somehow change them. Otherwise ReactJS will not understand that the other boxes need to be rerendered. The simplest way to achieve this is to use the key property.

```
document.documentElement.style.setProperty(
  `--color-${category}-900`,
  Color(newHexValue).darken(0.6)
);
```

- Get the computed style:

```
const backgroundColorInRgb = window
  .getComputedStyle(inputRef.current)
  .getPropertyValue('background-color')
```

- Can do this: `const inputRef = useRef<HTMLDivElement>(null);` as the typing for `useRef`.
- If modifying Tailwind config, easier to do it in a normal component first so can do console logs to debug.
- `Providers.tsx` is fine if you have a lot of providers like react-query, theming, etc.
- Radix popover fix: Use position popper. [Reference](https://www.radix-ui.com/docs/primitives/components/select#content)
- Styling Radix using Tailwind and data-attributes: [Reference](https://tailwindcss.com/docs/hover-focus-and-other-states#data-attributes)
