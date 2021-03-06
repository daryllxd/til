---
layout: post
title:  "TIL, 2018-02-10, Smalltalk Best Practice Patterns Part 1"
date:   2018-02-10 10:45:54 +0800
categories: programming
summary: "The benefit of using patterns. Composed Method,, Constructor Method, and Constructor Parameters."
---

## Musings

- Uh, history of CSS? [Reference](https://medium.com/actualize-network/modern-css-explained-for-dinosaurs-5226febe3525)
  - Float-based layout: To float images inside a column of text on the left or the right.
  - Flexbox: 2015 adopted.
  - Grid layout.
  - Preprocessor: Sass (needed Ruby), Less.
  - Post-processor: adds the vendor prefixes. `PostCSS`.
  - `OOCSS`: Object Oriented CSS, separate structure from skin. Separate container from content.
  - `BEM`: Block, Element, Modifier. Block = reusable component, element can be reused, modifier = defines the appearance/state/behavior of a block or element. `<button class="search-form__button-search-form__button--disabled">Search</button>`. A bit verbose.
  - Atomic CSS: Small, single-purpose classes with names based on visual function. `<button class="f6 br3 ph3 pv2 white bg-purple hover-bg-light">`.
  - CSS in JS: 2014, defining the CSS in the JS components itself (React style). The JS generates the CSS and inserts it into the document with a style tag.
- Best startup ideas: [Reference](http://www.paulgraham.com/startupideas.html)
  - Something the founders want.
  - They themselves can build.
  - Few others realize this is worth doing.

## Smalltalk Best Practice Patterns

- He presents stuff like the benefit of using patterns. I agree completely. If your code has like the right patterns, then things become easier for everybody.
- "Composed Method", the methods inside need to be at the same abstraction level.
- "Constructor Method", it's like you create a function to ensure that the instances created make sense.
- "Constructor Parameters", I think we have this in Ruby.

## Speed Things up by Learning about Caching in Rails
[Reference](https://www.sitepoint.com/speed-things-up-by-learning-about-caching-in-rails/)

- `rake dev:cache` in Rails 5 to turn it on.
- Page caching: this saves the whole HTML page to a file in the `public` directory. On subsequent requests, this file is being sent directly to the user without then need to render the view and layout again.
  - This is in `actionpack-page_caching` gem.
  - `caches_page :index`.
  - Expiring caches, you can do `expire_page`, or use Action Controller Sweeper.
- Action Caching: hits Rails stack.
  - This is in `actionpack-action_caching` gem.

## Aja Hammerly: Cascadia Ruby 2014- N design patterns you might actually use
[Reference](https://www.youtube.com/watch?v=Oxd_DBuX8R8)

- Template, Strategy, Composite, Decorator, Command.
