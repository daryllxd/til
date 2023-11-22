---
layout: post
title:  "TIL, 2023-11-21"
date:   2023-11-21 10:57:02 +0800
categories: programming
summary: "useState"
---

# `useState()` Hook in React - A Complete Guide
[Reference](https://hygraph.com/blog/usestate-react)

```
class App extends component {
    constructor(props) {
        super(props);
        this.state = { count: 0 };s
    }

    incrementCount = () => {
        this.setState({ count: this.state.count + 1 });
    };

    render() {
        return (
            <div>
                <p>{this.state.count}</p>
                <button type="button" onClick={this.incrementCount}>
                    Increment Count
                </button>
            </div>
        );
    }
```

- With `useState`:

```
import React, { useState } from 'react';

const App = () => {
    const [count, setCount] = useState(0);

    const incrementCount = () => {
        setCount(count + 1);
    };

    return (
        <div>
            <p>{count}</p>
            <button type="button" onClick={incrementCount}>
                Increment Count
            </button>
        </div>
    );
```

- Can destructure like so:

```
const [{name, age, hobby}, setUserDetails] = useState({
    name: 'John Doe',
    age: 20,
    hobby: 'Reading',
});
```

- Initializing state as a function - create it outside the component.

## Important things to know

- Only use `useState` hooks at the top level of your component, so React will call the hooks in the same order each time a component re-renders.
- Only call `useState` inside a functional component.

# useState in React: A complete guide
[Reference](https://blog.logrocket.com/guide-usestate-react/)

- State in a class component is limited to being an object.
- Never directly modify an object, always do `setState`.
- Using a function can lazily initialize the variable.
- React uses `Object.is` for comparing two objects.
- To React, a mutation is the same object - for a re-render to occur, we must create a new object.
- `useState` does not merge update objects, it replaces them.
- Updating state in a nested object:
  - `Object.assign` and the spread syntax creates a shallow copy, instead of a deep copy.
- Multiple state variables or one state object?
  - In some cases, **cloning deeply nested objects can be expensive because React may re-render parts of your applications that depend on fields that haven't changed.**
  - Consider splitting the state into multiple state variables based on which values tend to change together.

## Rules for hooks

- Don't call in a class component.
- Don't call in a regular JS function.
- Don't wrap `useState` in a conditional statement.

## `useState` vs `useEffect`

- `useState` is used for managing state that needs to be updated and re-rendered based on user interactions or other events in the component. On the other hand, `useEffect` is used to manage side effects that need to run after every render of the component or perform any cleanup when the component unmounts.


# Why can't hooks be called conditionally
[Reference](https://www.reddit.com/r/reactjs/comments/g0wyst/why_cant_hooks_be_called_conditionally/)

- React keeps track of stuff in between renders.
- React uses hook order execution to function correctly, and that approach full breaks when doing this.
- You can move the hook one level down to the child component normally if you are doing a conditional hook.
- Behind the scenes, each component holds an array of its own hooks.
- Behind the scene `useState`

# When not to use the `useMemo` React Hook
[Reference](https://blog.logrocket.com/when-not-to-use-usememo-react-hook/)

- `useMemo` - calculate the value of a variable or function once and reuse it across multiple renders, rather than recalculating it every time your component re-renders.

## When not to use:

- If operation is `unexpensive`, or the resolved value is a primitive, then the reference never changes, and the component won't be re-rendered.
- Default state:

# Lazy Loading
[Reference](https://nextjs.org/docs/app/building-your-application/optimizing/lazy-loading)


# Lazy loading React components
[Reference](https://blog.logrocket.com/lazy-loading-components-in-react-16-6-6cea535c0b52/)

- `React.lazy` - a function that enables you to render a dynamic import as a regular component.
- `React.Suspense` - enables you to specify the loading indicator.
- Code-splitting is the process of dividing a large bundle of code into multiple bundles that can be loaded dynamically.
- Dynamic import - it knows to dynamically create a separate bundle for different library.

```
const OtherComponent = React.lazy(() => import('./OtherComponent'))

const MyComponent = () => (
  <OtherComponent)
)
```

- React.Suspense - a component for wrapping lazy components, takes a `fallback` prop that accepts the React elements you want rendered as placeholder  content while all the lazy components get loaded.
- React.lazy and Suspense are not yet available for server-side rendering.
