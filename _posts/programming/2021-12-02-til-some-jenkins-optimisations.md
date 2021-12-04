---
layout: post
title:  "TIL, 2021-12-02, Jenkins optimisations"
date:   2021-12-02 20:05:38 +0800
categories: programming
summary: "Jenkins optimisations"
---

- Jenkins: Is written in Groovy.
  - Groovy string interpolation done with "" strings, not ''.
  - `env.BRANCH_NAME` to get the branch. Just this line can speed a lot of the CI up.
- Default inputs in Angular: [Reference](https://ultimatecourses.com/blog/passing-data-angular-2-components-input)
  - Something to think about: [Reference](https://medium.com/@edenpessach/whats-to-angular-s-lifecycle-hooks-and-inputs-default-values-68dd535afa1)
  - Setting a default value to a component input doesn't prevent it being override with an empty value from it’s container.
- `process.exit` to exit a Node program.
