---
layout: post
title:  "TIL, 2022-07-20"
date:   2022-07-20 01:16:25 +0800
categories: programming
summary: "Where I..."
---

# Everything you need to know about the `ExpressionChangedAfterItHasBeenCheckedError` error
[Reference](https://hackernoon.com/everything-you-need-to-know-about-the-expressionchangedafterithasbeencheckederror-error-e3fd9ce7dbb4)

- During change detection, Angular performs checks for each component:
  - Update bound properties for all child components/directives.
  - Call `ngOnInit`, `ngOnChanges` and `ngDoCheck` lifecycle hooks on all child components/directives.
  - Update DOM for the current component.
  - Run CD for the child component.
  - Run `ngAfterViewInit` lifecycle hook for all child components/directives.
- After each operation, Angular remembers what values it used to perform an operation. They are stores in the `oldValues` property of the component view. After the checks have been done, Angular starts the next digest cycle.
- Causes of value change:
  - Almost always, it's the child component, wh

# Filter out nulls in array
[Reference](https://stackoverflow.com/questions/43118692/typescript-filter-out-nulls-from-an-array)
