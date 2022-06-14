---
layout: post
title:  "TIL, 2022-06-13, Deep Diving into CSS Vars in Angular"
date:   2022-06-13 14:33:28 +0800
categories: programming
summary: "CSS Vars in Angular"
---

- [Reference](https://stackoverflow.com/questions/64901460/unable-to-use-css-custom-properties-aka-css-variables-with-sass-if-statement) - CSS variables can't work with SASS variables. Can't do an `if statement` here.
- Print out all CSS variables.

```
var allCSS = [].slice.call(document.styleSheets)
  .reduce(function(prev, styleSheet) {
    if (styleSheet.cssRules) {
      return prev + [].slice.call(styleSheet.cssRules)
        .reduce(function(prev, cssRule) {
          if (cssRule.selectorText == ':root') {
            var css = cssRule.cssText.split('{');
            css = css[1].replace('}','').split(';');
            for (var i = 0; i < css.length; i++) {
              var prop = css[i].split(':');
              if (prop.length == 2 && prop[0].indexOf('--') == 1) {
                console.log('Property name: ', prop[0]);
                console.log('Property value:', prop[1]);
              }
            }
          }
        }, '');
    }
  }, '');

```

- [Reference](https://medium.com/@ingobrk/using-css-variables-in-angular-282a9edf1a20)


- [Reference](https://jdsteinbach.com/css/use-cases-css-variables/) and [Reference](https://netbasal.com/binding-css-variables-in-angular-69dfd4136e21)
  - Ability to change the values live in the browser is pretty powerful.
  - Native CSS variables allow us to write lighter, more efficient stylesheets.
- Global CSS variables: `:root`. Local, also can.
- Benefit: Can be changed in real time with JS.
- `this.host.nativeElement.style.setProperty(`--${this.variable}`, value);` is how you set the CSS variable.
