---
layout: post
title:  "TIL, 2022-04-05, Design Systems and Component APIs"
date:   2022-04-05 11:10:20 +0800
categories: programming
summary: "Design Systems and Component APIs"
---

# Understanding Design Systems — Designing Component APIs
[Reference](https://javascript.plainenglish.io/design-systems-designing-component-apis-25dcf81d26f5)

- Components vs CSS only:
  - Design is kept consistent by only exposing the parts which are supposed to be customised.
  - Easier to read and maintain through the encapsulation of logic, styles, and markup inside components.
- Material design's button
  - Only label, icon, and type are customisable:

``` html
<mwc-button
  outlined
  label="My Button"
  icon="bookmark">
</mwc-button>
```

- Compare to:

``` html
<button class="mdc-button mdc-button--outlined">
  <!--  to avoid conflicting class names, they need to be very long and specific  -->
  <span class="mdc-button__ripple"></span>
  <!--  inner layers can manually duplicated, deleted or moved, even if it is unintended  -->
  <i
    class="material-icons mdc-button__icon"
    aria-hidden="true">
    bookmark
  </i>
  <span class="mdc-button__label">My Button</span>
</button>
```

- Why should designers care?
  - In some perspective, developers and designers are the first users of a Design System and their experience should be considered as well.
  - Why should designer care? So we reduce risk that they will implement their own solutions, and therefore increase productivity/enhance the consistency of the final product.
- Factors to consider
  - What can be isolated?
  - Which variations should be offered? - Customised through the user of properties which should be kept stable, avoiding unwanted variations and therefore enhancing design consistency.
- So, which styles should be customisable?
  - CSS variables for single CSS values.
  - Variables can be defined as a global theme and modified for a single component.
- How will the component evolve in the future?
  - `warning` variation of the dialog could be defined as a warning boolean prop, but if error or success use cases are expected, can be defined as a `type="warning"` string prop.
- Where can content be inserted?
  - Slots can define how the children elements will appear, but consumers will have full control over the style of the inserted elements, since they are not encapsulated.

```
<my-dialog>
  <!--  header slot  -->
  <my-tab slot="header" label="Details" active></my-tab>
  <my-tab slot="header" label="Metadata"></my-tab>
  <!--  functions slot  -->
  <my-icon slot="functions" icon="more_vert"></my-icon>
  <!--  unnamed slot (body)  -->
  <my-input label="Description"></my-input>
  <my-input label="Date (DD/MM/YYYY)"></my-input>
  <!--  footer slot  -->
  <my-button slot="footer" label="Cancel" type="outline"></my-button>
  <my-button slot="footer" label="Confirm"></my-button>
</my-dialog>
```

# The Ultimate Guide to Building a UI Component Library—Part 1: Creating a Plan
# The Ultimate Guide to Building a UI Component Library—Part 3: Building Robust Components [Reference](https://www.telerik.com/blogs/ultimate-guide-to-building-ui-component-library-part-3-components)

- Create a plan - plan a component library, including how to convince management and your co-workers that building a component library is a good idea.
  - Suggest to build an interface inventory of all the permutations of components that your company uses in a single document.
  - Users always say they prefer framework-specific components over framework-agnostic components.
- Third-party libraries
  - Lean towards libraries for complex components like calendar or data grid.
  - Wrap all third-party dependencies - you need to, otherwise if you swap libraries, it's bad.

# Component API Design
[Reference](https://alanbsmith.medium.com/component-api-design-3ff378458511)

- Make the right choices easy.
- May incorrect choices obvious.
- Provide helpful off-ramps.
- Documentation is great, but if users are constantly scouring the docs and source code to remember how to use shared components, that's an indication of inconsistent APIs.
- To make the APIs more intuitive:
  - Share APIS across common components via making it a prop: `<Accordion config={accordionConfig />`.
  - Children prop to render child components.
  - Discoverable via TS and IDE plugins provide helpful mechanisms that aid self-disclosure.
- Component docs.
  - Source code should be the last resort for discoverability.
  - Incorrect choices should be obvious.
- Edge cases:
  - Component can become rigid/brittle as they support more cases.
  - Components become more challenging to maintain and update.
  - Component APIs become more opaque to users.
- Composable.

# Case Study: Building a Component Library
[Reference](https://dev.to/kathryngrayson/case-study-building-a-component-library-e90)

- Tooling: React, Storybook (Info Addon, Viewport Addon, Story-Router).
- Interface inventory - look through what you've built so far. Writing docs.
- Installing the library in the application and replacing existing components.
- Making a component wish list.
- Atomic design:
  - `Button` becomes part of `Search Form`, `Subheader` becomes `Dashboard Tile`.
- Opportunistic maintenance - as you talk through the upcoming work, see what parts can be fit in.
- Things to know from when was starting:
  - Ex: Modal props.
  - Imperfect/unfinished components - it's an art studio, not an art museum.
  - Built-in accessibility at the component to "get it for free" in the application.
- Using 2 or more components together? Make a small app that just has the component library with you.

# Creating a React component library using Storybook
[Reference](https://medium.com/@BartWaardenburg/creating-a-react-component-library-using-storybook-e7c3fd105fd5)

- Tooling: Storybook, Rollup for package management, Lerna for everyone to start using them.
- Eslint, Prettier, Jest, Lint-staged, Babel.

