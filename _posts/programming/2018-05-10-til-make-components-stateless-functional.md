---
layout: post
title:  "TIL, 2018-05-10, Make components stateless and functional."
date:   2018-05-10 18:41:31 +0800
categories: programming
summary: "Axios interceptor, more export, table or div?, reading a code review"
---

# Musings, JS:

- [`export default was not found`](https://stackoverflow.com/questions/45995136/javascript-export-default-was-not-found)
  - You have to specify `default` explicitly, or if you're trying to export multiple items from the same file, you need to import them with curly brackets.

``` js
file.js
export default function translateDate(date) { } import translateDate from file.js

// other_file.js
export function doWork(){}
export const myVariable = true;

import { doWork, myVariable} from "./other_file.js"
```

- Toast/Notifications library: [Reference](https://fkhadra.github.io/react-toastify/)
- Axios in errors: [Reference](https://github.com/axios/axios/issues/960). `Modify from console.log(error) to console.log(error.response) in catch.`
- Axios Interceptor: [Reference](https://stackoverflow.com/questions/40028789/is-there-a-way-to-set-global-axios-config-for-error-response-codes)

```
axios.interceptors.response.use(undefined, function (error) {
  if(error.response.status === 401) {
    ipcRenderer.send('response-unauthenticated');
    return Promise.reject(error);
  }
});
```

- [Code review](https://www.reddit.com/r/reactjs/comments/8i8kwq/i_made_this_spotifylike_client_reactreduxrouter/)
  - Lint in your project.
  - Why is `app.js` a class/doesn't need internal state and could be a stateless function. If it's used to encapsulate the `Audio` instance, put this outside of your component hierarchy.
  - Prop typing/safety when developing.
  - Organize component styles with BEM or ITCSS.
  - Inline or class-based styles.
  - Percentage, pixel and other units for padding and margins. Using a multiple of a fixed unit can make styling more predictable and visually consistent.
  - Create React App is a pragmatic choice. However, it limits how much a reviewer can tell about your tooling abilities, such as webpack setup, bundling choices and CSS prefixing.
- [Radium](https://github.com/FormidableLabs/radium): Part of the tool chain for React component styling.
- [How do you apply vendor prefixes to inline styles in React?](https://stackoverflow.com/questions/32100495/how-do-i-apply-vendor-prefixes-to-inline-styles-in-reactjs)
- [Table or div?](https://www.sitepoint.com/community/t/which-is-best-tag-div-or-table/38911)
  - For appearance, neither. If it's tabular data (sequential content that relates to each other in a columnar way), use tables. Other than that, paragraphs, ordered lists, unordered lists, and wrap divs around those for hooks.
  - There is no replacement for a table tag when used with tabular data. Almost any other tag can be a replacement for div and you only use that if there isn't a more semantically appropriate alternative.

# [Reddit Beginners Thread](https://www.reddit.com/r/reactjs/comments/8gsxy0/beginners_thread_easy_question_may_2018/)

- Aim for as many functional components as possible. PureComponents?
- Even with Redux, you can still use component states to pass props between parent-child.
- `react-native`: Task #1 is to get the device emulators working.
- Use Jest to mock axios instead of using axios in your test.

# Musings, Rails

- Rails's `Time.now` (also `Date.current`) calculates time based on the server's clock. You can set it in `config/application.rb`. [Reference](https://stackoverflow.com/questions/5012815/time-now-from-server-instead-of-client-computers)
