---
layout: post
title:  "TIL, 2022-06-07"
date:   2022-06-07 15:55:48 +0800
categories: programming
summary: "Where I..."
---

# A Complete Guide To CSS Variables [With Examples]
[Reference](https://www.lambdatest.com/blog/guide-to-css-variables-with-examples/)

- Initialising - `--my_font: 20px;`. Using: `selector { font-size : var(--my_font); }`.
- SASS variable: Static allocation, needs Sass, media queries not supported.
- CSS variable: Dynamic allocation, support for media queries, preprocessor not required, single-layer and direct variable management.
- Global vs local scope: `:root`.

```
:root {
--my_variable: <value>
}

```

- Local scope: bind inside a selector.
- If browser doesn't support, then it ignores the rule.
- If the variable wasn't initialised, then use the fallback `(background-color: var(--my_bg, black))`.


# Angular v14 is now available!
[Reference](https://blog.angular.io/angular-v14-is-now-available-391a6db736af)

- Angular standalone components - aim to streamline the authoring of Angular apps by reducing the need for NgModules.

```
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
    ImageComponent, HighlightDirective, // import standalone Components, Directives and Pipes
    CommonModule, MatCardModule // and NgModules
  ],
  template: `
    <mat-card *ngIf="url">
      <app-image-component [url]="url"></app-image-component>
      <h2 app-highlight>{{name | titlecase}}</h2>
    </mat-card>
  `
})
export class ExampleStandaloneComponent {
  name = "emma";
  url = "www.emma.org/image";
}
```

- Typed Angular forms
- Page title accessibility - with custom `TitleStrategy`.
- Nullish
