---
layout: post
title:  "TIL, 2020-12-02, Button"
date:   2020-12-02 10:23:56 +0800
categories: programming
summary: "Button type button"
---

# `<button>`: The Button element
[Reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button)

- Permitted content - phrasing but no interactive element.
  - Phrasing content - defines the text and mark-up it contains (`p`, etc.)
  - Interactive content - elements specifically designed for user interaction. `a`, `button`, etc.
  - Implicit ARIA role - `button`. Could also have `checkbox`, `link`, `menuitem` etc. roles.
  - `HTMLButtonElement`.
- Attributes
  - `autofocus` - should have input focus when the page loads.
  - `autocomplete` - Firefox-specific. Disabled attribute does not reset when refreshing. [Reference](https://stackoverflow.com/questions/5985839/bug-with-firefox-disabled-attribute-of-input-not-resetting-when-refreshing)
  - `disabled` - Prevent user from interacting with the button.
  - `form` - the element to associate the button with its owner.
- Button `type`:
  - `submit` - submits the form data to the server.
  - `reset` - resets all the controls to their initial values.
  - `button` - no default behaviour, and does nothing when pressed by default.
- Accessibility
  - Icon buttons - there is no accessible name. Should have text inside the button that describes the button's functionality, and use some CSS properties to remove it visually from the screen, but readable by assistive technology.
  - *Leaving the button text visually apparent can also aid people who may not be familiar with the icon's meaning or understand the button's purpose.*
  - Button size: 44 by 44 CSS pixels is recommended.
  - Spacing - large amounts of interactive content should have space separating them.

# What's the point of `<button type=“button”>`?
[Reference](https://stackoverflow.com/questions/41904199/whats-the-point-of-button-type-button)

- If you're in a `form` element, and you don't specify that it's a regular button (`type="button"`), it defaults to a submit button. So if you want to perform a POST using Ajax, then that's how we should do it.

# Hidden content for better a11y
[Reference](https://gomakethings.com/hidden-content-for-better-a11y/#the-skip-link)

- Keyboard-only users or neuromuscular conditions - use a keyboard to navigate the site.
- Skip link - visually hidden anchor link.
- Chrome skip link - page can scroll down, but focus remains on the skip link. -> Check this out later.
- Hidden labels - for a search form, you might not want to display a label for that field, but it can be helpful for screen reader users to know what content goes in the field.
- Anchor links - can be used to jump people to a particular section. But if you don't want people to see them when tabbing, can have `tabindex=-1`.
- Adding a hidden keyboard user link to ask for a11y feedback.
