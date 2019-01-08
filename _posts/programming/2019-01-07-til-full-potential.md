---
layout: post
title:  "TIL, 2019-01-07, Full Potential"
date:   2019-01-07 00:26:05 +0800
categories: programming
summary: "Angular vs React Deep Dive, Performance and Scalability Patterns"
---

# 6 Reasons You Probably Aren't Living Up to Your Full Potential
[Reference](https://www.inc.com/quora/6-reasons-you-probably-arent-living-up-to-your-full-potential.html)

- Laziness reasons:
  - Anxiety about your work not being good enough. When you get into perfectionist mode, then you have to take short vacations so you can have a clear and productive mind. Also, just have regular check-ins with them so you can check up on their anxious tendencies.
  - Confusion about the first step: this is why a PM or team lead is useful to break down processes.
  - Volume of tasks: Say no to tasks that are low priority when something of higher priority needs to get done--smart prioritization.
  - Disagreeing with a decision: leaders should never let arguments devolve into an impactful way. Build systems that guarantee transparency and ensure everyone on your team remains on the same page in your effort to drive the company forward.
  - Psychological needs are not being met: competence (they have control over an outcome and the capacity to get better at a specific function), relatedness (they connect meaningfully with others), autonomy (desire to direct their own lives).

# A couple of words about interactors in Rails
[Reference](https://mkdev.me/en/posts/a-couple-of-words-about-interactors-in-rails)

- DDD: When used properly, it leads to creating a lot of programming abstractions called domain models. These models include complex business logic, eliminate the gap between the real conditions of product application field and state.
- To create elegant object systems, we create abstractions: are you a programmer, or a framework customizer?
- *Interactor: used to create an abstraction above a little area of knowledge and encapsulate business logic of the application.*
- Testing an interactor = just testing a pure ruby object.

# Angular vs. React: Which Is Better for Web Development?
[Reference](https://www.toptal.com/front-end/angular-vs-react-for-web-development)

- React is a library that deals with views, and Angular is a full-fledged framework.
- Angular: comes with data-binding bundled in, and React is usually augmented by Redux to provide unidirectional data flow and work with immutable data.
- Angular features in React:
  - Data binding/dependency injection: Angular Core / `MobX`
  - Computed properties: `rxjs` / `MobX`
  - Component-based routing: `angular/router` / React Router
  - Material design components: `angular/material` / React Toolbox
  - CSS scoped to components: `angular/core` / CSS modules
  - Form validations: `angular/forms` / `FormState`
  - Project generator: `angular/cli` / React Scripts TS.
- Computed properties: when performance is concerned, plain getters in Angular are simply out of the question as they get called on each render. The `computed` part from `MobX` achieves the same objective, with a bit nicer API.
- Dependency Injection: goes vs React's functional programming and immutability. Some kind of DI is needed because it decouples from the data layer part. Angular has different lifecycles for different stores.
- Component-based routing: allows components to manage their own sub-routes instead of having one big global router configuration.
- Form validation: this is a widely used feature.
- TODO: Finish this!

# Performance and Scalability patterns
[Reference](https://docs.microsoft.com/en-us/azure/architecture/patterns/category/performance-scalability)

- Performance: Indication of the responsiveness of a system to execute an action within a given time interval.
- Scalability: Ability of a system either to handle increases in load without impact on performance, or for the available resources to be readily increased.
- Cache-aside: Load data on demand into a cache from a data store.
- CQRS: Segregate operations that read data from operations that update data using separate interfaces.
- Event sourcing: Use an append-only store to record the full series of events that describe actions taken on data in a domain.
- Index table: Create indexes over the fields in data stores that are frequently referenced by queries.
- Materialized view: Generate pre-populated views over the data in one or more data stores when the data isn't ideally formatted for required query operations.
- Priority queue.
- Queue-based load leveling: A queue acts as a buffer between a task and a service that it invokes in order to smooth intermittent heavy loads.
- Sharding: Divide a data tore into a set of horizontal partitions or shards.
- CDN.
- Throttling: control the consumption of resources used by an instance of an application, an individual tenant, or an entire service.

