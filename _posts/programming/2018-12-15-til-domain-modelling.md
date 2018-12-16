---
layout: post
title:  "TIL, 2018-12-15, Domain Modelling and Coding Interviews"
date:   2018-12-15 12:53:30 +0800
categories: programming
summary: "Also, Django"
---

# GOTO 2015 • DDD & Microservices: At Last, Some Boundaries! • Eric Evans
[Reference](https://www.youtube.com/watch?v=yPvef9R3k-M)

- Not all parts of a system will be well-designed.
- Anti-corruption layer just when something changes.
- Teams should have ownership of domains of the code. Context should have one owner.

# What do people look for in an onsite pair coding interview?
[Reference](https://www.quora.com/What-do-people-look-for-in-an-onsite-pair-coding-interview)

- Workflow skill.
- Thinking out loud: how do you think about things?
- Programming skill + TDD.
- It's okay to make comments and recommendations to the workflow, but don't badmouth the decisions. Complaining without offering improvements is just whining.
- Type of developer: do we try things, or do we go Google things when we get stuck?
- Questions:
  - Do we have the basic skill we need to get the job done?
  - What gaps do you fill on the team?
  - Do I think you can get to speed quickly on the things you don't know? Do I have reservations about how long it's going to take you to be effective on the team?
  - Do I want to work with you every day?

# How do other senior software engineers prepare for coding interviews?
[Reference](https://www.quora.com/How-do-other-senior-software-engineers-prepare-for-coding-interviews)

- Seniors are very comfortable with systems design.
- Load and monitoring: load balancing, caching, indexes, and sharding.
- They know how to gather the right requirements, ask the right clarifying questions and decide what to do next with the answers.
- This is so we know a bit about how we scale things. Some requirements: are we dealing with structured or unstructured data? Is this going live to a set # of users or to the entire community? Is latency important?
- Ability to solve problems and showcase about how they came to a solution. When you are faced with a bottleneck, what are your options, and what can you do?
- ***Fundamentally, every bug is the result of an invalid assumption.***
- Simplest solution, then optimize for X, Y, or Z reasons.
- Being good at tech alone is never good enough. You need to be able to have logical discussions, apply theory, work with others, contribute, and be likeable.
- Articulating stories and answers to questions (both technical or non-technical).
- Fundamentals: hash tables, linked lists, BFS, DFS, sorting, arrays, dynamic arrays, search trees, dynamic programming, Big-O analysis.
- Practice on a whiteboard.
- There is no better way to interview than DS and algorithms. This is just the most efficient process to interview at scale.
- Imposing a forcing function: a gym is a gym.
- All the things you think about when coding:
  - Research, design, talk to the teams, scope, draft, implement, test, address code review, add metrics, deploy, monitor metrics.
  - Optimal algorithm, fault tolerance, variety of use cases, variety of inputs, dependency management, remote call error handling, data sync/data storage, unstable connection handling, usable/responsive/easy to navigate UI, cost of development/maintenance.
- So how do you do this:
  - No premature optimization: focus on the hardest aspects of functionality first, don't dive into all details at once.
  - Pipeline first: when done identifying the core and proposing solutions for it, don't rush implementing it or diving deeper.
  - Test your solution with a reasonable amount of valid and invalid inputs.
  - When implementing solutions, be clean.
  - Just do brute-force solutions first.
  - Apply all the things mentioned above.
- Things that you need to know:
  - Were you lying?
  - Were you actually doing good software development?
  - What are your actual limits?

# Designing Instagram
[Reference](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5673385510043648)

- Uploading/downloading/viewing photos, searching, following, generate and display a News Feed.
- Highly available, 200ms for News Feed generation, consistency can take a hit, highly reliable.
- Users can upload as many photos as they like.
- High level design: Client to upload and client to view. Object storage (S3?) and some database servers to store metadata information.
- RDBMS for joins.
- Wide-column data store: Cassandra for the metadata related to photos and for storing relationships between users and photos.
- Data size estimation: Think of how big each row of a table would be, and think of how many rows each table could have.
- Upload can be slow as they have to go to disk. Reads need to be served from a cache.
- Reliability and redundancy: we need replicas of services running in the system.
- When to shard:
  - We can shard based on the user ID.
- Ranking and News Feed Generation:
  - The application server will first get a list of the people the user follows and then fetch metadata info of latest 100 photos. Then, submit to ranking algorithm.
  - We can pre-generate the News Feed and store it in a separate table.

# Domain-Driven Design
[Reference](https://herbertograca.com/2017/09/07/domain-driven-design/)

- Ubiquitous language: Better if we properly name classes and methods, making them express what an object is and what a method does in the context of the domain.
  - This aligns the application with the business. This is accomplished by adopting a common language, between the business and technology, in the code. This is worth refactoring the code if needed!
- Layers:
  - UI, application, domain. Domain services, entities, value objects.
  - Domain layer: the layer that contains all the business logic, domain services, entities, events.
  - Infrastructure: persistence or messaging.
- Bounded context:
  - The bigger the code base a developer has to work with, the bigger the cognitive load. The more difficult it is to understand the code, and the higher is is to have the possibility of introducing bugs and errors in judgment.
  - More devs working on the same codebase means it's more difficult to coordinate efforts.
- The system thus consists of a number of subsystems which can contain subsystems of themselves.
  - The task of the subsystems is to package the objects so that the complexity is reduced.
  - Ideally: strong functional coupling within a subsystem and a weak coupling between subsystems.
- *Classes that change together are packaged together.*
- This becomes the criteria for subsystem division:
  - Different development groups have different competence or resources, and it may be desirable to distribute the development work accordingly.
  - Distributed environment: a subsystem may be wanted at each logical node.
- Anti-corruption layer:
  - The middleware between two subsystems. Translates, facades, adapts, whatever.
- Shared kernel: It makes sense for some domain code to be shared by multiple components.
