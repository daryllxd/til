---
layout: post
title:  "TIL, 2022-06-22, Compound Components"
date:   2022-06-22 17:34:21 +0800
categories: programming
summary: "Compound Components, Pure and Impure Pipes"
---

# The essential difference between pure and impure pipes in Angular and why that matters
[Reference](https://medium.com/angular-in-depth/the-essential-difference-between-pure-and-impure-pipes-and-why-that-matters-999818aa068)

- Since the pipe is pure it means that there’s no internal state and the pipe can be shared.
- **How can Angular leverage that? Even though there are two usages in the template Angular can create only one pipe instance which can be shared between the usages.**
- If the pipe is impure, Angular will create two instances of the pipe, each with its own state.
- If a pipe is pure, we know that its output is strictly determined by the input parameters, and Angular will call `transform` only when the input parameters change.
- If a pipe is impure and has internal state, the same parameters do not guarantee the same output.

# How pure and impure pipes work in Angular Ivy
[Reference](https://indepth.dev/posts/1447/how-pure-and-impure-pipes-work-in-angular-ivy)

- In Ivy, every pipe has its own instance. In View Engine, pure pipe has a shared instance.
- In a component which uses default CD strategy, when CD happens, if the pipe is impure, then the transform method will be called. If the pipe is pure, if there are changes in input parameters, then the transform method will be called. Otherwise, the pipe will return the cached value from the last transform call.
- When using the impure pipe, you should use it together with `OnPush` change detection to avoid unnecessary calls to `transform` on every change detection.

- Angular - you need to import `RouterModule` to use `routerLink` in the **template** of a component in that module.
- Routerlink interpolation is done with the variables being an array.

# Compound Components In React
[Reference](https://www.smashingmagazine.com/2021/08/compound-components-react/)

- **Compound components can be said to be a pattern that encloses the state and the behavior of a group of components but still gives the rendering control of its variable parts back to the external user.**
- Compound components deal with state.
- This avoids prop drilling (which is an issue because when the parent component re-renders, the child components will also re-render and cause a domino effect on the component.

Ex:

```
function Example() {
  return (
    <Menu>
      <MenuButton>Actions</MenuButton>
      <MenuList>
        <MenuItem>Download</MenuItem>
        <MenuLink to="view">View</MenuLink>
      </MenuList>
    </Menu>
  );
}
```

- Pros:
  - Separation of concerns - UI state logic and communicating that internally to all the child components makes for a clear division of responsibility.
  - Reduced complexity. Child props go to their respective child components.
- Cons:
  - Only direct children of the parent component have access to the props, so we can't wrap the components in another component.
