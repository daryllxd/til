---
layout: post
title:  "TIL, 2018-04-24, Designing Very Large JS Applications"
date:   2018-04-24 10:33:05 +0800
categories: programming
summary: "Plus cool article on big companies, and Chef over Docker."
---

# Musings, JS

- [Designing very large (JavaScript) applications](https://medium.com/@cramforce/designing-very-large-javascript-applications-6e013a3291a3)
  - Above "I know how to solve problems": "I know how I would solve a problem and so I could teach someone else to do it."
  - Avoid central configuration.
  - Add automated tests to make sure that requires make sense.

# Musings, DevOps

- [Benefits of Chef over Docker?](https://www.quora.com/What-are-some-benefits-of-using-Chef-over-Docker)
  - Variable images with chef databags and chef templates to generate docker images.
  - Able to manage a node from the GUI.
  - Chef configures your host stuff.
  - Test-driven infrastructure with test-kitchen, `serverspec`, and Vagrant.
  - Workflow:
    - Packer script to install stuff that chef needs to run.
    - `dockerregistry` recipe to set up a docker registry and installing Docker on each node.
    - Chef cookbook to generate my base image.
    - Cookbooks that generates images to do stuff.

# Why We Hate Working for Big Companies
[Reference](https://medium.com/s/story/why-we-hate-working-for-big-companies-9e6c787a32ac)

- We have free markets, but a corporation is usually more like an authoritarian state.
- When hiring managers: author didn't want to be an employee, so why would others want to be an employee? There's also a problem when there's a separation between people doing the work and people who make the decisions.
- Free market: Central planning committees can never be as efficient or effective as people doing the work. (Markets do not have a manager to do this.)
- For things like China's Great Leap Forward, a commission telling the farmers what to produce leads to not-so-good decisions because there's a huge separation between the central planning committee and the farmer.
- ***The most important feature of free market economies is that each person within them is able to make independent decisions in their own best interest.***
- For much of history: people did as many things as they can (re: turning labor into a product).
- Corporations nowadays: when you reach a certain company size, you'll have a planning process, set out top-level goals, build plans, and get information from the front line to see where it needed tweaks.
  - What they need is to have a system where the people doing the work knew the organization's goals and plans.
  - Leadership is about making decisions.
  - The problem with a big company: the leadership is so far removed that it looks like a bureaucracy.
- ***I find it both ironic and painful that my inability to work for someone else resulted in my creating a company that involved a lot of smart, capable people working for someone else.***
  - How do you value most of the work people do?
  - Things end up with a concentration of wealth anyway.
