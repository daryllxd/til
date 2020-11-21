---
layout: post
title:  "TIL, 2020-11-21, Weekend Reading"
date:   2020-11-21 13:40:49 +0800
categories: programming
summary: "Catching up on the reading list"
---

- How to get the first and last focusable elements in the DOM: [Reference](https://gomakethings.com/how-to-get-the-first-and-last-focusable-elements-in-the-dom/)
  - `var focusable = document.querySelectorAll('button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])');`
  - `var firstFocusable = focusable[0];`
  - `var lastFocusable = focusable[focusable.length - 1];`
- `Array.from()` to convert a `NodeList` to an array, to allow `forEach` to loop through each item.
- `Array.from()` requires a polyfill for IE. Can also do `Array.prototype.slice.call()`.

- How Discord Won [Reference](https://ianvanagas.com/2020/10/19/how-discord-won/)
  - Voice chat sucked for a long time - Skype went down, chats were all over the place.
  - Other competitors: complicated setup, paid hosting, unclear benefits.
  - Discord: nearly no setup. It's free. Easy to switch, inviting is 2 clicks and a paste. None-core features. Big community servers.
  - Revenue model: status. Quality improvements, special profile upgrades, and the ability to boost a server.
- The biology of dads [Reference](https://aeon.co/essays/how-raising-children-can-change-a-fathers-brain)
  - Men are biologically transformed by the experience of becoming an involved father.
  - When women become mothers, levels of the hormones estrogen, progesterone, and prolactin increase throughout pregnancy. Estrogen increases the brain's capacity to detect another major hormone, oxytocin, and the massive release of oxytocin helps mothers bond with and want to care for their infants.
  - Positive paternal engagement was associated with better social, psychological, and educational outcomes in children.
  - Fathers had 20% less testosterone. When adult males were presented with the scent of an infant, testosterone levels decreased in fathers, as if preparing them to focus their energy on caregiving.
  - Young men with higher testosterone levels at initial measurement were more likely to find a mate and become fathers. Fathers whose testosterone decreased the least across the transition to fatherhood reported the highest frequency of sexual intercourse.
  - Men with higher testosterone tended to be less involved with caring for their toddler children.
  - Oxytocin: When fathers were given them, they stimulated their child to explore more and showed less hostility toward the child.
  - Evidence for a decline in fathers' testosterone even during the partner's pregnancy.
  - There is a part in the base of the brain that can severely disrupt maternal behaviour in laboratory rats.
  - When fathers come into contact with their kids, it activates the midbrain, a region filled with dopamine neurons. Just as pregnancy hormones act on maternal brain circuits to stimulate caregiving, fatherhood can also alter the male brain so that parental caregiving circuits become more responsive to pups.
  - Young animals of all vertebrate species have a particular set of characteristics (baby schema) that tend to release adult caregiving. Large heads, protruding foreheads, large eyes, high brows, small lower faces, short stubby limbs.
  - Fathers have a stronger neural response to pictures of children than non-fathers in brain regions involved in rewards processing, suggesting they might attach greater value to those stimuli. Fathers have a weaker response to visual sexual stimuli than did non-fathers in brain reward regions.
- Computers Are Hard: building software with David Heinemeier Hansson [Reference](https://medium.com/computers-are-hard/computers-are-hard-building-software-with-david-heinemeier-hansson-c9025cdf225e)
  - The history of software development is one of later or cancelled projects. If you were to summarize: "the project ran late and it got canceled".
  - Try to accept the core constraint that it is impossible to accurately specify what software should do up front - you can discover what software should do within constraints. Don't do estimates, do budgets. What is the worth of something?
  - We want to end up with projects that deliver meaningful, large batches of work that customers and implementers are proud of an happy with. And that's not improved by trying to shrink feedback loops to be impossibly small. Constant feedback is a good thing, but within some reason!
  - Shift your mindset from estimates to budgets. Don't think about how long something takes. Think about how long are you willing to give something. This flips the entire idea. It lets the requirements float. The project definition that is vague is actually more realistic.
  - The hard work in software is to figure out what it should do, not how to make something work. A 10x programmer is the programmer who reinstates the problem.
