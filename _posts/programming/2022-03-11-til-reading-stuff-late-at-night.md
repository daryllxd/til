---
layout: post
title:  "TIL, 2022-03-11, Reading stuff late at night"
date:   2022-03-11 17:59:47 +0800
categories: programming
summary: "Reading stuff late at night"
---

# The continual evolution of Airtable’s codebase: Migrating a million lines of code to TypeScript
[Reference](https://medium.com/airtable-eng/the-continual-evolution-of-airtables-codebase-migrating-a-million-lines-of-code-to-typescript-612c008baf5c)

- Node.js, Express, JS, Backbone, Express - aged well.
- Didn't age well - Backbone, Underscore, JQuery.
- Codebase:
  - 2012: First commit
  - 2015: Shared conventions
  - 2016: Browserify, explicit CommonJS imports added
  - 2018: Backbone style class to ES6 style class
  - 2019: Flow to Typescript
  - CommonJS imports replaced with ES6 imports
  - 2021: Replaced `createReactClass` and mixins with class React components
- Big bang migration:
  - `codemod` to perform purely mechanical transformations. Existing `codemods` for converting Flow to TS.
- `flow type-at-pos` to use Flow's inferred type for every unannotated function parameter.
- To review those changes, do a combination of:
  - Document the 14 automated transforms and 17 manual transforms and asked engineers to review that transformation.
  - Assigned chunks of up to 10 files to be code reviewed by experts.
  - Code reviewed the diff of compiled JS bundles before and after the change.

# Angular 2 — Improve Performance with `trackBy`

- Angular can track which things changed by `trackBy`. This takes the index and current item as arguments and needs to return the unique identifier for this item.
- This is not just important for performance reasons. Here are two cases where we require this feature for other reasons.
  - I’m rendering a list view where each item (a card) has data that gets updated periodically (through polling).
  - Selenium tests get stale element exceptions because the full component is re-rendered instead of just the changed parts
If you have a menu within one of the inner components (card), and it was open, when the component gets re-rendered, the menu will close because that was internal state of the card component that was re-rendered.
- Question - could we just use `trackBy` always, then?
  - My 2 cents - cause then it would lead to more "why didn't this re-draw, then" kind of questions rather than performance issues because of the redraw.

# Minor TIL

- You need to set a pipe as a `provider` in a module if it is going to be used as a service - [Reference](https://stackoverflow.com/questions/46299952/no-provider-for-custompipe-angular-4)

# Reading Svelte documentation and trying it out

- First impressions:
  - Shorthand attributes make sense.
  - Error messages help.
  - Style tags are scoped to the component.
- Rendering HTML directly: `@html`.

Imports

```
<script>
  import Nested from './Nested.svelte';
</script>
```
