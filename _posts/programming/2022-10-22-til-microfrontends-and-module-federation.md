---
layout: post
title:  "TIL, 2022-10-22, reading on micro-frontends and module federation"
date:   2022-10-22 08:39:56 +0800
categories: programming
summary: "Micro-frontends and module federation"
---

# TIL

- Making modules smaller - a module should probably be either data or components, but not both.

# When to do Micro-frontends / Module Federation
[Reference](https://www.reddit.com/r/Angular2/comments/ul7ykr/when_to_do_microfrontends_module_federation/)

- Pros:
  - Separation of concerns, testing, maintenance, fallback mechanism, packaging/deployment.
- Cons:
  - Complex, interfaces need to be established across different apps to communicate with each other, which kind of increases maintenance.
- We had all the good practices in regards of architecture and development in place, but to make this works, it relies on really solid collaboration between the teams working on those micro-frontends and in the end falls down to problem of - people not wanting to do whats good for the product, product owners fighting for custom things and in the end it was unmaintainable mess. It was scrapped, a lot of modules in Angular kept and built upon that. Once it was unified into a monolith with good component structure and services, that’s when things started working.
  - My word of advice, if you don’t have a good developer structure in place, don’t chase this dream … Its really hard to get done, and you’ll be the one to blame in the end when it fails because of reasons out of your control.
- IMO micro architecture makes sense for a back-end, but not really a front end especially with lazy loading modules.
- While micro-frontend offers great advantages, you also need a very solid architectural base with people that really have deep knowledge of both, the technology and business / product / platform's vision. Once that setup is in place and actively maintained, MF is just a pleasure to work with as long as you closely align and coordinate with other teams.
- One, I would argue that choosing to do microfrontends is as much an organizational issue as it is a software pattern, meaning the organization needs a clear separation of business domains.
  - Communication patterns lose the strong typings for services.
  - Client side caching becomes a problem for your independent deployments, so strategies in receiving the latest version of the remote module needs to be addressed.
  - When to use: Another team outside of my repo wants to consume the business process I present and doesn't want to risk replicating efforts.

# How Capital One Builds Micro-Frontends At Scale
[Reference](https://www.capitalone.com/tech/software-engineering/loosely-coupled-micro-frontends-with-nodejs/)

- Routing: Depends on a URL pattern that includes:
  - `mode`: JSON configuration for page composition.
  - `domain`: Organizational grouping.
  - `container`.
  - `app`: Individual component.
  - Resource.
- App shell loads the overall router, including some possible front-ends: header, core app, sidebar, page footer.
- Lessons learned:
  - Build a foundation - create single unifying design system (web components) that allowed the platform to create the illusion of a single app.
  - CI/CD pipeline.
  - Overall business domain model.
  - Open governance/"ways to improve".
  - Survey engineers about their feedback.
- Developer experience:
  - NPM scripting to make the developer's individual workstations work with pieces deployed elsewhere.
  - Use native tooling for the tech in use.
  - "Just enough" scripts to bring it all together to simulate the entire application as if its running together.
  - Continue to invest and refine the developer experience based on their feedback and usage patterns.
- Memory leak analysis: `Clinic.js`.
