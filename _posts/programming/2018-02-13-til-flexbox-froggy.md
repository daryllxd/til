---
layout: post
title:  "TIL, 2018-02-13, Interactor and Flexbox Froggy."
date:   2018-02-13 20:34:28 +0800
categories: programming
summary: "Where I read the interactor gem code. Also, Flexbox Froggy!"
---

## Musings

- Looking into interactor gem. Interactors solve conditional hell issue in service objects.
  - It has `before`, `after`, and `around` hooks,
  - I honestly just don't like the `OpenStruct` part since it's just too slow!
  - I love the documentation, it says which methods are Public and which are Internal.
  - `rollback!` method, it performs things in the `rollback` method if it is defined.
  - Hooks part: metaprogramming, `instance_exec`.
- `def` vs `define_method` [Reference](https://makandracards.com/makandra/15255-def-vs-define_method):
  - Ruby keyword, new/isolated scope (variables defined outside are not accessible inside), defines an instance method on the receiver, implicit receiver is the default definee.
  - Method defined in `Module`. Defines an instance method on the receiver,
- Case insensitive columns in PG:
  - `citext` extension.

``` ruby
# migration

def change
  enable_extension :citext
  change-column :products, :name, :citext
end
```

- CTCI: Ruby has `transpose`. Also I think I like solving problems recursively now.
- `ancestry` gem to show categories/subcategories. Good for breadcrumbs.
- Composite pattern: I think I can use this re: `SuccessfulOperation`, `Payload`, and `Message`. Okay I did it. I just have to create a bunch of files so I can use this in Daryllxd side project.
- Since I'm not using Rails for the core logic in Daryllxd, I can make up my own structure/thing that's passed around anyway.

## Flexbox Froggy

``` css
justify-content:
flex-start
flex-end
center
space-between # Maximize space between?
space-around

align-items:

flex-start: Items align to the top of the container.
flex-end: Items align to the bottom of the container.
center: Items align at the vertical center of the container.
baseline: Items display at the baseline of the container.
stretch: Items are stretched to fit the container.

flex-direction:
row: Items are placed the same as the text direction.
row-reverse: Items are placed opposite to the text direction.
column: Items are placed top to bottom.
column-reverse: Items are placed bottom to top.

You can combine align-items and flex-direction if you need to put the thing at the end.

order: 2, or -2?
align-self

flex-wrap:
nowrap: Every item is fit to a single line.
wrap: Items wrap around to additional lines.
wrap-reverse: Items wrap around to additional lines in reverse.

flex-flow: combining direction and wrap.
flex-flow: column wrap;

align-content:
Contrast with align-items: AC = spacing between lines, AL = WRT to container
flex-start: Lines are packed at the top of the container.
flex-end: Lines are packed at the bottom of the container.
center: Lines are packed at the vertical center of the container.
space-between: Lines display with equal spacing between them.
space-around: Lines display with equal spacing around them.
stretch: Lines are stretched to fit the container.
```
