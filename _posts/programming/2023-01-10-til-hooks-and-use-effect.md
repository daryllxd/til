---
layout: post
title:  "TIL, 2023-01-10, Hooks and useEffect"
date:   2023-01-10 10:29:02 +0800
categories: programming
summary: "React hooks, useEffect"
---

# Learnings

- You need this when doing imports etc.

```
"baseUrl": ".",
"paths": {
  "@/components/*": ["components/*"],
  "@/types/*": ["types/*"],
  "@/utils/*": ["utils/*"]
},
```

- Argument of type `'DefaultTFuncReturn'` is not assignable to parameter of type `xyz` [Reference](https://www.i18next.com/overview/typescript#argument-of-type-defaulttfuncreturn-is-not-assignable-to-parameter-of-type-xyz) - Create a `i18next.d.ts`.


# Retaining Computer Science Knowledge
[Reference](https://startupnextdoor.com/retaining-computer-science-knowledge/)

- Mistake: Watching videos, taking notes, and then trying to remember.
- What I should have done:
  - Watch a couple of hours of videos on the topic, to get the main idea
  - Implement the algorithms and data structures
  - Make flash cards for important things I should remember about the topic
  - Move on to the next topic
  - Review the flash cards when you have time
  - After a few days, watch another video about the topic, perhaps 30 mins or so
  - After another week, watch a video about the topic, maybe same video or shorter one
  - Keep reviewing flash cards
- Spaced repetition.

# Next.js Pros and Cons
[Reference](https://cleancommit.io/blog/next-js-pros-and-cons/)

- Next is the library on top of React.
- SSR: Server sending ready to be rendered HTML to the browser, now it's viewable, and after the browser downloads JS, the page then becomes interactive.
- Pros: SSR support, Typescript, image optimisation, automatic code splitting, "the edge" (CDN), SEO, built-in CSS support, fast refresh/reloads a page every time new code is added, reusable components.
- Technical cons: forced to do page-based routing, opinionated.

# 8 Hard Truths I learned when I got laid off from my SWE job
[Reference](https://www.stevenbuccini.com/8-hard-truths-on-getting-laid-off)

- Don't discount the physical aspect of loneliness either. If you're like me, work is the primary shaper of your life. Work gives your life rhythm. It is the gravitational center around which the other activities in your life revolve. Then, one day, poof—it's gone. The daily interactions you have with your coworkers, however asinine, go with it. I found it difficult to fill this unexpected void in my life with positive activities and interpersonal interactions, especially during COVID.
- Just because you're getting a lot of offers to interview does not mean that you are a hot commodity. Nor does it indicate a high likelihood of obtaining an offer.
- We all agree the interview process is broken. We know. Yes, it's dumb you have to spend 8 unpaid hours on a take home project. We get it. That being said, it's an employer's market out there right now. You're going to have to grind Leetcode. Yes, even the dynamic programming problems.
- Good questions to ask:
  - “Can you send me five companies you would work for right now? Could you include some thoughts on why you think they're so interesting?”
  - “Do you need a surge in engineering capacity to get that big project out the door? If so, could I come on as a contractor?”
  - “My goal is to push one feature to my open-source project a week. Can you call me every two weeks to check in and hold me accountable?”
  - “I know you're really into machine learning. Could you buy me your favorite book on the subject if I promise you I'll read it cover to cover?”
  - “I am interviewing at `$YC_STARTUP` and am really excited about it. Do you mind backchanneling with the founder/lead investor on my behalf?”
- Similarly, being unexpectedly laid off provides folks with the time and space to truly unwind and think more deeply. For once, your thoughts are entirely your own. Contrast this with the normal job-switching process. You spend your last month at your prior employer handing off work. Maybe you take a month of vacation, but with the next role looming large on your mind.

# 10 React Hooks Explained ✨
[Reference](https://dev.to/abhisheknaiidu/10-react-hooks-explained-3ino)

- `useState` - basically just a state variable in Angular.
- `useEffect` - implement all the lifecycle hooks from within a single function API.

```
// this will run when the component mounts and anytime the stateful data changes
React.useEffect(() => {
    alert('Hey, Nads here!');
});

// this will run, when the component is first initialized
React.useEffect(() => {
    alert('Hey, Nads here!');
}, []);

// this will run only when count state changes
React.useEffect(() => {
    fetch('nads').then(() => setLoaded(true));
}, [count]);

// this will run when the component is destroyed or before the component is removed from UI.
React.useEffect(() => {
    alert('Hey, Nads here');

    return () => alert('Goodbye Component');
});
```

- `useContext` - avoiding prop-drilling.
- `useRef` - creates a mutable object where if the value changes, there isn't a re-render triggered.
- `useReducer` - similar to `useState`, but has the function dispatch actions, go to a reducer function.
- `useMemo` - used to optimise cost/save performance.
- `useCallback`
- `useImperativeHandle`
- `useLayoutEffect`
- `useDebugValue` - used for React dev tools.

# The React useEffect Hook for Absolute Beginners
[Reference](https://www.freecodecamp.org/news/react-useeffect-absolute-beginners/)

- As React components are intended to be pure functions, they aren't supposed to do side effects.
- Input to a JS function is arguments, and the input to a React component is Props.

```
export default function App() {
  return <User name="John Doe" />
}

function User(props) {
  return <h1>{props.name}</h1>; // John Doe
}
```

- Performing a side effect - we do this when we need to reach outside of the app.
  - Requesting API.
  - Interacting with browser APIs like `document` and `window`.
  - Using unpredictable timing functions like `setTimeout` or `setInterval`.
- Using `useEffect`: 2 arguments, a function and an array.
  - First argument: the side effects or multiple side effects that we want to happen when the component renders.
  - Second argument: the array of all the values that the side effect relies upon.
- **If you do not provide the dependencies at all, `useEffect` will run after every render.**
- Cleanup function - the function you execute when the component unmounts. Do this by adding a return function to the first argument of `useEffect`.

```
  useEffect(() => {
    let interval;
    if (title) {
      interval = setInterval(() => console.log('hello'), 500);
    }


    return () => {
      if (interval) {
        clearInterval(interval);
      }
    };
  }, [title]);
```

# A Complete Guide to useEffect
[Reference](https://overreacted.io/a-complete-guide-to-useeffect/)

- How do I replicate `componentDidMount` with `useEffect`? It's not an exact equivalent, since this captures props and state.
- Fetching data inside `useEffect` - second argument `[]` means that this code will only be executed when the component "mounts". `useReducer` and `useCallback` can remove the need for a dependency instead of incorrectly omitting it.
- Do I need to specify functions as effect dependencies or not? Recommended to hoist functions that don't need props outside of the component, and pull the ones inside of that effect. -- Need to read more on this
- Infinite refetching - this is because you don't have the second `[]` argument - you will run effect, mutate data, then run effect again.

```
function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

- `count` does not "watch" changes to the state. It's not "data binding" or watching, but a number. And when you do `setCount(1)`, React calls the component again and sets the counter state value which is a constant. `count` does not change, the component is called again.
- Inside a particular render, props and state forever stay the same. But if props and state are isolated between renders, so are any values using them, including the event handlers.
- Each render has its own effects - so how does each effect read that "count changed"? It's not the count variable that changes, it's the effect function that changes and is different on every render.
  - **You can think that effects are part of the render result.**
- Difference between class and functional components - the state changes in the middle?
- **At this point it’s important that we call it out explicitly: every function inside the component render (including event handlers, effects, timeouts or API calls inside them) captures the props and state of the render call that defined it.**
  - Be aware that when you want to read the future props or state from a function in a past render, you’re swimming against the tide. It’s not wrong (and in some cases necessary) but it might look less “clean” to break out of the paradigm.
  - `useRef(count)` to get the latest value?
- Synchronization, not lifecycle:
  - React synchronises the DOM according to our current props and state. There is no distinction between a "mount" or an "update" when rendering.
  - You should think of effects in a similar way. `useEffect` lets you synchronize things outside of the React tree according to our props and state.
  - This is subtly different from the familiar mount/update/unmount mental model. It is important really to internalize this. If you’re trying to write an effect that behaves differently depending on whether the component renders for the first time or not, you’re swimming against the tide! We’re failing at synchronizing if our result depends on the “journey” rather than the “destination”.
- React - instead of touching the DOM on every re-render, it only updates the parts of the DOM that actually change.

```
const oldProps = {className: 'Greeting', children: 'Hello, Dan'};
const newProps = {className: 'Greeting', children: 'Hello, Yuzhi'};
```

- If these change, then re-render.

```
const oldEffect = () => { document.title = 'Hello, Dan'; };
const oldDeps = ['Dan'];

const newEffect = () => { document.title = 'Hello, Dan'; };
const newDeps = ['Dan'];
```

- For effects - it doesn't diff between effects. It just re-runs the effects if the **deps** change. Since deps are the same, no need to run the new effect.
- You need to specify which dependencies the effect really needs correctly.

Either:

```
  useEffect(() => {
    const id = setInterval(() => {
      setCount(count + 1);
    }, 1000);
    return () => clearInterval(id);
  }, [count]);
```

Or:

```
  useEffect(() => {
    const id = setInterval(() => {
      setCount(c => c + 1);
    }, 1000);
    return () => clearInterval(id);
  }, []);
```

- `setCount` vs `setReducer`.

```
function Counter() {
  const [count, setCount] = useState(0);
  const [step, setStep] = useState(1);

  useEffect(() => {
    const id = setInterval(() => {
      setCount(c => c + step);
    }, 1000);
    return () => clearInterval(id);
  }, [step]);

  return (
    <>
      <h1>{count}</h1>
      <input value={step} onChange={e => setStep(Number(e.target.value))} />
    </>
  );
}
```

- When setting a state variable depends on the current value of another state variable, you might want to try replacing them with `useReducer`.
- Instead of reading the state inside an effect, it dispatches an action that encodes the information about what happened.
- Put function inside effect - makes it easier to keep track of what the first argument has, which makes it easier to think about what deps need to be included.
- TO BE CONTINUED - other hooks are being discussed now.

# Next.js: document is not defined
[Reference](https://stackoverflow.com/questions/60629258/next-js-document-is-not-defined)

```
import dynamic from 'next/dynamic'

const DynamicComponentWithNoSSR = dynamic(
  () => import('../components/hello3'),
  { ssr: false }
)

function Home() {
  return (
    <div>
      <Header />
      <DynamicComponentWithNoSSR />
      <p>HOME PAGE is here!</p>
    </div>
  )
}

export default Home
```

# Why side effect is not OK in React?
[Reference](https://stackoverflow.com/questions/61419129/why-side-effect-is-not-ok-in-react)

- The main benefit of using useEffect there is to keep localStorage and component state in sync. You may want to update your component state in different ways (maybe a button would reset the field), and in that case you may duplicate localStorage logic.
- The reason the first case doesn't need to be wrapped in useEffect is because it's already in an event handler, and it will be called only once per change.
- Likewise, the reason we use useEffect in the second case is so that React can ensure it only calls the effect once.
- Why bother? React may retry rendering your component when it likes, and it expects the same JSX for the same state/props regardless of how many times it renders--i.e., your component should be "pure".

# React Hooks: useEffect() is called twice even if an empty array is used as an argument
[Reference](https://stackoverflow.com/questions/60618844/react-hooks-useeffect-is-called-twice-even-if-an-empty-array-is-used-as-an-ar)

- Can be React Strict Mode.
- Can be component used more than once in the page.
- Something higher up in the tree is unmounting and remounting.

# Pass Multiple Children to a React Component with Slots
[Reference](https://daveceddia.com/pluggable-slots-in-react-components/)

```
<Layout
  left={<Sidebar/>}
  top={<NavBar/>}
  center={<Content/>}
/>

function Layout(props) {
  return (
    <div className="layout">
      <div className="top">{props.top}</div>
      <div className="left">{props.left}</div>
      <div className="center">{props.center}</div>
    </div>
  );
}
```

- Questions
  - Should we just use functional components instead of class components 100%
  - How do you know if server or client rendered
  - Changing "document" or whatever console log
  - Custom hook for `useTranslation`?
  - Default `useState` from store?
  - `useEffect` vs `useRef` - when to use latter?

