---
layout: post
title:  "TIL, 2018-05-01, Designing Bike Paps Homepage."
date:   2018-05-01 18:07:02 +0800
categories: programming
summary: "React Context, React Fragment, Polyfill, GDPR, Do We Need CS as a Programmer?"
---

# Musings, JS and React

- React context:
- [React Fragment.](https://reactjs.org/docs/fragments.html)
  - Used to not render an actual div but serve as the base element for a component.
  - `<React.Fragment></React.Fragment>`, shorthand is `<></>`.
  - Sample use case: `Table`, the thing inside a table row (yuck if it's a div, it should be nothing anyway).
  - You can add keys to the fragment.
- [Polyfill:](https://remysharp.com/2010/10/08/what-is-a-polyfill) A piece of code that provides the tech that you, the developer, expect the browser to provide natively. Ex: `sessionStorage` to make IE 7 compatible?
- Background images in React: Put them in `src`.
- Local storage and session storage are not that complicated. They are just like Redis caches. Session storage = expires when the browser is closed.
- Higher order components can be used to show loading state.
- Background generator: [Reference](https://galactic.ink/bg/) [Reference](https://trianglify.io/)

# Musings, Ruby

- Thinking about dependency injection in Ruby. Like
- IOC Container?
- Inversion of control?
- [Reference](http://dry-rb.org/gems/dry-container/)
- `dry-auto_inject`
- Transactions in Redis?
- Algolia: HN's search engine.
- [Cargo cult programming:](https://en.wikipedia.org/wiki/Cargo_cult_programming) A style of computer programming characterized by the ritual inclusion of code or program structures that serve no real purpose. (Lol.)

# Musings, GDPR and Facebook

- Opinion: Yeah it's hard to stop data collection. That's basically what's going to happen from now on because analytics are just way too profitable for companies to not do it. Speaking as a developer on this.
- GDPR: EU law on data protection and privacy for all individuals within the European Union.
- [Hard Questions: What Data Does Facebook Collect When I’m Not Using Facebook, and Why?](https://newsroom.fb.com/news/2018/04/data-off-facebook/)
  - Facebook services for ads: social plugins, Facebook login, Facebook analytics, Facebook ads and measurement tools.
  - Apps and websites that use our services send us information to make their content and ads better.
  - IP address/browser/OS information to make features work.
  - Ad network: Cookies and device identifiers help us determine whether the person uses Facebook.
  - Facebook Pixel.
  - New Feed preferences and Ad preferences. You can remove these advertisers to stop seeing their ads.
- HN comments:
  - When an industry is making money to society's detriment, it will not fix itself.
  - ***People often talk about ethics and values when they expect it from others or wider society. Yet they often fail to act in ethical ways when it comes to them and somehow manage the dissonance.  Our current system incentivizes profit over all else and many will respond to this. If our system rewards unethical behavior we should not be surprised with the results. Regulations around safety, environmental, labour and other ethical issues have to be put in place to temper the worst impulses. If slavery was legal many would be willing justify it as long as they gained from it.***
  - I've been to presentations of marketing teams that said they know how much is left on your mortgage when you hit their website, and they use that data, and a lot more, to figure out what price tier of items show up on the landing page.
  - Facebook competes in the free market. If they scale back on data collection, that will hurt their offering to advertisers and cost them money that will go to Google and others. Facebook doesn’t operate in a vacuum. They can’t scale back data collection unless others do.
  - There is no option to pay them to not see the ads. There is no option to pay them so they don't gather information about You. Even if Facebook gets out of business, others will do it. Your phone, your TV, watch, whatever is connected to internet is collecting information. THERE IS NO WAY TO OPT-OUT.
  - What's troubling me is the question, "what incentives do average employees in the tech industry have to operate in a morally admirable manner?". Punishing evil corp is so reactive. Why is the average employee so willing to sell out their fellow citizens, and ultimately themselves, for a paycheck? The obvious answer is, "it's a paycheck".

- [CS to be a successful engineer?](https://www.reddit.com/r/programming/comments/8g2v6b/you_dont_need_a_cs_degree_to_be_a_successful/)
  - It wasn't until I became a technical lead and had to teach new team members that I realized how much of what I assumed everyone knew were things I had picked up in school. -
  - I think the main concepts missed are how operating systems and databases work. Then, compilers/interpreters and more advanced data structures (beyond hash tables and arrays).
  - As has been said repeatedly here, that CS knowledge does not necessarily need to come in the form of a university degree. But as a developer, gaining that knowledge (however done) is amazingly useful. It is usually just those who haven't who say it has no use ;)
  - I don't have anything specific, but most things they teach at CS programs are not immediately applicable to most software jobs, especially web dev.
  - Regardless of where we came from, this is a field where the learning never ends. I would tell my earlier self to read that C++ text in its entirety. On the job work does not cover all fundamentals. Aggressively seek random puzzles and solve example algorithms. And I would have told myself to get a degree first.
  - Things missing from non-CS grads: How internal memory looks. Where are local vs global variables stored in memory. How stacks are constructed, and how things like recursion actually works under the hood. Things like algorithm optimization, big O notation, etc.
  - ***Having been in this industry for about 23 years, there’s a couple of things I've learned. One is that you can get a degree without actually learning the stuff they were teaching. Another is that you can learn everything you’d learn in school without going to school.  Whether you go to school or not doesn't matter. What matters is that you actually want to learn and will do it either in school or out of it. What matters is that you care to understand both theory and practice.***
  - I can confidently say that the code I write, my work flow, and the libraries I use are nothing like what I learned back in the day. However the fundamentals have not changed. The real value of my school education (I only have an associates) was in learning stuff like Big O, memory management, buffers, OOP principles, etc. The theory remains the same.
  - As you said, one must understand theory and practice. There is always room to grow in both.

# UX at Shopify

- Product UX leadership: interested in solving experience problems for our merchants. How do they manage and process orders and inventory?
- Discipline leadership: interested in focusing on an aspect of your craft: information architecture,motion design, or the practice of product design.
