---
layout: post
title:  "TIL, 2022-06-10, React in Angular"
date:   2022-06-10 10:58:52 +0800
categories: programming
summary: "React in Angular"
---

# UNDERSTANDING THE INTRICACIES OF ANGULAR’S ASYNC PIPE
[Reference](https://www.lucidchart.com/techblog/2019/10/14/angulars-async-pipe-intricacies/)

- As part of loading the LC editor, document information is retrieved from the servers. This information includes the ID of the status assigned to the document and some status definitions.

```
<lucid-drop-down
    *ngIf="hasStatus()"
    [options]="definitionsPromise | async"
></lucid-drop-down>
```

- If `definitionsPromise` depends on `hasStatus`, then if `hasStatus` returns true, I can be sure the menu options were ready.
- Promise - it has two methods, `.then` and `.catch`. If the `Promise` resolves successfully, then any callbacks passed to `.then` are run, and if the `Promise` is rejected or has an error, `.catch` is executed.
- Async pipe.

# Should you wrap your UI Component Library?
[Reference](https://medium.com/@TimHolzherr/should-you-wrap-your-ui-component-library-42dfc41df828)

- Reduce API surface - the wrapper will expose the functionality which you want to be used in your application.
- App-wide changes - a change in all instances of a specific component will become easy.
- Replacing the component library if needed - you can theoretically replace it with another component library if ever. (This is in theory, since replacing the UI component library is costly anyways).
- Arguments against - the usage of the component is always different. Then the wrapper will be a copy of the component and is not helpful at all.
- Suggested to create the wrapper mid-way through the project.
- Implementing wrapper: Use `ControlValueAccessor`.

# Embedding React Components in Angular (the Easy Way)
[Reference](https://medium.com/@zacky_14189/embedding-react-components-in-angular-the-easy-way-60f796b68aef)

- What must work: prop bindings, change detection. Styling. React components are unaware of being embedded inside Angular.
- Should be incorporated into the same source project with dev/build pipelines.
- How?

```
"dependencies": {
    ...
    "react": "^16.12.0",
    "react-dom": "^16.12.0",
    ...
  },
"devDependencies": {
    ...
    "@types/react": "^16.9.17",
    "@types/react-dom": "^16.9.4",
    ...
}
```

- Bridge/Wrapper component
  - tsx extension.
  - The wrapped component's styles are in `styleUrls` in `@Component`.
  - Wrapper view changed to `ViewEncapsulation.None`.
  - Input/Output mirror React props.
  - Placeholder element ref created to mount the React component into.
  - Lifecycle hooks `ngOnChanges` and `ngAfterViewInit` are implemented to render and re-render the React component.
  - Lifecycle hook `ngOnDestroy` unmounts the React component when the Angular wrapper component is destroyed.
