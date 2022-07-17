---
layout: post
title:  "TIL, 2022-07-15, Angular exportAs"
date:   2022-07-15 22:03:57 +0800
categories: programming
summary: "Angular exportAs"
---

# Understand exportAs In Angular Directive Angular
[Reference](https://kimsereylam.com/angular/2020/07/31/understand-exportas-in-angular-directive.html#template-variables)

- Template variables are defined in HTML using `#`. They can be used to get a reference to a component and can be used to get a reference of the variable in the directive class using `ViewChild`, or it can be passed to another component as an `Input`.
- For directives, we can use `exportAs` to assign the directive to a template variable with `#myTemp=myDirective`.

# Take Advantage of the exportAs Property in Angular
[Reference](https://netbasal.com/angular-2-take-advantage-of-the-exportas-property-81374ce24d26)

- You use `exportAs` to get access to the component's methods via a template variable.

# Get reference to a directive used in a component
[Reference](https://stackoverflow.com/questions/36345618/get-reference-to-a-directive-used-in-a-component)

- Access via constructor.

```
@Component({
})
export class MyComponent implements OnInit {
  constructor(private directive: MyDirective) { }

  ngOnInit(): void {
    assert.notEqual(this.directive, null); // it passes!
  }
}
```

# 5 Methods to Reduce JavaScript Bundle Size
[Reference](https://blog.bitsrc.io/5-methods-to-reduce-javascript-bundle-size-67f2e1220457)

- Code-split with Webpack via `lazy`.
- Webpack plugins for tree shaking: `babel-plugin-lodash` for Babel and `babel-plugin-import`.
- Webpack bundle analyzer.
- Compressing via Brotli or gzip.
- Use production mode.
