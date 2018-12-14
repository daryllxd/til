---
layout: post
title:  "TIL, 2018-12-13, Java Spring Framework"
date:   2018-12-13 12:24:51 +0800
categories: programming
summary: "How video streaming works and being a team lead."
---

# Java's Spring Framework
[Reference](https://www.youtube.com/watch?v=rMLP-NEPgnM)

- Large bodies of predefined code to which we can add to our own code to solve a problem in a specific domain.
- Advantages: efficiency, security, cheaper, support.
- Disadvantages: restrictions in the API, code is public (using any of the API means its exposed to the public), and custom built features.
- Web layer, common layer, service layer, data layer.
  - From mobile app to web app.
- Distinct division between JavaBean models, controllers, and views.
- Spring's MVC is very flexible because it uses interfaces.
- Web tiers are easier to test.
- Well defined interface to the business layer.
- Configured via Inversion of Control.
- Better integration with view technologies other than JSP.
- Data access, web, core container, test.
  - Data access: database.
  - AOP: aspect-oriented programming focuses on how can we implement the cross-cutting concern using aspects.
- Core module
  - Core, bean, context, language.
  - JDBC + ORM + OXM (abstraction layer) + Transaction management.
  - Web: WebSocket, Servlet, Web, Portlet.
- Start coding
  - Eclipse then Spring IDE plugin.
  - Bean class, XML, demo class, load jar files, run.
  - Inversion of control: via a factory.
  - Objects are constructed only when you need it?
- Inversion of control container features: It creates the objects, wires them together, manages their life cycle, and configures.
- Bean Factory vs Application Context.
- Spring's Dependency Injection: Either via constructor or via a setter. This makes our code loosely coupled.

# How video streaming works on the web: An introduction
[Reference](https://medium.com/canal-tech/how-video-streaming-works-on-the-web-an-introduction-7919739f7e1)

- Mid-late 2K: we used a flash plugin, because there was no other mean to stream video on a browser.
- HTML5's `video` tag: allows a link to a video directly from the HTML. This can be controlled with JS, but they don't allow live streaming and don't switch between video qualities.
- Media Source Extensions: allows complex use cases

# Thoughtworks Careers and Culture
[Reference](https://www.thoughtworks.com/insights/careers-and-culture)

- Tech Lead:
  - Developer/team coordinator: responsibility was to make sure the team was successful at delivering software. This gives you experience on how to distribute work in a way that people would like it, learn from it, and be effective at it.
  - Planning the work, taking care of scope and project management details, and some development. Leadership isn't really about having a certain job title. It's about making sure that the team is successful and doing whatever it takes to reach that.
  - Leading a team: balance out your individual contributions against the overall productivity of the team. What matters is the team is successful.
  - Let go of your solutions and encourage team decisions: people don't like being micro-managed. There's often more than one solution for most problems and situations.
  - Leading a conversation without telling people what to do. Needing to allow the team to reach a solution, even one which I might not consider is the most optimal. *If the team really supports a solution, they will work hard to make sure it is successful. Oftentimes, they will come up with a solution that is better than what I imagined. As a Tech Lead, we work with good people and it's important to believe that they are going to do their best.*
  - Tech lead should: act as a tiebreaker when the team is stuck between two similar solutions, and they should keep the team from thrashing by keeping the team from continually reopening decisions that have been made.
  - Water cooler conversations: don't restrict chats with your peeps about work; understand how their kids are doing, talk about their favorite restaurants. If you have a good working and personal relationship with someone, they are a lot more likely to let you know when things are going badly, as opposed to waiting and seeing what happens.
  - Build the next generation: it's important to give people leadership opportunities within the project.
  - At the end of the day, whether you are a tech lead or not, success is being prepared for the next team that comes up. It is sort of like having a toolbox with a bunch of tools and it is about knowing how to pick the right tool to deal with whatever situations come your way.
- The Inception of a ThoughtWorker
  - The recruitment process is: "show us what you can do". *What we look for is originality and the ability to work through your solutions in a collaborative fashion.*
- Working at TW is a conscious decision. TW takes a keen interest in the company's business and the organization itself is very transparent.
- ***Feedback as a part of the culture - expect regular feedback exchanges with other TW people. Ultimately, we're looking for someone who has a passion for technology and a health does of irreverence for the status quo. If you make it through our interview process, it's because you convinced us that we are a great fit. If not, it's not the end of the road.***
- *ThoughtWorks has an aspirational goal to better humanity and help drive a socially and economically just world. And every ThoughtWorker has a part to play in it. So we put a lot of thought into every hire we make at the company. By the time you finish with our interview process though, you’ll realize that it’s not as “difficult” as it is made out to be.*
- A lack of diversity in technology roles means that we not only exclude a large part of population from in-demand, self-fulfilling, and well-paid jobs, but we also stifle economic growth and remove diversity from decision makers in key global industries.
