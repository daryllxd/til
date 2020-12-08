---
layout: post
title:  "TIL, 2020-12-08"
date:   2020-12-08 10:42:12 +0800
categories: programming
summary: "Where I..."
---

# Musings

- `$0` to select currently selected shit.
- `outline-offset` exists for both X and Y - must have pseudo-element so it just aligns one way.
- `npm outdated`
- `aria-label`
- `aria-pressed`.

# Cutting our webpack build times in half
[Reference](https://www.cargurus.dev/Cutting-our-webpack-build-time-in-half/)

- Measuring: `honeycomb`.
- Duplicate dependencies: Some bundles have a hard dependency on an older version of React, so there would be 2 copies of react. Make sure that libraries have carets.
- Webpack DLL plugin: Allows a common dependency to be in a single file. This can reduce page size+ hit cache on React/other dependencies.
- `sourcemap` on takes a long time for the codebase to compile. Switching to `cheap-eval-source-map` to cut down build time from 15 to 7 minutes.
- Incremental builds - Create a webpack plugin that detects which files have changed and recompile the bundles specific to what has changed.
- Other improvements
  - Thread loader to multi-thread Babel compiles
  - Prevent `node_modules` from being processed in Babel
  - Upgrading to Babel 7, Webpack 4.
  - Turn off split chunks in development mode.
  - Turn of Post CSS in dev.

# Making Accessible Links: 15 Golden Rules For Developers
[Reference](https://www.sitepoint.com/15-rules-making-accessible-links/)

- Don't use the word "link" in your links.
- Don't capitalize links.
- Avoid ASCII characters. If you must use emoticons, mark them up with ARIA. Even dashes, you can change them. 16-17 years should be "16 to 17 years".
- Avoid using link URLs as link text.
- Keep link text concise - maximum of 100 characters.
- Restrict the number of text links on a page.
- Don't link directly to downloads.
- Alert the user when opening new windows. "This will open in a new window".
- Be aware of pagination and alphabetized links. There should be contextual information before the list of links.
  - Color should not be the only thing being used in pagination or alphabetised links to indicate the current link. This violates 1.4.1 Use of Color.
  - You should also add CSS padding around the link to increase the clickable area.
- Anchor links - need to say if you're navigating around in the same page.
- Underline links, or contrast them with the surrounding background. Underline, bold, italic, increase in font-size.
- Design with keyboard-only users in mind.
- No `onclick` on random elements, have to be links.
