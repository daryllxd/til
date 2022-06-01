---
layout: post
title:  "TIL, 2022-05-07, React/Parcel"
date:   2022-05-07 13:19:00 +0800
categories: programming
summary: "React/Parcel"
---

# Hello World in React/Parcel

- Mission: Sheriff of Nottingham score calculator.
- Proposed stack:
  - Parcel and React.
  - Typescript
  - Simple React, possible no state management yet.
  - Possibly Tailwind for styling, or also possible to not have.
  - Possibly Adobe spectrum for UI components.
  - Possibly react-form-hooks for forms.
- First impressions:
  - Structuring front-end apps: Really weird. Is it by `components` or is it by feature? I think feature would be scalable.

# A 2021 guide about structuring your Next.js project in a flexible and efficient way
[Reference](https://dev.to/vadorequest/a-2021-guide-about-structuring-your-next-js-project-in-a-flexible-and-efficient-way-472)

- We can't just group things by `components` or `services` because at some point you'll end up with unrelated crap together.
- You can do `modules` but now you have to think of "which module is this in" or "is this big enough to warrant a module".
- Modules - include things that you feel should be a module. `common` directory should be used for everything that isn't a module.

- The ability to quickly add code without thinking much about where it should be (common).
- The ability to organize at your own pace when you feel like that thing has grown too big and all those pieces of code should be brought together (converting from common to modules).
- The ability to quickly find your code in your existing modules and to have an overview of how big a module is
