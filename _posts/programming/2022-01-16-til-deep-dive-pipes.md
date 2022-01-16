---
layout: post
title:  "TIL, 2022-01-16, Pipes"
date:   2022-01-16 08:38:43 +0800
categories: programming
summary: "Weekend Reading"
---

# Weekend Reading about Pipes

## Experiment: Injecting A Component Reference Into A Pipe Instance In Angular 6.0.0
[Reference](https://www.bennadel.com/blog/3443-experiment-injecting-a-component-reference-into-a-pipe-instance-in-angular-6-0-0.htm)

- DI token that would explicitly provide the `Component` to the `FnPipe`.

```
// I provide a dependency-injection token for the Fn pipe execution context.
export class FnPipeContext {
  // ...
}

@Pipe({
name: "fn",
pure: true
})
export class FnPipe implements PipeTransform {

  private context: any;

  // I initialize the fn-pipe.
  // --
  // NOTE: We are injecting an OPTIONAL context for function execution.
  constructor( @Optional() @Self() context: FnPipeContext ) {

    this.context = context || null;

  }

  // ---
  // PUBLIC METHODS.
  // ---

  // I pass the first and rest arguments to the given function reference. This pipe
  // is designed to be used in a template to access a component method:
  // --
  // In a template: {{ valueA | fn : componentMethodRef : valueB }}
  // --
  // ... becomes the invocation: context.componentMethodRef( valueA, valueB ).
  public transform(
      headArgument: any,
      fnReference: Function,
      ...tailArguments: any[]
      ) : any {

    // Due to the way pipes receive arguments, we can have inputs on both sides of
    // the function reference. As such, let's join the two input sets when invoking
    // the given Function reference.
    return( fnReference.apply( this.context, [ headArgument, ...tailArguments ] ) );

  }

}
```

- Getting the component reference - can be done with `{ provide: FnPipeContext, useClass: AppComponent }`
- View provider is telling the component's local injector to use an instance of `AppComponent` as the injectable value for `FnPipeContext`.
- You can inject an instance of `ChangeDetectorRef` and it has `ViewRef` which contains a property "context" which is the instance of the component in which the pipe is being used.
- This would allow you to bind to the component instance without any special providers being set up. On the downside it's a bit hacky because the `ChangeDetectorRef` type itself does not have the "context" property.
- [Reference](https://www.bennadel.com/blog/3325-understanding-pipe-instantiation-life-cycles-in-angular-4-2-3.htm)
  - An impure Pipe can have unique state for every instance of the Pipe, whereas a pure Pipe can only have unique state for every parent context.
- Provider vs `ViewProvider` [Reference](https://stackoverflow.com/questions/35888434/what-are-viewproviders-in-angular-and-what-is-the-difference-b-w-providers-vs-v)
  - You'd really just use this if there was content projected - this limits the provider to children other than projected content, while providers allows all children to use the provider.
  - If we want to have one instance of a service per component, and shared with all the component’s children, we configure it on the providers property on our component decorator. Child is a view children.
  - If we want to have one instance of a service per component, and shared with only the component’s view children and not the component’s content children, we configure it on the `viewProviders` property of our component decorator.

- Generic pipe: [Reference](https://github.com/nigrosimone/ng-generic-pipe/blob/master/projects/ng-generic-pipe/src/lib/ng-generic-pipe.pipe.ts)
- A collection of pipes: [Reference](https://github.com/danrevah/ngx-pipes)
- Filtering pipe: [Reference](https://github.com/VadimDez/ngx-filter-pipe/blob/master/src/app/shared/ngx-filter-pipe/ngx-filter.pipe.ts)

I like this API:

```
transform(array: any[], filter: any): any {
  if (!array) {
    return array;
  }

  switch (typeof filter) {
    case 'boolean':
      return array.filter(this.filterByBoolean(filter));
    case 'string':
      if (FilterPipe.isNumber(filter)) {
        return array.filter(this.filterDefault(filter));
      }
      return array.filter(this.filterByString(filter));
    case 'object':
      return array.filter(this.filterByObject(filter));
    case 'function':
      return array.filter(filter);
  }
  return array.filter(this.filterDefault(filter));

```

- `isFinite` is a thing? [Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/isFinite)
