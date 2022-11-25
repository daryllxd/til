---
layout: post
title:  "TIL, 2022-11-23, Instagram optimizations, intro to caching"
date:   2022-11-23 10:30:22 +0800
categories: programming
summary: "Instagram optimizations, front-end caching"
---

# Making Instagram.com faster: Part 1
[Reference](https://instagram-engineering.com/making-instagram-com-faster-part-1-62cc0c327538)

- Correctly prioritising resource download an execution and reducing browser downtime during the page load is one of the main levers for improving web application performance.
- `<link rel="preload" href="my-js-file.js" as="script" type="text/javascript" />` - used for dynamic loaded JS and preloading XHR GraphQL requests for data. For the `FeedPage`, we can preload `FeedPageContainer.js`. Same for preloading the XHR request.
- With preloading, they can both load as soon as the page HTML is available.
- Preload prioritisation benefits - This increases the network priority of async script downloads. Then, XHR requests and images in the viewport will have higher network priority.
- Problem: Sometimes, in slow networks, the `link rel="preload` were being prioritized over the `script` tags.
- Idea behind it (on the feed): Don't want the user to wait every time they get to the bottom of the feed.
  - Off-screen batch loading should not take CPU and bandwidth priority away from parts of the feed the user is currently viewing.
  - Don't want to waste user bandwidth by being over-eager with preloading posts the user might not even bother scrolling down to see, but if we don't preload, the user will hit the end of the feed.
  - `srcset` - not sure which image resolution we should preload and we risk preloading images the browser will never use.
  - Prefetch is queued at an idle priority using `requestIdleCallback`, so it won't begin unless the browser is not doing any other important work. But if near the end of the page, cancel the pending idle callback and fire off the prefetch immediately.
- How:
  - Once the JSON data for the next batch of posts arrives, we queue a sequential background prefetch of all the images in that preloaded batch of posts. Prefetch them sequentially in the order the posts are displayed rather than in parallel, so we download the images near the viewport.

# Making Instagram.com faster: Part 2
[Reference](https://instagram-engineering.com/making-instagram-com-faster-part-2-f350c8fba0d4)

- Theoretical ideal - you want the preloaded query to begin as soon as the request for the page hits the server, not after you start rendering the page on the client.
  - Push the resources/JSON from the server to the browser?
  - HTTP/2 push or early flush/head flushing/progressive HTML.
  - Rendering chunked responses

# Making Instagram.com faster: Part 3 — cache first
[Reference](https://instagram-engineering.com/making-instagram-com-faster-part-3-cache-first-6f3f130b9669)

- **We use Redux to manage state on instagram.com, so at a high level the way we implemented this was to store a subset of our Redux store on the client in an indexedDB table, and then rehydrate the store when the page first loads.**
  - Possible problem: Interacting with the cache before the page fully loads.
  - Store the interactions so they can be replayed later over the new state from the server.
- Design:
  - On page load, request new data or wait for it to be pushed.
  - Create the staged subset of the Redux state.
  - While the request is pending, store the dispatched actions.
  - Once the request resolves, apply actions.
  - When the staged state is committed, we replace the current state with the staged one.

# Making instagram.com faster: Code size and execution optimizations (Part 4)
[Reference](https://instagram-engineering.com/making-instagram-com-faster-code-size-and-execution-optimizations-part-4-57668be796a8)

- Assumption: size post-compression is important. Reality: Size pre-compression is what has to be parsed and executed on the user's device, even if it's cached locally. Ex: Brotli compression didn't really save that much.
- Key to optimize - the amount of eagerly executed JS on the critical path.
- Inline requires - this means that you won't require the module until you are going to use it.
- ES2017 bundle to modern browser - there is considerable size overhead in transpiling things like destructure, arrow functions, rest parameters.

# Inside Amazon's Engineering Culture
[Reference](https://newsletter.pragmaticengineer.com/p/amazon)

- Focus on: Leadership principles, operational excellence, frugality.
- Good: scale, compensation, internal mobility, returning to Amazon.
- Bad: on call/operations load, managers, "must fire some members".
- Leadership principles:
  - Customer obsession - more customers than competitors.
  - Ownership, long-term thinking.
  - Invent/simplify.
  - Are right, a lot.
  - Learn and be curious.
  - Hire/develop the best.
  - Insist on the highest standards.
  - Think big.
  - Bias for action.
  - Frugality.
- What stands out?
  - Very strong focus on operations and execution in all areas - cause it's retail where margins are low.
  - Document-heavy culture. 6-page document on what the meeting is about.
  - Custom internal tooling.

# 30 Angular tricks and tips to improve your application
[Reference](https://espeo.eu/blog/30-angular-and-ts-tricks-and-tips-that-will-improve-your-application/)

- renderer `addClass` and `removeClass` is faster and will prevent too many change detection checks.
- Maybe `get`, `set` on `Input` rather than `ngOnChanges`, to have less if statements.
- pipe in `ngFor` to prevent multiple re-evaluations on change detection.
- `baseUrl` and module aliases.
- `stylePreprocessorOptions` to avoid inconsistency while importing other files.
- Keep route names as const, to prevent accidental typos?
- Webpack-bundle-analyzer to detect any fast growing modules.
- Browser performance tests.
- Virtual scroll.
- `ngZOneEventCoalescing` to reduce the amount of change detection cycles while event bubbling.
- Debugging components:
  - `ng.getComponent($0)` then `ng.applyChanges(myComponent)`.
- Preload resources and routes to speed up the application.
- Use web worker to move the heavy non-UI algorithm to run on separate non-UI-blocking thread.

```
@Component({
 selector: 'app',
})
export class App implements OnInit{
 private output
 private webworker: Worker
 ngOnInit() {
     if(typeof Worker !== 'undefined') {
         this.webWorker = new Worker('./myWebWorker')
         this.webWorker.onmessage = function(data) {
             this.output = data
             console.log('Message received from worker');
         }
     }
 }
 runHeavyAlgorithm(firstValue: number, secondValue: number) {
     this.webWorker.postMessage([firstValue, secondValue])
 }
}
```

# Frontend caching strategies
[Reference](https://medium.com/@brockreece/frontend-caching-strategies-38c57f59e254)

- No caching: Never worry about the freshness of your data in the cache, because there is no cache.
- Prefer API via `localStorage`. You can also try [Reference](https://github.com/localForage/localForage).

```
let data
axios.get('data').then((response) => {
  data = response.data.data
}).catch(() => {
  data = localStorage.getItem('data')
})
```

- Prefer local - pull data over the network, save it to our cache, and then retrieve it locally on subsequent page loads.

```
let data = localStorage.getItem('data')
if (!data) {
  axios.get('/data').then((response) => {
    data = response.data.data
    localStorage.setItem('data', response.data.data)
  })
}
```

- Local then API - Something like this:

```
const currentVersion = 2
let data = localStorage.getItem('data')
let version = localStorage.getItem('version')
if (!version || version < currentVersion) {
  axios.get('/data').then((response) => {
    data = response.data.data
    localStorage.setItem('data', response.data.data)
    localStorage.setItem('version', currentVersion)
  })
}
```

- Service workers or updating the cache using push-based technologies such as web-sockets.

# A Quick Start Guide to Frontend Caching
[Reference](https://www.godaddy.com/engineering/2019/11/19/frontend-caching-quick-start/)

- Mutable content - changes to it overwrite the file itself. Ideally, we always want users to have the latest contents from this file in a cache performant manner.
- Immutable  content - changes to it create a new file with a new name and do not modify the existing file.
- Strategies:
  - `Cache-Control`: `no-cache`, server configuration: `ETags`.
  - `no-cache` means if the server has new content available, download it, else, use what you've cached. Force caches to submit the request to the origin server for validation before we release a cached copy.
  - `ETag` support on the server - it  can now validate the resources cached by the browser. ETags are identifiers implemented via checksum on the file content. Browser can check by asking server if their ETag is still valid.
- For `main.js` and `style.css`, we do `no-cache`, `ETag` for cache validation. Same policy as index.
- `dog.png` and `cat.jpg` - as they are immutable, we want the client to only download the file once and cache it for as long as possible. `Cache-Control = max-age: 31536000`. 31536000 should be then number because more than 1 year is bad.
- `healthcheck.html` - don't get cached. `Cache-Control = no-store` means that the client should never store any response.
- Versioning - `main.js` and `style.css` can be cached, so they have hashes.
- `Cache-Control` headers already set for the resources, so how should I update them?

```
Before: <script type="text/javascript" src="my-file.js"></script>
After: <script type="text/javascript" src="my-file.js?version=2"></script>
```

- If the resource is immutable, then no changes should be needed. Edits to the source files generate new corresponding build files with unique identifiers.

- Based off the content characteristic of each resource you can now create an optimal caching strategy.
- **If the content is immutable then cache it for as long as possible. For example: Cache-Control = max-age: 31536000.**
- **If the content is mutable then we would like browsers to cache the file until we change it. For example: Cache-Control = no-cache with etags enabled on the server.**

# What is caching?
[Reference](https://www.cloudflare.com/learning/cdn/what-is-caching/)

- Browsers cache most of the content that appears on the webpage, saving a copy of the webpage content on the device hard drive. They will store this until the time to live (TTL) expires or until the hard drive cache is full.
- CDN caching - a content delivery network caches content in proxy servers that are located closers than origin servers.
- CDN cache hit - when a client device makes a request to the cache for content, and the cache has that content saved.
- How long does that cached data remain in a CDN server? Depends on TTL.
- DNS caching - taking place on DNS servers.
