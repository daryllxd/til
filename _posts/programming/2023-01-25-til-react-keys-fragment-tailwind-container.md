---
layout: post
title:  "TIL, 2023-01-25, React keys, fragment, Tailwind container"
date:   2023-01-25 15:51:49 +0800
categories: programming
summary: "React keys, fragment, Tailwind container"
---

# Learnings

- Customising container width in Tailwind [Reference](https://stefvanlooveren.me/blog/custom-container-width-tailwind-css)
- Creating unique keys for React elements [Reference](https://blog.devgenius.io/the-quicky-lazy-but-effective-way-to-create-unique-keys-for-react-elements-e45d574028a3) - Can use `uuidv4` library to add keys for "adding things".
  - UUID will make the keys unique but not stable. This may cause issues with lists that are sortable because each item will receive a new key value when the component rerenders.
  - It may also cause issues with form inputs losing focus when rerendering as well.
  - It goes against React's best-practices, but using the index is the most stable option - e.g key={`item-${index}`}. **This is perfectly acceptable for lists that will never update such as from sorting. For cases of sortable lists or tables, using a database ID is a better route since it will never change.**

```
alias p=pnpm
alias pdx=pnpm dlx // download bin package and execute, same as npx
alias px=pnpm exec // execute bin package local
alias pi=pnpm install
```


# How to use CSS variables with React
[Reference](https://atomizedobjects.com/blog/react/how-to-use-css-variables-with-react/)

- Inline

```
export default function Box({ children }) {
  return (
    <div style={{ backgroundColor: "var(--primary-color)" }}>{children}</div>
  );
}
```

- Toggling themes

```
/* light-theme.css */
#example-app.light {
  --primary-color: #fff;
  --color: #000;
}
```

# Everything you need to know about React Keys
[Reference](https://atomizedobjects.com/blog/react/everything-you-need-to-know-about-react-keys/)

- If you don't use React keys, then React will reconcile things via index. So whenever you do re-ordering, additions, or deletions, the new size will change the keys of each item in the array to different indexes which can lead to strange edge cases.
- Use React keys all the time. They do not need to be globally unique, they just need to be unique within that array and should not be the index of the array.

# React Fragment - Everything you need to know
[Reference](https://atomizedobjects.com/blog/react/react-fragment/)

- React fragments fix "Must have one parent element" but not adding a div for that.
- You might only need the longhand version when rendering from lists, to pass keys.

# Advanced React Optimization Techniques for Senior Engineers
[Reference](https://asimzaidi.medium.com/advanced-react-optimization-techniques-for-senior-engineers-dafd2cac7883)

- Event emitter - send data from one component to another without having to pass the data through component hierarchy.
- Memoization - Cache the results of a function.
- Virtualisation - Only render things on the screen.
- `IndexedDB` - browser-based database.
- Stream data - stream data rather than loading it all at once.
- Lazy loading.
- React suspense.
- Concurrent rendering.

# Different ways to loop through arrays and objects in React
[Reference](https://medium.com/how-to-react/different-ways-to-loop-through-arrays-and-objects-in-react-39bcd870ccf)

- `map` - `{this.state.data.map(d => (<li key={d.id}>{d.name}</li>))}`
- JS for loop. (eww?)
- JS for each loop.
- `Object.keys` and `Object.entries`.

# Creating A Design System Using Radix
[Reference](https://blog.openreplay.com/creating-a-design-system-with-radix/)

- Component library
  - Component name - UI component name.
  - Description
  - Attributes
  - States
  - Code snippets
