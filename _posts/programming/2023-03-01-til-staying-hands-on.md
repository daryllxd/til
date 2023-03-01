---
layout: post
title:  "TIL, 2023-03-01, Staying Hands-On"
date:   2023-03-01 14:21:13 +0800
categories: programming
summary: "Staying Hands-On"
---

- [Reference](https://www.npmjs.com/package/tailwind-scrollbar)

- Input having space and comma:
  - Can't have type="number" because then commas won't show up. [Reference](https://stackoverflow.com/questions/45801445/how-to-allow-input-number-type-to-have-space-and-comma)
- Date.prototype.toLocaleString() [Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString) exists!

# Staying Hands-On, as an Engineering Manager or a Tech Lead
[Reference](https://newsletter.pragmaticengineer.com/p/staying-hands-on)

- Hands-on benefits: Trust with the team, easier to stay up to date, keeping career paths open.
- Succeeding:
  - Onboard to your team like a software engineer.
  - You can't prove you know how something works until you can picture it for others and teach it to them.
- Activities to stay hands-on with:
  - Design docs.
  - Code reviews.
  - Operational reviews: What are the systems' health metrics, operational dashboard, and other indicators of how products and systems are performing.
  - On call?
  - Outages and incident reviews.
- **As a manager, or lead, your goal is not to act as yet another senior software engineer who churns out code: but it’s to multiply the team’s output by doing things that are not you coding by yourself. While it can feel good to retreat and write code - and enjoy your code doing what it should be doing - beware of spending too much time on these activities, while neglecting the things that your team really needs from you.**
- Be mindful of not snatching the "best" work from engineers on the team.


- Simplest way of "iterating over children x amount of times

```
{/* @ts-ignore */}
<input type="number" value={quantity} onChange={(e) => setQuantity(e.target.value)} />
<code>{quantity}</code>

{Children.map(arrayChildren, (child, index) => {
    if (index < quantity) {
      return (child);
    }
  }
)}
```


