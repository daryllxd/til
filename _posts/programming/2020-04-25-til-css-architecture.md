---
layout: post
title:  "TIL, 2020-04-25"
date:   2020-04-25 17:31:04 +0800
categories: programming
summary: "CSS architecture, Unit Testing Sass"
---

# Unit Testing Sass
[Reference](https://seesparkbox.com/foundry/how_and_why_we_unit_test_our_sass)

- Why Unit Test Sass?
  - To ensure code is compiling as expected - checking the accuracy of their output is not a native feature. Your CSS might still compile, but it could not be the intended output.
  - Catch output errors quickly [Reference](https://github.com/oddbird/true)

Example:

```
@mixin primary-header {
 font-family: "Helvetica", Arial, sans-serif;
 font-size: 2rem;
 line-height: 2.5rem;
 color: #333;
 text-decoration: underline;
}

// Describe what you're testing
@include describe('The primary-header mixin') {
  // Explain what it should do
  @include it('outputs the properties of our primary header.') {
    // Assert the output of the mixin matches the expected result
    @include assert {
      @include output {
        @include primary-header();
      }
      @include expect {
        font-family: "Helvetica", Arial, sans-serif;
        font-size: 2rem;
        line-height: 2.5rem;
        color: #333;
        text-decoration: underline;
      }
    }
  }
}
```

# Thoughtful CSS Architecture
[Reference](https://seesparkbox.com/foundry/thoughtful_css_architecture)

- Benefits
  - Fewer styling rules
  - Fewer styling collisions
  - Long-term maintainability
  - Faster ramp-up for new team members
  - Easier collaboration between team members
  - Smoother project hand-offs
- Types of CSS Rules
  - Base styles: Stuff that you want to normalise across all browsers. Typography, box-sizing, etc. (The common mistake is to create defaults that you don't really want.)
  - Objects: Objects are rules that focus only on structure and layout. No decorative styles allowed. Look for structural patterns in your designs and create object classes that can be used across multiple components or sections of the site. Grid systems fit into the Objects category.
  - Components: Discrete, self-contained pieces of UI. The key to creating robust components is to make them independent from any other parts of the page and self-contained. You should be able to drop a component anywhere on any page and it will maintain its structure and design.
  - State: Helpers that modify the state of a component. It's common to add/remove state classes with JavaScript. Rather than manipulating styles with JS, you can just update a state class and allow the stylesheet to determine what each state looks like.
  - Themes: Theme classes simply alter a component to use unique colors, fonts, or other decorations.
  - Utilities: Single-purpose helpers that apply one specific styling rule. Things like adding space between components, clearing floats.
  - Javascript hooks: Whenever possible, decouple any dependencies between your JavaScript and styling. Using class names that are used for both styling and DOM selection with JS can cause issues later when the CSS is refactored.
- BEM Naming Convention
  - `Block__Element-Modifier`
  - Readability: Using clearly described class names for most of your elements will make it easier for someone else to read through your HTML or CSS files.
  - Self-description: Using hierarchical names makes it clear which elements belong to which base components.
  - Specificity: It seems excessive to add a class to every element in your component, but you can keep the specificity of each of your selectors low, making overrides much more straightforward.
- Namespacing:
  - Objects: `.o-`
  - Components: `.c-`
  - State: `.is-` OR `.has-`
  - Theme: `.t-`
  - Utilities: `.u-`
  - Javascript hooks: `.js-`
- Use variables when any value needs to be used more than once. Prefix your variable names to help identify their purpose and also to make code-completion more useful.
- Ordering CSS classes:
  - Settings: Variables and other settings
  - Tools: Custom functions and mixins
  - Generic: Font-face, box-sizing, normalize, etc.
  - Elements: Bare element defaults like headings and links
  - Objects: Layout and structure classes
  - Components: Individual components
  - Trumps: Utilities and other rules meant to be a final trump over everything else
