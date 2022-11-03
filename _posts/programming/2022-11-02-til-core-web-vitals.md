---
layout: post
title:  "TIL, 2022-11-02, Core Web Vitals"
date:   2022-11-02 13:45:08 +0800
categories: programming
summary: "Core Web Vitals"
---

# Total Blocking Time (TBT)
[Reference](https://web.dev/tbt/)

- Total time between First contentful paint and time to interactive, where the main thread was blocked for long enough to prevent input responsiveness.
- Main thread is considered "blocked" any time there's a long task (task running on the main thread for more than 50 ms.
- Blocking time - duration in excess of 50ms.
- TBT relate to TTI - quantifies how non-interactive a page is prior to it becoming reliably interactive.
- TTI is reliable interactive if the main thread has been free of long tasks for at least five seconds.
- Good score: 200ms on average mobile hardware.
- Improving:
  - Reduce 3rd party code.
  - Reduce JS execution time.
  - Minimise main thread work.
  - Keep requests counts low and transfer sizes small.

# Reduce the impact of third-party code
[Reference](https://web.dev/third-party-summary/) [Reference](https://web.dev/identify-slow-third-party-javascript/)

- Lighthouse audit can highlight scripts that take a long time to parse, compile, or evaluate.
- Network payloads: Identify network requests, including those from third-parties that may slow down page load time. The audit fails when your payload exists 4000 KB.
- You can block some third party scripts if you need to, and see if things are faster.

# Efficiently load third-party JavaScript
[Reference](https://web.dev/efficiently-load-third-party-javascript/)

- Use `async` or `defer` attribute on `<script>` tags.
  - `async` and `defer` attributes tell the browser that it may go parse the HTML while loading the script in the background, and then execute when they load.
  - *`async` will execute after they finish downloading and before the window's load event.* So it's possible that `async` scripts will not be executed in the order in which they appear in the HTML. Use for critical resources.
  - *`defer` will execute after HTML parsing is completely finished, but before the `DOMContentLoaded` event.* Use for less critical resources.
  - **Telegraphy recently deferred all of their scripts, and improved the ad loading time by an average of 4 seconds.**
- Establish early connections to required origins.
  - `preconnect` and `dns-prefetch` - informs the browser that your page intends to establish a connection to another origin, and that you'd like that process to start as soon as possible.
  - `dns-prefetch` handles the subset of what is linked by `link rel="preconnect"`. `dns-prefetch` instructs the browser to only resolve the DNS of a specific domain before it has been explicitly called.
  - `preconnect` for
- Lazy-loading.
  - Use `IntersectionObserver` or `lazysizes` for lazy-loading images and iframes.
- Optimise how you serve third-party scripts.
  - CDN - has costs such as establishing that HTTP connection, SSL handshake.
  - Self-host: Reduce DNS lookup, improve HTTP caching headers, take advantage of HTTP/2.
- ***Service workers to cache scripts from third-party servers.***

# Best practices for fonts
[Reference](https://web.dev/font-best-practices/)

- Impact on performance:
  - Delayed text rendering: Typically, if a web font has not loaded, browsers will delay text rendering, which delays FCP and LCP.
  - Layout shift: Can have some CLS.
- `@font-face`
  - Declares the name that will be used to refer to that font and indicates the location of the font file.
  - Myth: A font is requested when a `@font-face` declaration is encountered. The font would only be downloaded if an HTML element matches the styling used on the page.
- If fonts are third-party, preconnect to critical third-party origins:
  - But this comes at the cost of taking away browser resources from the loading of other resources.

```
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
</head>
```

- Self-hosted font: Make sure your site is also behind CDN.
- WOFF2 and forget about everything else.
- If can, use the system font.
- Font rendering:
  - `font-display` - tells browser how it should proceed with text rendering when the associated web font has not been loaded.
  - `font-display: optional` - If the font takes 100ms, don't swap out the font.
  - `font-display: swap` - display the text and then swap it out when the web font arrives.
  - `font-display: block` - display the text invisibly but have space, and then see the text with the new font when it arrives.

# Preconnect
[Reference](https://www.keycdn.com/blog/resource-hints)

- Allows the browser to setup early connections before an HTTP request is actually sent to the server.
- Eliminates round trip - begins the request in parallel with CSS request so it can remove round trips from the critical path.
