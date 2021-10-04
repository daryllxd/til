---
layout: post
title:  "TIL, 2021-10-01, CSS in JS"
date:   2021-10-01 01:09:22 +0800
categories: programming
summary: "CSS in JS"
---

# A Thorough Analysis of CSS-in-JS
[Reference](https://css-tricks.com/a-thorough-analysis-of-css-in-js/)

- All CSS-in-JS libraries generate unique CSS class names, a technique pioneered by CSS modules.
- All styles are scoped to their respective component, providing encapsulation without affecting any styling defined outside the component.
- Vendor prefixing: CSS-in-JS libraries also provide this feature out-of-the-box.
- No inline styles? Using `style` attribute as the means of styling elements is generally not recommended. Better to add class than to do a `style=...` inline. They are less performant than class names.
- Full CSS support:
  - Pseudo-classes and elements, media queries, keyframe animations.
- React-specific or framework-agnostic?
- Single-file components?
- Using a `Styled />` component to return a new component, having a class name already applied that we can render like any other component in our application.
- `style`-injected DOM styles
  - Injecting styles into the DOM at runtime, using either one or more `<style> tags`, or using the `insertRule` API.
  - Inlining during SSR provides increase in page loading performance metrics such as First Contentful Paint, because rendering is not blocked by fetching a separate `css` file from the server.
  - Dynamic styling.
- Static CSS file extraction
  - Instead of injecting the styles in the DOM, they generate static CSS files.
  - Atomic CSS - like Tailwind - moving code from CSS to HTML.

# Atomic CSS-in-JS
[Reference](https://sebastienlorber.com/atomic-css-in-js)


# Tailwind [Reference](https://adamwathan.me/css-utility-classes-and-separation-of-concerns/) [Reference](https://news.ycombinator.com/item?id=25332101)

- `CSSStyleSheet.insertRule()` [Reference](https://developer.mozilla.org/en-US/docs/Web/API/CSSStyleSheet/insertRule): This inserts a new CSS rule into the current style sheet, with some restrictions.

- Barrel imports?
- Typescript strict mode pros and cons?

To read:

[Reference](https://johnpapa.net/angular-9-lazy-loading-components/)
[Reference](https://jaredgorski.org/writing/14-practical-frontend-architecture/)
