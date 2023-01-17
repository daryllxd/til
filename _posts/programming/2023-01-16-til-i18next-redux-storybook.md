---
layout: post
title:  "TIL, 2023-01-16, 18next, Redux, Storybook"
date:   2023-01-16 13:00:21 +0800
categories: programming
summary: "i18next, Redux, Storybook"
---

# Using `i18next` to load translations from external API
[Reference](https://github.com/i18next/i18next-http-backend)

- This example helped: [Reference](https://github.com/i18next/i18next-http-backend/tree/master/example/next)

```
const HttpBackend = require('i18next-http-backend/cjs');

module.exports = {
  backend: {
    backends: typeof window !== 'undefined' ? [HttpBackend]: [],
    loadPath: 'https://yourtranslations.com/{{lng}}-{{ns}}.json'
  },
  use: [HttpBackend], <- Add
  i18n: {
    defaultLocale: 'en',
    locales: ['es', 'en'],
    localeDetection: true,
    serializeConfig: false, <-- Add
  },
```

```
app.tsx

export default appWithTranslation(App, nextI18nConfig);
```

# Should we be teaching Redux in 2022?
[Reference](https://www.reddit.com/r/reactjs/comments/squatd/should_we_be_teaching_redux_in_2022/)

- Context is not "state management". It is a dependency injection mechanism, whose purpose is to make a single value accessible to a nested tree of React components.
  - You are actually doing the state management yourself, just with `useState` and `useRender`.
  - Redux is a library and a pattern for separating your state update logic from the rest of the app, making it easy to trace when/where/why/how your state has changed.
  - Context has performance limitations - any component that consumes a context will be forced to re-render, even if it only cares about that part of the context value.
- Redux is still by far the most widely used state management library for React apps.
- If you are going to teach Redux, then it is suggested to do:
  - Redux Toolkit package.
  - React-Redux hooks API.

# Deploying Storybook

- Vercel - Project settings - change to "Other"
  - Build command: `yarn build-storybook`.
  - Output directory: `storybook-static`.
