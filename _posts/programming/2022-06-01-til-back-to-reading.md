---
layout: post
title:  "TIL, 2022-06-01, Back to Reading"
date:   2022-06-01 11:10:52 +0800
categories: programming
summary: "Directives, Components, and Friends"
---

# How to Preload Angular Lazy Loaded Modules in the Background
[Reference](https://sachilaranawaka.medium.com/how-to-preload-angular-lazy-loaded-modules-in-the-background-cdd309f2a897)

- Situation: Load the next module after the main module gets loaded. So, at the time the user gets to interact with the lazy module, it's already there.

```
RouterModule.forRoot(
  appRoutes,
  {
    preloadingStrategy: PreloadAllModules
  }
)
```

- To customise which lazy modules they need to preload: `data.preload` set to true.

# Understanding the Difference Between Structural/Template and Regular Directives in Angular
[Reference](https://www.pluralsight.com/guides/understanding-the-difference-between-structuraltemplate-and-regular-directives-in-angular)

- Directives: Component directives, structural directives, and attribute directives.
- Component directives:
  - Class with the `@Component` decorator attached. Angular application should have at least 1 component, the root component.
  - Contains a selector, a template URL, and a style URL.
- Structural directives:
  - Used to manipulate the DOM behavior only.
  - Used to create or destroy the different DOM elements - that is, to add, modify, or delete any element permanently from the DOM tree.
- **Component directive is a directive that attaches the template and style for the element, along with specific behavior.**
- **Structural directive modifies the DOM element and its behavior by adding, changing, or removing the different elements.**

# Apply a directive conditionally
[Reference](https://stackoverflow.com/questions/44597077/apply-a-directive-conditionally)

- Passing `null` to an attribute removes it. Attributes can be conditionally added or removed.
- `When its the empty string ('') it becomes attr.md-raised-button="", when its null the attribute will not exist.`
- Adding an attribute via `createAttribute`. Can do `setAttribute`, it might be better as it is a Create or Update.

```
import { Directive, ElementRef, Input } from '@angular/core';

@Directive({
  selector: '[dynamic-attr]'
})
export class DynamicAttrDirective {
  @Input('dynamic-attr') attr: string;
  private _el: ElementRef;

  constructor(el: ElementRef) {
    this._el = el;
  }

  ngOnInit() {
    if (this.attr === '') return null;
    const node = document.createAttribute(this.attr);
    this._el.nativeElement.setAttributeNode(node);
  }
}
```

- **As already noted this does not appear to be possible. One thing that can be used to at least prevent some duplication is ng-template. This allows you to extract the content of the element affected by the `ngIf` branching.**
- Workaround:

```
<button *ngIf="!condition"></button>
<button *ngIf="condition" md-raised-button></button>
```

# How to redirect to an external URL from angular2 route without using component?
[Reference](https://stackoverflow.com/questions/40150393/how-to-redirect-to-an-external-url-from-angular2-route-without-using-component)

- Redirect Guard, but needs to have `externalUrl` in the route data. Seems to clunky for all the possible external URLs.

```
import {Injectable} from '@angular/core';
import {CanActivate, ActivatedRouteSnapshot, Router, RouterStateSnapshot} from '@angular/router';

@Injectable({
    providedIn: 'root'
})
export class RedirectGuard implements CanActivate {

  constructor(private router: Router) {}

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {

      window.location.href = route.data['externalUrl'];
      return true;

  }
}
```

```
{
     path: 'youtube',
     canActivate: [RedirectGuard],
     component: RedirectGuard,
     data: {
       externalUrl: 'https://www.youtube.com/'
     }
 }
```

- The Router can't redirect externally. An external resource can't be a state of the app.
- If it's only for clarity, keeping all the routes visible in the one spot, you could define another constant array with all the external paths in the same file as the routes.

# Angular For Beginners Guide - Components vs Directives
[Reference](https://blog.angular-university.io/angular-components-and-directives-for-beginners/)

- Example of a browser directive: the `input` element. If you enable Shadow DOM, it actually has built-in styles and internal implementations. The browser sort of implements it as a div with a border, and a special area that is detecting keyboard strokes and reflecting the changes on that input box.
- It looks like the browser internally composes HTML tags of other more primitive HTML tags and styles, like divs etc. until it reaches the very native rendering elements of the native operating system platform where its running.
- What is the Shadow DOM?
  - Is a hidden document sub-tree that can exist inside of what looks like a leaf component, such as an HTML input.
  - The browser has a built-in feature that seems very useful for creating new HTML elements from existing ones.
  - The combined specification of "giving a public XML-like API to an element of the page", "defining the look and feel of an element via HTML", "adding behaviour to that new element, and "styling while keeping those styles isolated", we can call that a **directive**.
- Angular core provides us with a JS-based mechanism that allows us to do almost anything that we could do with the internal browser "directive" mechanism.
- ***A component is simply a directive with a template.***
- Ex, if we wanted to do a simple "directive": `<my-input placeholder="Type your search"></my-input>`, it can have
  - An API: `my-input`.
  - A look and feel (the CSS).
  - A behavior - component methods.
- Angular's style isolation:
  - Styles defined inside this component are also isolated from the main page.
  - Angular will transparently increase the specificity of the styles so that they take precedence over external styles present on the page, by adding an attribute selector to all the component styles.
- Angular Core is the toolkit for extending the browser with our own HTML elements, with their own API, look and feel behavior.
- It is designed to **extend** HTML instead of replacing it, by providing a JS implementation of some functionality that was originally available as an internal browser composition mechanism.
