---
layout: post
title:  "TIL, 2023-05-22"
date:   2023-05-22 13:29:32 +0800
categories: programming
summary: "Next JS Route Handlers, docs"
---

# Using Next.js Route Handlers
[Reference](https://blog.logrocket.com/using-next-js-route-handlers/)

- Route handlers - functions executed when users access site routes.
- We can create dynamic routes.
- Creating API request handlers:
  - `route.ts` created within the app directory.
  - Export an asynchronous function named with your desired HTTP request.
- Dynamic route - needs to be in folder with `[user]`.

```
export async function GET(request, { params }) {
  // we will use params to access the data passed to the dynamic route
  const user = params.user;
  return new Response(`Welcome to my Next application, user: ${user}`);
}
```

- Static route handler

```
import { NextResponse } from 'next/server';
export async function GET() {
  const res = await fetch(
    "https://api.github.com/search/users?q=richard&per_page=3"
  );
  const data = await res.json();
  return NextResponse.json(data);
}
```

# NextRequest
[Reference](https://nextjs.org/docs/app/api-reference/functions/next-request)

# NextResponse
[Reference](https://nextjs.org/docs/app/api-reference/functions/next-response)

- Extends the Web Request API with additional convenience methods.
  - Checks cookies, gets all values of cookies, clear cookie, and has a `nextUrl`, which has some Next.js specific properties.
- `NextResponse.json()` to produce a response with a given JSON body.
- `NextResponse.redirect()` to redirect to a URL.
- `NextResponse.rewrite()` - preserves the original URL.
- `next()` is useful for middleware, as it allows you to return early and continue routing.

# React Essentials
[Reference](https://nextjs.org/docs/getting-started/react-essentials)

- Why Server components?
  - Large dependencies that could impact the JS bundle size on the client can remain entirely on the server so better performance.
  - The base-client side runtime can be cacheable and predictable in size, and does not increase as your application grows.
- All components inside the app route are server components by default.
- Good to know:
  - Components in the Server Component module graph are guaranteed to be only rendered on the server.
  - Components in the Client Component module graph are primarily rendered on the client, but with Next.js, they can also be pre-rendered on the server and hydrated on the client.
  - The "use client" directive must be defined at the top of a file before any imports.
  - "use client" does not need to be defined in every file. The Client module boundary only needs to be defined once, at the "entry point", for all modules imported into it to be considered a Client Component.
- Server component:
  - Fetch data, access back-end resources, keep information, keep dependencies.
- Client component:
  - Interactivity.
  - Use lifecycle events.
  - Browser-only APIs.
  - Use hooks that depend on state, effects, or browser-only APIs.

## Composing Client and Server components

- You can render server components inside client components.
- On the server, React renders all S components before sending the result to the client.
- You cannot import an S component into a C component.
- You will pass S components as props to C components.

```
'use client';

import { useState } from 'react';

export default function ExampleClientComponent({
  children,
}: {
  children: React.ReactNode;
}) {
  const [count, setCount] = useState(0);

  return (
    <>
      <button onClick={() => setCount(count + 1)}>{count}</button>

      {children} < - S component
    </>
  );
}
```

- This pattern is already used in `layouts` and `pages`.
- **Passing props from S to C components: need to be serializable.**
  - Functions, dates - cannot be passed to C components.
- **Although it's possible to fetch data in Client Components, we recommend fetching data in Server Components unless you have a specific reason for fetching data on the client. Moving data fetching to the server leads to better performance and user experience.**
- When using third-party components, you have to wrap them if they are client components (or components that use lifecycle events) because Next doesn't know they are client components, unless you have `use client` in the component which contains the 3rd party one.
- Context provider components: You have to wrap them in a component.
