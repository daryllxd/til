---
layout: post
title:  "TIL, 2022-10-07"
date:   2022-10-07 14:13:45 +0800
categories: programming
summary: "Function calls in Angular Templates"
---

# It's OK to use function calls in Angular templates!
[Reference](https://itnext.io/its-ok-to-use-function-calls-in-angular-templates-ffdd12b0789e)

- Use a pipe: Angular will re-run the transform method of the pipe only if the parameters we pass to it have changed.
- Angular really just checks if something has changed via `Object.is`. So if the "object didn't change, then the object wouldn't be re-evaluated".
- The "memoization code": Checks if an argument changed, if yes then re-run the function, else don't.

```
// Function defined here
export function memo<T extends Function>(fnToMemoize: T): T {
  let prevArgs = [{}];
  let result;

  return function (...newArgs) {
    if (hasDifferentArgs(prevArgs, newArgs)) {
      result = fnToMemoize(...newArgs);
      prevArgs = newArgs;
    }

    // Don't run the function if the result didn't change
    return result;
  } as any;
}

function hasDifferentArgs(prev: unknown[], next: unknown[]) {
  if (prev.length !== next.length) return true;
  for (let i = 0; i < prev.length; i++) {
    if (!Object.is(prev[i], next[i])) return true;
  }
  return false;
}
```

- It actually works, but you can't use it twice, because the cache will break.

- Learnings:
  - `ViewChild` - can query by directive but can also query by a provider defined on a component or a directive. [Reference](https://stackoverflow.com/questions/49162473/what-are-all-the-valid-selectors-for-viewchild-and-contentchild)
  - Why use @ViewChild over `getElementById`? [Reference](https://www.reddit.com/r/Angular2/comments/6pip2x/why_use_viewchild/)
    - Because Angular isn't made to just run in a browser. For example you can run Angular in a web worker and web workers do not have direct access to the DOM. Think about other platforms where angular can run, native desktop and native mobile for example.
    - That's why they've added DOM abstraction, the framework will figure out how to access the element you want to select depending on the platform.
    - `ViewChild` can grab directives, it can grab reference to another component's controller.
    - `ViewChild` is not a DOM selectors, and it's done with `ElementRef` and `Renderer2`.
    - The compiler thinks about how class member x is related to DOM element X.
  - Angular pipe - get current element reference [Reference](https://stackoverflow.com/questions/47538701/angular-pipe-get-current-element-reference)
    - With `pure: true`, there is only one instance of the pipe class created per component.
    - With `pure: false`, one per **use of the pipe in the components HTML.**
    - `el: ElementRef` will only get the reference to the component in which the pipe is used in.

``` ts
<input #inputEl type="text" value="'my-translation-key' | translate: inputEl" />

export class TranslatePipe implements PipeTransform {
    transform(key: string, element?: any): string {
        // Element was marked by #inputEl template variable.
        element.dataset.translationKey = key;
    }
}
```

