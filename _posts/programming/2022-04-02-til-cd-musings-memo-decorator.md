---
layout: post
title:  "TIL, 2022-04-02, CD Musings, memo-decorator"
date:   2022-04-02 13:01:23 +0800
categories: programming
summary: "CD Musings, memo-decorator"
---

# Musings

- `closest` method traverses the Element and its parents until it finds a node that matches the provided selector. If no element matches, the `closest()` method returns `null`.
- How to use `trackBy` with `ngFor` [Reference](https://stackoverflow.com/questions/42108217/how-to-use-trackby-with-ngfor)
  - On each `ngDoCheck` triggered for the `ngForOf`, Angular checks what objects have changed. It uses differs for this process and each differ uses the `trackBy` function to compare the current object with the new one.
- Prevent angular component from re-rendering unless data has changed [Reference](https://stackoverflow.com/questions/68205141/prevent-angular-component-from-re-rendering-unless-data-has-changed)
- Looking at it from the other side. Every `setTimeout` can actually rerender tons of components (the ones with the default change detection strategy). If you know in advance that it doesn't need to rerender any components, you could in fact block that as well:


```
onInit() {
  let counter = 0;
  setInterval( () => {
    // this is something an OnPush strategy won't detect.
    counter++;
    this.counter$.next(counter);
  }, 1000);
}
```

- `Change detection doesn't fire in setTimeout with ChangeDetectionStrategy.OnPush` [Reference](https://stackoverflow.com/questions/45281469/change-detection-doesnt-fire-in-settimeout-with-changedetectionstrategy-onpush)
  - Really good question.
  - The bound click event will mark the component and its ancestors as dirty.
  - After `onClick()`, Angular will call `ApplicationRef.tick()` to do CD. `setTimeout` hasn't executed yet.
  - After CD completes, components are no longer dirty, then `setTimeout` executes.
  - The CD cycle works before `setTimeout` works.
- `HTMLElement.focus()` - this works by itself but Angular has `focusMonitor`.
- Getting the `activeElement` [Reference](https://stackoverflow.com/questions/52531250/how-to-get-the-active-element-the-focused-one-on-angular-6)
  - `document.activeElement`.
  - Can create a directive that has `HostListener` on `focus`.

```
@Directive({
  selector: '[componentFocus]'
})
export class ComponentFocus {
  @HostListener('focus')
  componentFocus() {
    console.log(`component has focus, element:`, this.el);
  }

  constructor(private el: ElementRef) {
  }
}
```

  - Or use `on-focus`.
- Checking if two vars have the same reference? [Reference](https://stackoverflow.com/questions/13685079/how-to-check-if-two-vars-have-the-same-reference) `Object.is` was added in ES2015. Or do the triple equals.

# How do I manually trigger change detection in Angular?
[Reference](https://blog.briebug.com/blog/how-do-i-manually-trigger-change-detection-in-angular)

- True "manual" change detection would be `OnPush` + `detectChanges`, `detach`, and `markForCheck()` in the components.
- When `OnPush` change detection is enabled, Angular will not detect changes by analyzing each template expression. It will only detect changes to `@Input` values as a whole, not the properties of an object.
- Using `OnPush`, Angular will only check "when notified". Scenarios:
  - `@Input` reference has changed. *Angular compares the object reference, not individual properties. This is why immutable data is the way to go. Every time you change your data, you're making a copy with a new object reference.*
  - Component or its children raise an event.
  - A bound observable in the template changes.
  - Manual via (detectChanges()).
    - `detectChanges` immediately runs change detection.
    - `markForCheck()` temporarily adds that component and its children to the default Angular change detection for one cycle.

# memo decorator with Angular Pipe
[Reference](https://suneetbansal.medium.com/memo-decorator-with-angular-pipe-big-performance-boost-57d89b0a9758)
[Reference](https://github.com/mgechev/memo-decorator)

- `memo-decorator` enhances the caching of pipe's `transform`. Makes the pipe share results for all methods of that pipe.
- [Reference](https://github.com/mgechev/memo-decorator/issues/11) - the method is bound to the prototype, not to the instance. This fails for some but works for some.

# debounce
[Reference](https://www.joshwcomeau.com/snippets/javascript/debounce/)

```
const debounce = (callback, wait) => {
  let timeoutId = null;
  return (...args) => {
    window.clearTimeout(timeoutId);
    timeoutId = window.setTimeout(() => {
      callback.apply(null, args);
    }, wait);
  };
}
```

- Lodash would help, but this means you have 1 more utility library, plus you're reducing reliance on third-party code.
- React: `useMemo`.
- Pass in a callback function.
  - Cancel any pre-existing timeout.
  - Schedule a new timeout, based on the amount of time indicated by the `wait` argument.

# How to Inject Document in Angular
[Reference](https://dev.to/ngconf/how-to-inject-document-in-angular-3d1m)

# Accessibility Made Easy with Angular CDK
[Reference](https://netbasal.com/accessibility-made-easy-with-angular-cdk-1caaf3d98de2)
