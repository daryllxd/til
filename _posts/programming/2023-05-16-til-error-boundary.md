---
layout: post
title:  "TIL, 2023-05-16"
date:   2023-05-16 10:58:32 +0800
categories: programming
summary: "Error Boundary"
---

# React error handling with react-error-boundary
[Reference](https://blog.logrocket.com/react-error-handling-react-error-boundary/#react-error-boundary)

- Error boundaries catch errors that occur in a lifecycle method, render method, and inside hooks like `useEffect`.
- EB does not handle errors in:
  - Event handlers
  - Asynchronous code
  - Server-side rendering
  - Errors thrown in the EB itself
- Component should have:
  - `getDerivedStateFromError`, used to update the EB state
  - `componentDidCatch`, lifecycle method for performing operations when our EB catch an error, such as logging to an error logging service
  - `render` method to render the fallback UI in case of an error.

```
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    // Update state so the next render will show the fallback UI.
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    // You can also log the error to an error reporting service
    logErrorToMyService(error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      // You can render any custom fallback UI
      return <h1>Something went wrong.</h1>;
    }

    return this.props.children;
  }
}
```

- Basic case:

```
function App(){
  ...
  return (
    <ErrorBoundary
          FallbackComponent={OurFallbackComponent}
        >
          <ComponentThatMightThrowAnError/>
    </ErrorBoundary>
  );
}

const OurFallbackComponent = ({ error, componentStack, resetErrorBoundary }) => {
  return (
    <div>
      <h1>An error occurred: {error.message}</h1>
      <button onClick={resetErrorBoundary}>Try again</button>
    </div>
  );
};
```

- `useErrorHandler` hook: We can pass in the error object to catch errors during API requests, etc.
- Can also use `withErrorBoundary` higher-order component to manage problems with components.

# Using custom events in React
[Reference](https://blog.logrocket.com/using-custom-events-react/)

- If you'd like to communicate to another component when a dialog component has been closed, the best way to achieve that would be through a custom event.
- We can create custom events using the `Event` constructor.

```
//First, we initialize our event
const event = new CustomEvent('onDialogClose', {detail: "Main Dialog"});

// Next, we dispatch the event.
elem.dispatchEvent(event);
```

# Rethinking React best practices
[Reference](https://frontendmastery.com/posts/rethinking-react-best-practices/)

- Being fast - reducing the amount of code that needs to load and run on end-user devices. Only download and run what is necessary.
- SSR - the trick to show at least something initially while the JS loads, instead of a blank white screen.
  - Cost of SSR: Increased time to interactive (TTI).
- Streaming for dynamic pages - start fetching on the server as early as possible, and get the browser to start downloading assets at the same time.
- Streaming:
  - For HTTP/2, HTTP streams are used, and for HTTP/1, `Transfer-Encoding: chunked` mechanism is used which enables sending data in smaller, separate chunks.
  - The body property of the response is a readable stream that allows the client to receive data chunk by chunk as they become available from the server.
- Data fetching:
  - When "everything is a component", those nodes often have multiple responsibilities, like initiating fetches, managing loading states, responding to events, and rendering.
  - "Render then fetch" means loading spinners alongside layout shifts.
  - **What is ideal is to fetch data and code in parallel, without having to traverse the tree top to bottom every time.**

## Relay

- Component have data dependencies co-located. **Main difference from React Query is that components don't initiate fetches.**
- Tree traversal occurs during build time.

- Nested routes - enables frameworks to identify the data and component code needed for a particular URL in advance.
  - Separate error boundaries for independent sub-routes.
- `Suspense` - allow a sub-tree to fall back to displaying a loading UI when data is unavailable, and resume rendering when it's ready.

## React Server Components (RSC) in Next

```
// Example of similar pattern in a server component
export default async function Product({ id }) {
  // non critical - start fetching but don't block
  const productReviewsPromise = fetchReview(id)
  // critical - block rendering with await
  const product = await fetchProduct(id)
  return (
    <>
      <ProductView product={product}>
      <Suspense fallback={<LoadingSkeleton />}>
        {/* Unwrap promise inside with use() hook */}
        <ReviewsView data={productReviewsPromise} />
      </Suspense>
    </>
  )
}
```

- Fetch data on the server as early as possible, with loaders close to the data source.
- RSC - introduce the server as a first-class citizen, rather than an after-the-fact optimisation.
- Client components can render server components (?).

# How to handle errors in React: full guide
[Reference](https://www.developerway.com/posts/how-to-handle-errors-in-react)

## Problems with simple try/catch

- If you wrap `useEffect` with try/catch, it just won't work, because `useEffect` is called asynchronously after render. The try catch needs to be inside the `useEffect` hook.
- `try/catch` won't be able to catch anything inside children components.

```
const Component = () => {
  try {
    return <Child />
  } catch(e) {
    // still useless for catching errors inside Child component, won't be triggered
  }
}
```

- This is not rendering the component, it's just a component's definition. Only after `try/catch` is it actually rendered.

## Simplest `react-error-boundary` component:

```
const Component = () => {
  return (
    <ErrorBoundary>
      <SomeChildComponent />
      <AnotherChildComponent />
    </ErrorBoundary>
  )
}

class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    // initialize the error state
    this.state = { hasError: false };
  }

  // if an error happened, set the state to true
  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  render() {
    // if error happened, return a fallback component
    if (this.state.hasError) {
      return this.props.fallback;
    }

    return this.props.children;
  }
}
```

- Limitations:
  - Only catches errors that happen during the React lifecycle.
  - **Things that happen outside, like resolved promises, async code, various callbacks, will disappear.**

```
useEffect(() => {
  // this one will be caught by ErrorBoundary component
  throw new Error('Destroy everything!');
}, [])

const onClick = () => {
  // this error will just disappear into the void
  throw new Error('Hulk smash!');
}

useEffect(() => {
  // if this one fails, the error will also disappear
  fetch('/bla')
}, [])
```

## async errors with `ErrorBoundary`?

- [Reference](https://github.com/facebook/react/issues/14981)
- You have to make `ErrorBoundary` catch async errors, just need to do `try/catch` and then re-throw them back into the React lifecycle.
