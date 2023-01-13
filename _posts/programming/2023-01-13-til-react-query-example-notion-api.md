---
layout: post
title:  "TIL, 2023-01-13, React query example, Notion API"
date:   2023-01-13 09:19:46 +0800
categories: programming
summary: "React-query example, Notion API."
---

# Learnings

- Multiple translation files: [Reference](https://react.i18next.com/latest/usetranslation-hook)
- React Fragment - just do `Fragment` so you can do `import { Fragment } from 'react';`.
- You can't `useEffect` to get from Notion API, have to do it server-side.
- Each page in Next has the component and the `getStaticProps` to get server things.
- React Query - some experimenting.
- Images - get it like this:

```
<Image
  alt="Pumpkin icon"
  className="inline-block mr-4"
  src="/images/icon-pumpkin.png" <- If in public directory
  width={32}
  height={32}
/>

```
- Use Notion as a Back-end for Next: [Reference](https://alexandar.me/posts/using-notion-as-a-cms-with-react)
- React-query basics: [Reference](https://dev.to/franklin030601/image-search-engine-with-react-js-react-query-39)
- Form data on submit [Reference](https://linguinecode.com/post/how-to-get-form-data-on-submit-in-reactjs)

# 7 React Hooks for Every Project
[Reference](https://dev.to/webdevhero-com/7-react-hooks-for-every-project-1jdo)

- Hooks come from `@mantine/hooks`.
- `useIntersection` - to know if an element is visible to them.

```
import { useRef } from 'react';
import { useIntersection } from '@mantine/hooks';

function Demo() {
  const containerRef = useRef();
  const { ref, entry } = useIntersection({
    root: containerRef.current,
    threshold: 1,
  });

  return (
    <main ref={containerRef} style={{ overflowY: 'scroll', height: 300 }}>
      <div ref={ref}>
        <span>
          {entry?.isIntersecting ? 'Fully visible' : 'Obscured'}
        </span>
      </div>
    </main>
  );
}
```

- Call the hook in the component and provide a root element. `useIntersection` returns a ref which we pass to the target element.

- `useScrollLock` - enables to lock scrolling on the body element.

```
import { useScrollLock } from '@mantine/hooks';
import { Button, Group } from '@mantine/core';
import { IconLock, IconLockOpen } from '@tabler/icons';

function Demo() {
  const [scrollLocked, setScrollLocked] = useScrollLock();

  return (
    <Group position="center">
      <Button
        onClick={() => setScrollLocked((c) => !c)}
        variant="outline"
        leftIcon={scrollLocked ? <IconLock size={16} /> : <IconLockOpen size={16} />}
      >
        {scrollLocked ? 'Unlock scroll' : 'Lock scroll'}
      </Button>
    </Group>
  );
}
```

- `useClipboard` - getting the clipboard value.
- `useDebouncedValue`.
- `useMediaQuery` - subscribe to whatever media query we pass to the hook.

```
import { useMediaQuery } from '@mantine/hooks';

function Demo() {
  const matches = useMediaQuery('(min-width: 900px)');

  return (
    <div style={{ color: matches ? 'teal' : 'red' }}>
      {matches ? 'I am teal' : 'I am red'}
    </div>
  );
}
```

- `useClickOutside`.
- `useForm`.

# React-Query docs

Defining Custom Hooks
When defining a custom hook you need to specify the result and error types, for example:

```
 function useGroups() {
   return useQuery<Group[], Error>('groups', fetchGroups)
 }
```

# You Will Never Be A Full Stack Developer
[Reference](https://seldo.com/posts/you-will-never-be-a-full-stack-developer)

- The stack is enormous: many server-side languages, networking, systems-level concerns, build tools, performance optimisation... You can spend a lifetime trying to learn all these things and never be done.
- The stack is evolving: JS and CSS didn't exist in 1995. Learn the thing that helps you get the job done.
- Demand for software outpace the supply of developers (maybe a 2020 thing)?
- Simplification
  - Standardisation - Use something that nearly everyone uses. It does not matter whether it is objectively the best, as it is easier for innovation to happen if we assume one platform is in place.
  - Packaging - Ex: Stripe. Stripe made it easier as it standardises credit card payments. Ex: AWS - AWS didn't invent virtualisation, but made it easy to buy.
  - Abstraction: By picking a standard, you save yourself time, but lose efficiency from a solution more specifically designed for the use case.
- Simplification is worth the costs. **More often the mere fact of not needing to think about the problem at all out-weighs any potential benefits. A new developer could spend years figuring out the perfect configuration of HTTP servers for maximum throughput and efficiency -- or they could ship tomorrow with whatever the default is and never spend any time at all thinking about it.**

## What does this mean?

- Everyone is consistently learning new things all the time. Your area of expertise may be packaged up in the future.
- You can specialise at one point of the stack, but if your specialisation gets eliminated by a standard, you can find yourself with fewer job opportunities.
- You can run up the stack (learn the more modern things), but the things you learn, nobody ends up using.
- Think of it like this: web development is a career where I will never be bored. I will never learn everything, but for the same amount of effort, the work I produce this year will be better than the year before. Maybe not more efficient, but more sophisticated or more appreciated by the users.
