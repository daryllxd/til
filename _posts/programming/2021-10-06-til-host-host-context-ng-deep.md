---
layout: post
title:  "TIL, 2021-10-06, Angular Reading"
date:   2021-10-06 13:35:51 +0800
categories: programming
summary: "Angular host, host-context, ng-deep"
---

# Angular :host, :host-context, ::ng-deep - Angular View Encapsulation
[Reference](https://blog.angular-university.io/angular-host-context/)

- Default view encapsulation - `nghost` and `ngcontent` properties get applied.
- Upon application startup, each component will have a unique property attached to the host element.
- Each element inside each component template will also get applied a property that is unique to that particular component.
- When Angular sees that styles are associated with components, it will inject the styles into the page header, and those styles would be super-specific.
- Breaking style isolation:
  - `:host`: This is adding style on the component's custom HTML element itself, not something inside its template.
  - Even if you do something like `:host h2` (which sets styles in the component), you can't override the style of the h2 elements in components inside it.
  - To cascade to all child elements of a component, but not to any other element on the page, we can do it with `host` + `ng-deep`.
- `host-context`: Need to have a parent with that class that contains this component.

# Angular `ngClass` and `ngStyle`: The Complete Guide
[Reference](https://blog.angular-university.io/angular-ngclass-ngstyle/)

- `class.btn-primary` - to conditionally apply a CSS class.
- `ngClass` - can pass array, object, or a string.
- `ngStyle` - inline styles - these should rarely be needed.

# @use and @import rules in SCSS
[Reference](https://www.liquidlight.co.uk/blog/use-and-import-rules-in-scss/)

- Fundamentally, `@import` and `@use` do the same thing, but `@use` allows us to know where variables came from.
- `@forward` - gain access to members through another file.

```
//_box.scss

@use 'button';
@forward 'button'; // recreates the variable from _button.scss inside the current file

.boxButton {
    padding: button.$padding; // 1rem;
}
```
