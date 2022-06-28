---
layout: post
title:  "TIL, 2022-06-27, Actual Lazy Loading in a template"
date:   2022-06-27 08:30:39 +0800
categories: programming
summary: "Actual Lazy Loading in an Angular template"
---

- [CommonModule]: [Reference](https://github.com/angular/angular/blob/main/packages/common/src/common_module.ts)

# Lazy load Angular components
[Reference](https://medium.com/angular-in-depth/lazy-load-components-in-angular-596357ab05d8)

- ViewEngine adds all the necessary metadata to modules - but in Ivy, a Component can exist without a module.
- Ivy adds attributes like `type`, `selectors`, and everything it needs at runtime.
- ***Don't use async/await when you compile to es2017. Zone js can not patch native async/await statements. Therefore you might run into trouble with Change Detection. If you compile your code to es2017 you should use a .then handler with a callback function.***
- How to use Material/other components in the lazily-loaded component? Create a module inside it, declare `QuizCardComponent`, and import the modules we need.
- Reacting on events of lazy-loaded components:
  - The `EventEmitter` for the lazily loaded component will be subscribed to (since it's a `Subject`).
  - All lifecycle hooks get called, except `ngOnChanges`, since we manually update the input properties. To call `ngOnChanges` on the instance, we manually need to construct the `SimpleChanges` object.
- Comments: Is there a way to load a module at runtime based on metadata?

- `ViewChild read` property:
  - [Reference](https://stackoverflow.com/questions/37450805/what-is-the-read-parameter-in-viewchild-for)
  - This is basically just to know if you will get the `ElementRef` or something else.
  - If you don't provide the `read` parameter, VC will return the `ElementRef` instance if there is no component applied or the component instance if there is.

# Understanding ViewChildren, ContentChildren, and QueryList in Angular
[Reference](https://netbasal.com/understanding-viewchildren-contentchildren-and-querylist-in-angular-896b0c689f6e)

- The `@ViewChildren` decorator supports directive or component type as parameter, or the name of a template variable.
- `read` property needed to make sure you get a `ViewContainerRef`.
- `QueryList` is a fancy name for an object that stores a list of items.
- `ViewChildren` don't include elements that exist within the `ng-content` tag.
- `ContentChildren` includes only elements that exists within the `ng-content` tag.

# Angular Revisited: Tree-shakable components and optional `NgModules`
[Reference](https://dev.to/this-is-angular/angular-revisited-tree-shakable-components-and-optional-ngmodules-36d2)

- In the current Angular generation, a component can and must only be declared in a single `NgModule`. The `declarables` that can be used are determined at compile time from the metadata of its declaring Angular module.
- Transitive scopes:
  - Transitive compilation scope: All the declarables that the Angular module can use in its template.
  - Transitive exported scope: All the declarables in `exports`. It can also re-export other Angular modules by listing them in that same option.

```
@NgModule({
  declarations: [HeroComponent, HeroListComponent],
  imports: [CommonModule],
})
export class HeroModule {}
```

- This means that `HeroComponent` can reference `HeroListComponent` because it declares itself. And it can also use `NgIf` since it is importing `CommonModule`.
- [Reference](https://github.com/angular/angular/pull/27481) suggests that components itself will have those `deps`, thus bypassing Angular module.
- Local component scope: [Reference](https://github.com/angular/angular/discussions/43784)

- SCAM:
  - When looking at a SCAM, we only have to consider a single component to determine whether an Angular module import is in use.
  - Ex: A button with a cart and mat-button just uses `MatButton` and `MatIcon` as its deps.

- `renderComponent` to render?
