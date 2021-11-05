---
layout: post
title:  "TIL, 2021-11-04"
date:   2021-11-04 11:02:47 +0800
categories: programming
summary: "Technical Debt Angular"
---

# Angular Basics: The Scope of This and Arrow Functions
[Reference](https://www.telerik.com/blogs/angular-basics-scope-of-this-and-arrow-functions)

-

# Resolving common technical debt to speed up Angular development
[Reference](https://www.devbridge.com/articles/resolving-common-technical-debt-to-speed-up-angular-development/)

- `TestingCommonModule` - was mocking all possible dependencies and injecting them into the test.
- `ng-bullet`.
- Log tests by execution time - `karma-spec-reporter` - figure out if we can do with Jest?
- `npm cache` speed.
- Streamline wrapping components - to get rid of a UI library, need to wrap it first and update the usage of the component.
- Git hooks:
  - husky - ran formatting, linting checks, pre-push hook.
  - prettier - check code against formatting rules, fixed issues with few npm commands.
  - Stylelint and codelyzer.

# Reading

- CSS isolate - [Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/isolation).
