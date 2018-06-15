---
layout: post
title:  "TIL, 2018-06-11, CQRS and friends"
date:   2018-06-11 12:18:07 +0800
categories: programming
summary: "Continuous Delivery, Back-end interview questions, Rails and E-commerce, Data Migrations"
---

# CQRS, Reporting Database
[Reference](https://martinfowler.com/bliki/CQRS.html), [Reference](https://martinfowler.com/bliki/ReportingDatabase.html)

- Different model to update info than the model you use to read info from.
- Mainstream approach: Treat it like a CRUD data store.
- As our needs become more sophisticated, we move away from that model. We may want to look at the information in a different way to the record store.
- Multiple representations of information: you usually make the persistent storage as close to the conceptual model as you can.
- CQRS: For many problems, having the same conceptual model for commands and queries leads to a more complex model that does neither well.
- Separate models: possible different object models (different processes/hardware).
  - Could be that the same objects have different interfaces for their command side and their query side.
  - Fits with event-based programming models.
  - Having separate models raises questions about how to keep those models consistent (eventual consistency).

## When to Use It?

- Should be used on specific portions of a system and not on the system as a whole. In this way of thinking, each Bounded Context needs its own decisions on how it should be modeled.
- High performance applications: CQRS allows you to separate the load from reads and writes, allowing you to scale each independently.
- 2 different database access techniques for read and update.
- `ReportingDatabase`: You can use your main system for most queries, but offload the more demanding ones to the reporting database.
  - The structure of the reporting database can be designed to make it easier to write reports.
  - No need to normalize because it's read-only.
  - You can refactor the operational DB without needing to change the reporting DB.
  - Queries run against the reporting DB don't add to the load on the operational DB.
  - Downside: Data has to be kept up to date. If you need more timely data, you can use a messaging system so changes are forwarded to the reporting database.

# Continuous Delivery, A Summary of the Book “Infrastructure As Code” by Kief Morris
[Reference](https://continuousdelivery.com/), [Reference](https://medium.com/@Oaosman84/a-summary-of-the-book-infrastructure-as-code-by-kief-morris-150c066f49c3)

- Our goal is to make deployments—whether of a large-scale distributed system, a complex production environment, an embedded system, or an app—predictable, routine affairs that can be performed on demand.
- We achieve all this by ensuring our code is always in a deployable state, even in the face of teams of thousands of developers making changes on a daily basis.
- High performance teams consistently deliver services faster and more reliably.
- Jidoka: Automation with a human touch.
- Foundations:
  - Config management/able to reproduce things immediately/being able to trace versions of each dependency used. Better if possible to compare previous versions of an environment.
  - When you don't apply the techniques, things like server sprawl (large number of servers that aren't maintained), configuration drift (unknown inconsistencies across servers due to manual fixes and tweaks), and Snowflake Servers (special servers that can't easily be replaced). Implications: fragile infrastructure and automation fear.
  - Principles: Servers should be reproducible and disposable, and any action carried out on infrastructure should be easy, cheap, and repeatable in order to accommodate changing designs.


# Rails and E-Commerce Options?
[Reference](https://www.reddit.com/r/rails/comments/8q1y67/im_a_rails_developer_i_want_to_create_an/)

- Shopify.
- Spree?
- Make sure you know what your requirements are.
- Shopify and `BigCommerce`?
- There is a lot of work (PCI compliance, fraud protection, fulfillment).
- If the goal is to learn security, inventory, search, building an e-commerce site is a good idea. But if your end goal is to sell and make sales, developing the site by yourself is a distraction.

# Musings

- [How to answer the dreaded “tell me about yourself” interview question](https://medium.freecodecamp.org/how-to-answer-the-dreaded-tell-me-about-yourself-interview-question-cec7137ca17b)
  - Practice over and over and over again.
  - Find your quirk/something that makes you stand out.
- [Why Paris Hilton Is Famous (Or Understanding Value In A Post-Madonna World)](https://chartreuse.wordpress.com/2006/09/18/why-paris-hilton-is-famous-or-understanding-value-in-a-post-madonna-world/)
  - Queen of links: She is a walking billboard. She talks about other people, the designers of her clothes, the club she was going to, all without any guarantee of any return.
  - ***The most valuable commodity today is attention.*** And there are many ways to get it. From sex videos to stupid pet tricks to talking bad about Muslims. The real trick is what you do with it once you have it.
  - Whenever she tries to promote herself, it falls flat. Books, records, movies, etc. don’t work for Paris. Because she’s actually a platform. Like Digg and YouTube.
- [Patterns for Data Migrations in Rails](https://jacopretorius.net/2014/07/patterns-for-data-migrations-in-rails.html)
  - Don't modify old migrations.
  - Don't interact with models, just use SQL statements.
  - `db.quote` method to escape input in a migration. (`db.execute "UPDATE users SET status = #{db.quote(:active)}"`)
- [`switch_point`](https://github.com/eagletmt/switch_point) gem switches database connection between read-only one and writable one.
- [Recent ActiveRecord operation circumstances in Cookpad](http://techlife.cookpad.com/entry/2014/08/28/194147)
  - Big app, 87K LOC on models alone (lol).
  - Don't use migration, there are times where an `ALTER_TABLE` leads to high DB server load.
  - Functions are micro-serviced.
  - Ridgepole is the command line tool. Adding a column = you just add to the table definition.
  - Problem with AR: Handing multiple DB servers well.
  - Connection pooling: We can keep up to 5 connections per Rails process. Low for cost of connection, but hard when distributing load to multiple slaves or fail-over.
- [Why do array indexes start with 0 (zero) in many programming languages?](https://www.quora.com/Why-do-array-indexes-start-with-0-zero-in-many-programming-languages) 0 is the offset.
- [The Best Memory Leak Definition](https://stackoverflow.com/questions/312069/the-best-memory-leak-definition)
  - Failure to release reachable memory which is no longer needed for your program to function correctly.
