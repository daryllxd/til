---
layout: post
title:  "TIL, 2023-02-11, `forwardRef`, CSS variables in Tailwind"
date:   2023-02-11 09:46:36 +0800
categories: programming
summary: "`forwardRef`, CSS variables in Tailwind"
---

- CSS variables in Tailwind config - need to be expressed in the R, G, B combination.

```
extend: {
  colors: {
    'primary': `rgba(var(--color-primary-red, ${PRIMARY_RED}), var(--color-primary-green, ${PRIMARY_GREEN}), var(--color-primary-blue, ${PRIMARY_BLUE}), 1)`,
    'primary-400': `rgba(var(--color-primary-red, ${PRIMARY_RED}), var(--color-primary-green, ${PRIMARY_GREEN}), var(--color-primary-blue, ${PRIMARY_BLUE}), 0.8)`,
```

- [Reference](https://stackoverflow.com/questions/40010597/how-do-i-apply-opacity-to-a-css-color-variable) - No clear support.

- [Reference](https://www.npmjs.com/package/hex-to-rgba) - Convert hex to RGBA string.
- [Reference](https://stackoverflow.com/questions/40029113/syntaxerror-import-and-export-may-appear-only-with-sourcetype-module-g) - Difference between `require` and `import`.


# forwardRef
[Reference](https://beta.reactjs.org/reference/react/forwardRef)

- Lets your component expose a DOM node to parent component with a ref.


```
import { forwardRef } from 'react';

const MyInput = forwardRef(function MyInput(props, ref) {
  // ...
});
```

- Return a React component rendered in JSX. The component is able to take a `ref` prop.
- This makes the component be able to control the node exposed by the inner component.
- This means it's harder to change the component internals later.

```
import { useRef } from 'react';
import MyVideoPlayer from './MyVideoPlayer.js';

export default function App() {
  const ref = useRef(null);
  return (
    <>
      <button onClick={() => ref.current.play()}>
        Play
      </button>
      <button onClick={() => ref.current.pause()}>
        Pause
      </button>
      <br />
      <MyVideoPlayer
        ref={ref}
        src="https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
        type="video/mp4"
        width="250"
      />
    </>
  );
}

const VideoPlayer = forwardRef(function VideoPlayer({ src, type, width }, ref) {
  return (
    <video width={width} ref={ref}>
      <source
        src={src}
        type={type}
      />
    </video>
  );
});
```

- You can also forward a ref to a DOM node.
- `useImperativeHandle` - you can use this to specify the value you want to expose to the ref, instead of exposing the entire Node.
- **Do not overuse refs. You should only use refs for imperative behaviors that you can't express as props: scrolling to a node, focusing a node, triggering an animation, selecting text, so on.**
- If you can expose something as a prop, you should not use a ref.
- Issues:
  - ref is null: You didn't pass the ref down.

# Using forwardRef in React to clean up the DOM
[Reference](https://blog.logrocket.com/cleaning-up-the-dom-with-forwardref-in-react/#:~:text=Forwarding%20refs%20in%20React%20using,technique%20is%20called%20ref%20forwarding.)

- These allows the child component a reference to a DOM element created by its parent component. Then, the child can read and modify that parent anywhere it is being used.
- To change the behavior of a child component, you will usually re-render a child component with a new set of props.
- With refs, we have access to a DOM node that is represented by an element.
  - Also like `ViewChild` in Angular.
- You can do things like `document.getElementById`, but React doesn't recommend that.
- Uses:
  - Incrementing values like a Medium clap button and prevent re-renders from happening.
  - Triggering imperative animations.

# 9 Interview Questions Every Senior React Developer Should Know
[Reference](https://levelup.gitconnected.com/7-interview-questions-every-senior-react-developer-should-know-d85730fb04d5)

- Optimise performance:
  - Avoiding unnecessary re-renders
  - Using a UID (unique identifier) when rendering lists
  - Using hook such as `useMemo` and `useCallback` to memoize expensive functions.
  - Mounting checks.
- State management in a large React application: Redux and friends.
- Complex data structure in React?
  - Utility libraries like lodash, use debounce.
- Testing in React?
  - React Testing Library and Enzyme
- Asynchronous actions?


```
useEffect(() => {
  async function fetchData() {
    const response = await fetch('https://..../endpoint');
    const data = await response.json();
    setData(data);
  }
  fetchData();
}, []);

```

- Presentational vs container components?
  - Presentational is responsible for rendering UI elements to the screen
  - Container aware for managing state and actions.
- React Context API benefits?
  - Avoid prop drilling.
  - Make it easier to share state between components.
  - Improve performance since it doesn't rely on Virtual DOM.
- Increase code reuse.

# 5 React Design Patterns You Should Know
[Reference](https://javascript.plainenglish.io/5-react-design-patterns-you-should-know-629030e2e2c7)

- WIP!
