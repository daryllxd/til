---
layout: post
title:  "TIL, 2018-04-30, React hydrate and studying patterns gem."
date:   2018-04-30 17:04:04 +0800
categories: programming
summary: "Window, Dataset, Ruby `update_columns`"
---

# Musings, JS/React

- [What's the difference between hydrate() and render() in React 16?](https://stackoverflow.com/questions/46516395/whats-the-difference-between-hydrate-and-render-in-react-16)If you call `hydrate()` on a node that already has this server-rendered markup, React will preserve it and only attach event handlers, allowing you to have a very performant first-load experience.
- [Window](https://developer.mozilla.org/en-US/docs/Web/API/Window), [The window object:](https://www.afterhoursprogramming.com/tutorial/javascript/window-object/)
  - ***`window` represents a window containing a DOM document. `document` points to the DOM document loaded in that window.***
  - You can do `window.scrollTo({ top: 100, behavior: 'smooth'})` if you really wanted to do some scrolling from Inspect Element.
  - Relative: `window.scrollBy()`, `window.scrollByLines()`, and `window.scrollByPages()`.
  - The primary object of a browser, so you don't do `window.alert()`, you just do `alert()`.
  - You can use it to get information re: the user's window.
- [HTML Dataset](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dataset)
  - Allows to read/write custom `data-*` attributes on the element.
  - The `dataset` property can be read, but not written, you write on the properties/attributes inside.

``` js
<div id="user" data-id="1234567890" data-user="johndoe" data-date-of-birth>John Doe</div>

let el = document.querySelector('#user');

// el.id == 'user'
// el.dataset.id === '1234567890'
// el.dataset.user === 'johndoe'
// el.dataset.dateOfBirth === ''
```

- [Splitting big components:](https://medium.com/dailyjs/techniques-for-decomposing-react-components-e8a1081ef5da)
  - Split the `render()` method: `const PanelHeader`, `const PanelBody`.
  - Pass React elements as props: For comments, one component to serve as a template, and one component to figure out what to fill `metadata` and possible actions (like, reply, and delete)
  - Higher-order components. Ex: Add analytics to a specific component.
- Moment: 16kb, but really at lot more convenient than manually manipulating dates.

# Hydration
[Reference](https://medium.com/@baphemot/understanding-reactjs-data-hydration-initialization-bacbb790c7cb)

- Hydration: to get some information from outside sources.
- A: API call/AJAX via Axios or Fetch. Pro: secure, con: additional HTTP request.
- B: Pass data via window object.
- Pass data via attribute on parent node.

# ReactDOM

- This can be used at the top level of you app and as an escape hatch to get outside the React model if you need to.

# Functional Stateless Components in React
[Reference](https://javascriptplayground.com/functional-stateless-components-react/)

- Destructuring in functional stateless components:
  - `const Username = ({ username }) => <p>The logged in user is: {username}</p>;`
- Simplicity: You know that an FSC is just props in, rendered UI out. For a class component, you still have to scan through to see what lifecycle methods it is using.
- FSCs offer visual cues that a component is just taking some props and rendering output. If you have a class component, you have to read through the code to see if it deals with state.
- The less stateful component your app has, the better. They are easier to test and you can pass them as props and assert on their output.
- Because it's hard to convert an FSC to a stateful component, you come to appreciate it because it makes you think about if you want to add state to a component.
- Easy to create styling.

# Musings, Ruby

- `update_columns` vs `update_attributes`: `update_columns`, because it skips callbacks, is faster than `update_attributes` by 50%, but you can `update_attributes` with multiple columns and that would sort of be the same as updating with one column (it makes sense, since both just do an UPDATE statement under the hood anyway).
- `jeweler` and `juwelier` gem exist for creating Ruby gems.
- [Studying this gem, and specifically the Query pattern, things I found:](https://github.com/Selleo/pattern/blob/master/lib/patterns/query.rb)
  - `def self.call(*args); new(*args).call; end` pattern to do class method as instance method, I've also implemented this in the past, but you have to remember the splat because of `nil` errors.
  - `tap` is used to modify an object
