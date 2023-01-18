---
layout: post
title:  "TIL, 2023-01-17, Bundle size, Context vs Redux"
date:   2023-01-17 10:16:53 +0800
categories: programming
summary: "Bundle size, Context vs Redux"
---

# Readings

- Analyzing bundle size: [Reference](https://stackoverflow.com/questions/58410608/how-to-analyze-next-js-bundle-size-and-content)

# Blogged Answers: Why React Context is Not a "State Management" Tool (and Why It Doesn't Replace Redux)
[Reference](https://blog.isquaredsoftware.com/2021/01/context-redux-differences/)

- When should I use Context?
  - Any time you have a value you want to make accessible to a portion of your React component tree, without passing that value down as props through each level of components.
- Context/`useReducer`?
  - If you have some complex state management needs within a specific section of your application.
- When should I sue Redux?
  - Large amounts of app state needed in many places in the app.
  - App state is updated frequently over time.
  - The logic to update that state may be complex.
  - App has a medium or large-sized codebase, and might be worked on by many people.
  - Capability to manage side effects, persistence, and data serialisation.
- React Context
  - More of passing/sharing values, not managing values.
- To use React Context
  - `const MyContext = React.createContext()`.
  - Parent component - `<MyContext.Provider value={someValue}>`. This puts some single piece of data into the context.
  - In a component nested inside that provider, call `const contextValue = useContext(MyContext)`.
  - Whenever the parent component re-renders and passes in a new reference, any component that reads from that context will be forced to re-render.
- Use case of context:
  - Rather than pass the value down as a prop, just do `useContext` to grab the value as needed.
- Redux
  - Redux uses Context internally.
- Reasons to use Redux:
  - Wanting to write state management logic separate from the UI layer
  - Sharing state management between different UI layers
  - Redux middleware to add additional logic when actions are dispatched
  - Able to persist portions of the Redux state
  - Faster debugging of logic/UI
- Why Context is not "State Management"
  - State management can store, read, and update a value. `useState` is an example of this.
  - Context can't update the state.

## Context vs Redux

- Context:
  - Does not store or manage anything
  - Only works in React components
  - Passes down a single value
  - Shows current value but not how the value changed over time
  - Updates consuming components when the context value changes
  - No mechanism for side effects, purely for rendering components
- React/Redux
  - Stores/manages a single value
  - Update the value via dispatching action
  - Middleware to trigger side effects

## Context + `useReducer`

- Context + `useReducer` relies on passing the  current state value via Context. React-Redux passes the current Redux store instance via Context.
- So when `useReducer` produces a new state value, **all component that are subscribed** to that context will be forced to re-render, even if they only care about part of the data.
- `useReducer` does not have middleware - you can't do side effect things.
- My personal opinion is that if you get past 2-3 state-related contexts in an application, you're re-inventing a weaker version of React-Redux and should just switch to using Redux.

# `getStaticProps` vs `getServerSideProps` for Next JS
[Reference](https://www.ohmycrawl.com/getstaticprops-vs-getserversideprops/)

- `getStaticProps` - A method that tells he Next component to populate props and render into a static HTML page at build time.
  - Blog post - boost rendering static HTML page at build time.
- `getServerSideProps` - A method that tells the Next component to populate the props and render into a static HTML page at run time.
  - Dynamic data - render your page at run time.

```
export async function getStaticProps(context) {
  return {
    props: {}, // will be passed to the page component as props
  }
}
```

- `getStaticProps` tells React to render the component at build time, and it populates the data object and sends it to the component as a prop.
  - **`getStaticProps`** should load fast on the client and can be cached using a CDN provider.
  - `getServerSideProps` isn't as optimal as SSG, but it offers SEO metrics and is a scalable page that is reliant on data.

# `getServerSideProps`
[Reference](https://nextjs.org/docs/basic-features/data-fetching/get-server-side-props)

- **Note that irrespective of rendering type, any props will be passed to the page component and can be viewed on the client-side in the initial HTML. This is to allow the page to be hydrated correctly. Make sure that you don't pass any sensitive information that shouldn't be available on the client in props.**
- When you request this page directly,

# Modal Components in React Using Custom Hooks
[Reference](https://upmostly.com/tutorials/modal-components-react-custom-hooks)

- Good modal component:
  - Append modals to the end of the DOM body property, for accessibility reasons.
  - Wait to mount modals to the DOM until they are shown.
  - Remove modals from the DOM when they are hidden.
  - Not manipulate the DOM directly.
