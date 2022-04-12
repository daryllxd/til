---
layout: post
title:  "TIL, 2022-04-11"
date:   2022-04-11 14:33:58 +0800
categories: programming
summary: "Contemporary Front-end Architectures, React"
---

# Contemporary Front-end Architectures
[Reference](https://blog.webf.zone/contemporary-front-end-architectures-fb5b500b0231)

- Reasoning about the Data Flows within different components of a software system is the central idea of software architecture.
- *The struggle of software architecture is to provide reasonable means to compose the software without losing sanity.*
- The data of the software is The Model or *The Application State* (or Domain Model or Business Logic).
- Father's MVC:
  - Separate presentation (View) from domain concerns (Model).
  - MVC was only meant for desktop application (Web was not born yet).
  - Controller object - respond to user inputs like keyboard and mouse and translate into actions on the model.
  - View/controller would exist as a pair - the view part of the pair would show user output/controller part of the pair would receive inputs from the user.
  - View/controller contain a direct reference to model, but not vice-versa.
  - Model implements observer pattern and one or more View objects subscribe to it.
- Application Model
  - Changing the color of a label - is this a model, or a view?
    - Model - awkward. View - then view is not generic.
  - Presentation model - a self-contained class that represents all the data and behaviour of the UI window, but without any of the controls used to render that UI on the screen.
- MVP - Model-View-Presenter - Presenter oversees the presentation logic. View subscribes to the model and relies on Presenter for complex logic. (Not really used?)
- Model View ViewModel or Model View Binder
  - ViewModel is an object that exposes bind-able properties and methods which are consumed by the view.
  - Every time a property on ViewModel changes, View is automatically updated to reflect the changes on the UI.
  - This is the basis of many front-end libraries (Knockout, Angular, Vue, React).
- Web MVC
  - *The struggle of large scale web app architecture is determining what part of the code should execute where. Either we have server-driven apps or rich client-driven apps. Between the two, we can mix-match in endless ways.*
  - Three data cycles:
    - Server-side MVC (Rails)
    - Browser's internal MVC (Chrome)
    - Front-end MVC (Angular)
  - Web's view cycles
    - Client view cycle (such as a scroll-event) and server view cycle such as a page refresh.
  - Server-side MVC + JS.
- Rich Internet Application (RIA)
  - Back-end is usually API.
  - Flash/Flex/Silverlight were early solutions.
  - AJAX is the glue to connect client/server.
- DOM-infused Algorithms
  - JQuery doesn't address architectural concerns. It just provides a browser-agnostic API. (Also, it's still the same server-side MVC).
  - Backbone - Extended server-side MVC/REST by complimenting it.
  - Knockout - Implementing View layer with declarative data bindings. Allow us to automatically update DOM whenever ViewModel changes. Has Observable which tracks dependencies between ViewModel props.
- Angular 1
  - SPA is a first-class citizen. It's a framework.
  - Model, View, and ViewModel objects.
  - Data binding, change detection.
  - Module system. Injector is service locator.
  - DI: Model is implemented via Service.
  - Problems: Namespace collision, bidirectional data-bindings - this creates a lot of spaghetti code (solved by React). Weird dev UX.
- Contemporary front-end architecture changes:
  - Web is not just desktop machines.
  - JS is a full-blown language now.
  - File system, camera, PWA< hardware sensors.
  - User experience is so important.
  - Streaming/video-on-demand.
  - Elm, PureScript, ReasonML make JS a target language instead of using it as a source language.
- Core Principles of Today's Front-end Architectures
  - *Data flow takes the center stage.* We should understand how data is flowing in the application. This is the most important goal of the software architecture.
    - Separating state/view - Redux, Vuex, Ngrx.
  - *Component-based Architecture.* View state needs to be close to an actual view.
    - What is the atomic unit of UI development. *What is the best way to share a UI functionality? Sharing a UI functionality means it could share - structure, style, behavior, and business logic.*

# React Advanced Guides - Accessibility
[Reference](https://reactjs.org/docs/accessibility.html)

- All `aria-x` HTML attributes are fully supported in JSX. Attributes should be hyphen-cased.

```
<input
  type="text"
  aria-label={labelText}
  aria-required="true"
  onChange={onchangeHandler}
  value={inputValue}
  name="name"
/>
```

- Sometimes we break HTML semantics when we add `div` elements in JSX to make our React code work, especially when working with lists (`ol`, `ul`, and `dl`). Use React Fragments to group together multiple elements.
- Labelling HTML form controls - `htmlFor`, accessible elements, labelling elements, and explaining accessible names.
- Programmatically managing focus:
  - Create a `ref` using `React.createRef()`, then do a `this.textInput = React.createRef()`, and then use that callback to store a reference to the text input. Now we can do `this.textInput.current.focus()` (to get the DOM node).
  - If a parent component needs to set focus to an element in a child component, then expose DOM refs to parent components through a special prop on the child component, and forward that ref to the child's DOM node.
- Mouse and pointer events:
  - Typically implemented by attaching a `click` event to the `window` object that closes the popover.
- Setting the language?
- Setting the document title?
- Color contrast?
- Development/testing tools: `Accessibility Engine` or AXE - an accessibility inspector browser extension. WebAIM WAVE. A11y tree.

# React Advanced Guides - Code-Splitting

- `import()` syntax for Webpack. Babel - can parse the dynamic import syntax, but don't transform it.

```
import("./math").then(math => {
  console.log(math.add(16, 26));
});
```

- `React.lazy()` - lets you render a dynamic import as a regular component.
  - `const OtherComponent = React.lazy(() => import('./OtherComponent'));` vs `import OtherComponent from './OtherComponent';`
  - React Suspense - allows to show fallback content while waiting for the lazy component to load.
  - Avoiding fallbacks: Use `startTransition` API to make React not do a glimmer when swapping from tabs.
- Error boundaries - You can handle these errors to show a nice user experience like this:

```
import React, { Suspense } from 'react';
import MyErrorBoundary from './MyErrorBoundary';

const OtherComponent = React.lazy(() => import('./OtherComponent'));
const AnotherComponent = React.lazy(() => import('./AnotherComponent'));

const MyComponent = () => (
  <div>
    <MyErrorBoundary>
      <Suspense fallback={<div>Loading...</div>}>
        <section>
          <OtherComponent />
          <AnotherComponent />
        </section>
      </Suspense>
    </MyErrorBoundary>
  </div>
);
```

- Route-based code splitting: React-Router with `React.lazy`.

# React Context

# Labelling Elements
[Reference](https://www.w3.org/WAI/tutorials/forms/labels/)
[Reference](https://webaim.org/techniques/forms/controls)
[Reference](https://www.tpgi.com/what-is-an-accessible-name/)

# User Notification of Alerts
[Reference](https://www.w3.org/WAI/tutorials/forms/notifications/)
[Reference](https://webaim.org/techniques/formvalidation/)

# Skip Links
[Reference](https://webaim.org/techniques/skipnav/)
