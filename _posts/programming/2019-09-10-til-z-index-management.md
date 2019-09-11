---
layout: post
title:  "TIL, 2019-09-10, Z-Index Management"
date:   2019-09-10 11:22:47 +0800
categories: programming
summary: "Read 10 articles on this"
---

# Sassy Z-Index Management For Complex Layouts
[Reference](https://www.smashingmagazine.com/2014/06/sassy-z-index-management-for-complex-layouts/)

- Common strategy: z-indexes incremented by double digits to have time to insert other elements later.
- Why does this element have this z-index value, and what does it mean in the context of every other element?
- Where does it fit in the order and context of other z-index values?
- If I add an element to the stacking order, which z-index values do I have to increase accordingly?
- Sass-list: `$elements: project-covers, sorting-bar, modals, navigation` to represent the order in which we want our elements to appear.
- Sass index function: Assigns a z-index value to each element: `.project-cover { z-index: index($elements, project-covers) }`
- *In order for an element's z-index value to have an effect, its `position` must not be `static`.* This creates a new stacking context, giving any children a stacking order specific to its parent.

```
$elements: project-covers, user-tooltip, sorting-bar, modals, navigation;
$modal-elements: fields, form-controls, errors, autocomplete-dropdown;

.modal {
   z-index: index($elements, modals);

   .field {
      z-index: index($modal-elements, fields);
   }
   .form-controls {
      z-index: index($modal-elements, form-controls);
   }
   .error {
      z-index: index($modal-elements, errors);
   }
   .autocomplete-dropdown {
      z-index: index($modal-elements, autocomplete-dropdown);
   }

} /* .modal */
```

- To scale across the website, the simplest solution is to create a partial containing your site-wide lists, which you can then include anywhere you need to do it.
- Can use Sass's `@warn` to tell us if something goes wrong.


```
@function z($list, $element) {

   $z-index: index($list, $element);

   @if $z-index {
      @return $z-index;
   }

   @warn 'There is no item "#{$element}" in this list; choose one of: #{$list}';
   @return null;
}
```

# The Z-Index CSS Property: A Comprehensive Look
[Reference](https://www.smashingmagazine.com/2009/09/the-z-index-css-property-a-comprehensive-look/)

- Natural stacking order is determined by a number of factors:
  - Background and borders of the element that establish stacking context
  - Elements with negative stacking context in order of appearance
  - Non-positioned, non-floated, block level elements in order of appearance
  - Non-positioned, floated elements in order of appearance
  - Inline elements in order of appearance
  - Positioned elements in order of appearance
- ***Z-index will only work on an element whose position property has been set to absolute, fixed, or relative.***
- Javascript z-index: `zIndex`.

# The Definitive Guide to Using Negative Margins
[Reference](https://www.smashingmagazine.com/2009/07/the-definitive-guide-to-using-negative-margins/)

- Negative margins are valid.
- They are not a hack and they do not break the flow of the page if applied to elements without floats.
- Negative margins on static elements:
  - If top/left, pulls the element in that direction.
  - If bottom/right, pulls the *succeeding* element into the main element, overlapping it.

# Handling z-index
[Reference](https://css-tricks.com/handling-z-index/)

- In games, there is an `enum` variable.
- `z-index` partial: Do not declare z-index anywhere without making a variable for it and placing it within the stack in the `_zindex.scss` file.

```
$zindex: (
  modal     : 9000,
  overlay   : 8000,
  dropdown  : 7000,
  header    : 6000,
  footer    : 5000
);

.header {
  z-index: map-get($zindex, header);
}
```

```
@function z($label) {
    @return map-get($zindex,$label);
}
```
