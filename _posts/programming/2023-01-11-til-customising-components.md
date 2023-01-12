---
layout: post
title:  "TIL, 2023-01-11"
date:   2023-01-11 12:05:17 +0800
categories: programming
summary: "Customising and wrapping components"
---

# Learnings

```
import Link from 'next/link';
import clsx from 'clsx'

export const EvLink = (props: any) => {
  const className = clsx(
    props.className, 'text-slate-100, hover:text-slate-300'
  );

  return (
    <Link {...props} className={className}></Link>
  );
}
```

- [Reference](https://bobbyhadz.com/blog/react-component-is-missing-display-name) - results from `forwardRef`.

# Understanding the Difference Between Named and Default Exports in React
[Reference](https://betterprogramming.pub/understanding-the-difference-between-named-and-default-exports-in-react-2d253ca9fc22)

```
- Named exports
  - export function MyComponent() {}
  - Imported like:
    - import { MyComponent } from "./my-component"
  - Allows multiple exports per file.
    - import { MyComponent1, MyComponent2, MyComponent3 } from "./my-components"
  - Can be a barrel export.
- Default exports
  - export default MyComponent
  - Imported like:
    - import MyComponent from "./my-component"
  - And now you can give it any name you want:
    - import WhateverNameIsBest from "./my-component"
  - Can do it if the exported component is only going to be imported once, or if a file exports one thing.
```

# Stop Using “&&” for Conditional Rendering in React Without Thinking
[Reference](https://medium.com/geekculture/stop-using-for-conditional-rendering-in-react-a0f7b96200f8)

- Classic conditional rendering:

```
function MyComponent({ condition }) {
  return (
    <div>
      <h1>Title</h1>
      {condition && <ConditionalComponent />}
    </div>
  );
}
```

- If `condition` is not evaluate to a boolean, it can cause trouble:
  - If `0`, then `0` is displayed in the UI.
  - If `undefined`, `Nothing was returned from render. This usually means a return statement is missing. Or, to render nothing, return null."`
- You can use the ternary operator:
  - `condition ? <ConditionalComponent /> : null or <></>`
  - `!!condition && <Component/≥` can also work.

# React Query
[Reference](https://react-query-v3.tanstack.com/overview)
