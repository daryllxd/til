---
layout: post
title:  "TIL, 2021-12-29, NgRx selector test,s `SharedModule`"
date:   2021-12-29 10:06:29 +0800
categories: programming
summary: "NgRx selector, `SharedModule`"
---

# How I test my NgRx selectors
[Reference](https://timdeschryver.dev/blog/how-i-test-my-ngrx-selectors)

- What is a selector?
  - A selector is a pure function that takes the state as an argument and returns a slice of the store state.
  - Because selectors are pure functions, it can optimise itself via memoization.
  - What to test: Just test the ones with logic in them.
- Ways of testing
  - `toBe` - just returning a slice of store state - getter.
  - Snapshot
  - Projector - Use `projector` function to skip execution from other selectors and pass their outputs to the selector.

# Angular 2: Difference between property binding with and without brackets?
[Reference](https://stackoverflow.com/questions/42977101/angular-2-difference-between-property-binding-with-and-without-brackets)

- Template syntax.
- Omit the brackets when these are true:
  - Target property accepts a string, the string is fixed, and this initial value never changes.
  - The brackets, [], tell Angular to evaluate the template expression. If you omit the brackets, Angular treats the string as a constant and initializes the target property with that string.
    - So in the translation case, we do want to treat it not as a constant.
- When you use square brackets, the right hand side is an expression. When you use no brackets at all, the right hand side is a constant.
- Interpolation vs brackets?

# Eliminating Shared Module(s)
[Reference](https://medium.com/@peter.palocz91/eliminating-shared-module-s-9a5ed803c994)

- Where do the boundaries exist within a split shared module? And what happens if I create a smaller `SharedModule` for Feature X and Feature Y?
- "For each component, we create an `NgModule` that imports only the declarables used by that specific component. Likewise, it only declares and exports that single component."
- Later on, when Ivy renderer is out, I can ditch the module file and put all the dependencies into a component file:

```
import { NgIf } from '@angular/common';
import { MatSelect, MatOption, MatFormField } from '@angular/material';

@Component({
  selector: 'app-backup-selector',
  templateUrl: './backup-selector.component.html',
  styleUrls: ['./backup-selector.component.scss'],
  deps: [
    NgIf,
    MatSelect,
    MatOption,
    MatFormField
  ]
})
export class BackupSelectorComponent implements OnInit {}
```

- SCAM makes it easier to migrate to the Ivy renderer.
- For new applications I recommend not using Shared Module at all, but using a shared folder which contains all the SCAMs imported by other Feature modules instead.

# Your Angular Module is a SCAM!
[Reference](https://medium.com/marmicode/your-angular-module-is-a-scam-b4136ca3917b)

# A Scalable Angular Project Structure
[Reference](https://medium.com/marmicode/a-scalable-angular-project-structure-63aca36a6cbc)

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
  - Sure, it is a bit more work but I actually started doing this in most places anyways. It makes it easier to maintain a current list of declarable dependencies to keep a small bundle size.
  - When looking at a SCAM, we only have to consider a single component to determine whether an Angular module import is in use.
  - The goal:
    -
