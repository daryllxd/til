---
layout: post
title:  "TIL, 2022-01-13, `trackBy`, `InjectionToken`"
date:   2022-01-13 20:23:32 +0800
categories: programming
summary: "`trackBy`, `InjectionToken` factory"
---

https://stackoverflow.com/questions/57086672/element-implicitly-has-an-any-type-because-expression-of-type-string-cant-b

# Angular 2 — Improve Performance with `trackBy`
[Reference](https://netbasal.com/angular-2-improve-performance-with-trackby-cc147b5104e5)

- If we need at some point to change the data in the collection, we'll have a problem because Angular can't keep track of items in the collection and has no knowledge of which items have been removed or added.
- Angular needs to remove all the DOM elements and create them again.
- `trackBy` takes the index and current item as arguments and needs to return the unique identifier for the item.

```
@Component({
  selector: 'my-app',
  template: `
    <ul>
      <li *ngFor="let item of collection;trackBy: trackByFn">{{item.id}}</li>
    </ul>
    <button (click)="getItems()">Refresh items</button>
  `,
})
export class App {

  constructor() {
    this.collection = [{id: 1}, {id: 2}, {id: 3}];
  }

  getItems() {
    this.collection = this.getItemsFromServer();
  }

  getItemsFromServer() {
    return [{id: 1}, {id: 2}, {id: 3}, {id: 4}];
  }

  trackByFn(index, item) {
    return index; // or item.id
  }
}
```

- Selenium tests get stale element exceptions because the full component is re-rendered instead of just the changed parts.
- If you have a menu within one of the inner components (card), and it was open, when the component gets re-rendered, the menu will close because that was internal state of the card component that was re-rendered.
- Haven't tried it by myself, but maybe there will be a problem with `trackBy` when the ID of an object of your list didn't change but one of its properties actually did. In that case I would guess that the modified property will not be reflected in the DOM.
- Default "inject" - combination of logical nullish assignment + `@Optional`.  `constructor(@Optional() @Inject('env') private env: string) { this.env ??= 'development'; }`

# The Hidden Power of `InjectionToken` Factory Functions in Angular
[Reference](https://netbasal.com/the-hidden-power-of-injectiontoken-factory-functions-in-angular-d42d5575859b)

- Injecting something that is based on a different injector/default injector: `https://angular.io/api/core/InjectFlags`

```
const ENVIRONMENT = new InjectionToken<string>('environment token', {
  factory(): string {
    // @ts-ignore - This is how to use string injector
    const providedEnv = inject('env', InjectFlags.Optional) as string;

    return providedEnv || 'development';
  }
});

@Injectable({
  providedIn: 'root',
})
export class CartItemTransformService {
  constructor(@Inject(ENVIRONMENT) private env: string) {
  }
```

```
import { inject, InjectionToken, InjectFlags } from '@angular/core';

const MY_PROVIDER = new InjectionToken('', {
  factory: () => {
    const optional = inject(SomeProvider, InjectFlags.Optional);

    return optional ?? fallback;
  },
});
```

- Benefits of `InjectionToken` factory function are:
  - Provider is tree-shakeable, since we don't need to inject it in our app module as we'd do with the `useFactory` provider.
  - Using `inject()` to request a provider is faster and more type-safe than providing an additional array of dependencies.
  - The provider has a single responsibility, and our components are injected only with the data they need. -> As opposed to Service?
  - It makes testing more straightforward.
- Question: Unit testing of `InjectionToken`?

# Angular: Dependency Injection vs. Static methods
[Reference](https://javascript.plainenglish.io/angular-dependency-injection-vs-static-methods-2191fc08e078)

- Recording all providers in the root module makes a sync component effect in which if a component changes a property within the service, all the other components can access the same value of the property.
- In this situation, all components under a specific sub-module will have the same service and all value properties. However, this is completely unlinked to the service injected in the other sub-module so as to lose the sync effect across the application, keeping it only in the submodule branch.
- We should analyze case by case but as a main rule, it’s recommended that if a method can grow in complexity and dependencies can be necessary, it’s better you start your code by dependency injection.
