---
layout: post
title:  "TIL, 2022-04-12, Angular ViewChild"
date:   2022-04-12 10:43:57 +0800
categories: programming
summary: "Angular ViewChild"
---

# Angular API - ViewChildren
[Reference](https://angular.io/api/core/ViewChildren)

- Use to get the `QueryList` of elements or directives from the view DOM. Any time a child element is added, removed, or moved, the query list will be updated, and the changes observable of the query list will emit a new value.
- Metadata properties:
  - `selector` - the directive type or the name used for querying.
  - `read` - used to read a different token from the queried elements.
  - `emitDistinctChangesOnly` - will emit new values only if the QueryList result has changed.
- Selectors are supported:
  - Any class with the `@Component`/`@Directive` decorator.
  - Template reference variable as a string (e.g. `<my-component #cmp></my-component> with @ViewChildren('cmp')`).
  - Any provider defined in the child component tree of the current component.
  - A `TemplateRef` (e.g. query `<ng-template></ng-template> with @ViewChildren(TemplateRef) template;`)

# The Angular @ViewChild decorator
[Reference](https://dev.to/angular/the-angular-viewchild-decorator-424c)

- Decorator pattern - allows to add behavior to a class or a class member dynamically - changing the behavior of a class at the instantiation of an object, without changing behavior of future instantiation.
- Angular's @ViewChild decorator can be applied on a property and allow to configure a view query.
- Angular will use the selector to try to find the *first matching element* in the template.
- Component or directive:

```
@Component({
  selector: 'user-card'
})
export class UserCard {
  @Input() firstName: string;
  @Input() lastName: string;
  @Input() age: number;
}

@Component({
  selector: 'myComp',
  template: `
    <user-card [firstName]="'Roger'" [lastName]="'Dupont'" [age]="53">
    </user-card>
  `
})
export class MyCompComponent {
  @ViewChild(UserCard, { static: false }) userCard: UserCard;
}
```

- Template reference variable as a string:

```
@Component({
  selector: 'my-comp',
  template: `
    <div #someElement></div>
  `
})
export class MyCompComponent {
  @ViewChild('someElement', { static: false }) someElement: ElementRef;
}
```

- TemplateRef

```
@Component({
  selector: 'my-comp',
  template: `
    <ng-template></ng-template>
  `
})
export class MyCompComponent {
  @ViewChild(TemplateRef, { static: false }) someTemplate: TemplateRef;
}
```

- `static` parameter - tell Angular if the query should be ran statically or dynamically. But what does it change in practice? Basically, it changes when the view query will resolve - can retrieve view query results in `ngAfterViewInit` to ensure that query matches that depend on binding resolutions are ready and thus will be found by the query.
- Setting `static` to true allow this behavior to access the view query results in the `ngOnInit` lifecycle hook, but it only works for queries that can be resolved statically.
- `read` parameter: how we want to access that element type.
  - `@ViewChild(UserCard, { read: ElementRef, static: false })` - get the `UserCard`, but access it as an `ElementRef`.
  - `ViewContainerRef` - allows to get the element as a container - when we want or need to manipulate the DOM.
  - `ViewChldren` - when we want to get the list of all matching elements.
