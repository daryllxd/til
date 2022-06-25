---
layout: post
title:  "TIL, 2022-06-24, ng-content and compound components"
date:   2022-06-24 11:15:27 +0800
categories: programming
summary: "ng-content and compound components"
---

# `ng-content` and compound components practice

- Multiple ng-content can be done with different `select` on the parent component. [Reference](https://stackoverflow.com/questions/52638718/multiple-ng-content)
- This is needed if you need the child component:

```
  <ng-content select="rd-empty-state-title"></ng-content>
  <ng-content select="rd-empty-state-text"></ng-content>
```

- Simple `<ng-content></ng-content>` child components can work, too.
- `ContentChild` is needed if you want to control HTML projected inside the component. This uses `afterContentInit` hook.
