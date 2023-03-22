---
layout: post
title:  "TIL, 2023-03-08, SSG vs SSR"
date:   2023-03-08 10:10:47 +0800
categories: programming
summary: "Where I..."
---

# Server-Side Rendering vs. Static Site Generation
[Reference](https://betterprogramming.pub/server-side-rendering-vs-static-site-generation-53a34872728c)

- Back to servers:
  - SEO.
  - Performance for slow devices.
  - Use JS and frameworks, not PHP.
- We must have a server in place.
- If an output is the same ("About us"), then you should store that on a CDN, as a static, non-changing resource that is served quickly.
  - Static site generation (SSG).
  - **You can fetch any data from multiple sources, but these are fetched only at build time.** When the information to show changes, you must rebuild the project.
- JAM stack:
  - Headless CMS like Netlify, Contentful - when you submit a new blog post, it triggers a new build of the front-end static project.
- SSR pros:
  - Data is always up to date, can show dynamic data changing frequently.
- SSR cons:
  - Need server, can't use CDN (can put a caching layer, but that means you can show stale data).
- SSG pros:
  - Fast website on CDN, no server-side logic.
- SSG cons:
  - Not ideal if the content is dynamic or user-specific.
- Hybrid: Both.

# Client-side vs. Server-side vs. Pre-rendering for Web Apps
[Reference](https://www.toptal.com/front-end/client-side-vs-server-side-pre-rendering)

- First page load to do SSR, then use framework to do dynamic routing with AJAX: Universal or isomorphic app.
- React `RenderToString` method.
- Pre-rendering:
  - Compile all the pre-selected routes so you can store the fully populated HTML file to the static server.
  - Each pre-rendered page displays a skeleton template while the data waits to be rehydrated with AJAX/XHR requests.
- Client-only rendering is often not enough.

# Client-side Vs. Server-side Rendering: What to choose when?
[Reference](https://www.solutelabs.com/blog/client-side-vs-server-side-rendering-what-to-choose-when)

- Web page load time: SSR takes less time for the first web page because CSR needs to download all the bundles (even with lazy loading). Since the supporting scripts are loaded in advance for CSR, the load time for the next pages are slower.
- Caching: In CSR, as long as the modules have loaded, they can practically run without the Internet unless you need data from the API. In SSR, the request to the server is always sent.
- SEO - CSR has React Helmet, SSR just works.

## When to use?

- Dynamic content loading - SSR - client machines have limited compute power for fetching.
- Web application UX - with more interaction CSR is better. If the metadata matters, then SSR is better.

# Understanding NextJS use cases (pros/cons) compared to vanilla React SPAs?
[Reference](https://www.reddit.com/r/reactjs/comments/klsxye/understanding_nextjs_use_cases_proscons_compared/)

# SSR vs SSG in Next.js – a practical overview for CTOs and devs
[Reference](https://tsh.io/blog/ssr-vs-ssg-in-nextjs/)
