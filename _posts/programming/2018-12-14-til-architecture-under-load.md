---
layout: post
title:  "TIL, 2018-12-14, Architecture Under Load"
date:   2018-12-14 13:51:20 +0800
categories: programming
summary: "Kafka at AirBnb, Domain Model Wikipedia"
---

# Architecture Under Load
[Reference](https://blog.hartleybrody.com/scale-load/)

- Don't scale before you run into a scale problem.
- Solutions to scaling bottlenecks introduce complexity, abstraction, and indirection.
- Get metrics: memory, CPU, network I/O, disk I/O.
- What gets measured gets managed. Get some monitoring up.
- First part where you need to scale: database.
- High level: don't make the web stack do more work than you'd need. Cache at different levels.
- Hosting topology: the domain should not point to a web server, it should point to a load balancer. When you have an ELB, you can horizontally scale you application by bringing up new web servers.
- Cache database queries, and there are tools that ingest those logs.
- Database indexes.
- Session data: store it in a different, in-memory caching tool like Redis or memcached.
- Run computations offline via jobs. And split those jobs. Ex: you can generate some HTML files for your entire web app and serve it to users as static files. (Ex: static site generators).
- HTML fragment caching.
- HTTP caching with the headers.
- CDN.

# Every Message Counts: Kafka as a Foundation for Highly Reliable Logging at AirBnb
[Reference](https://www.confluent.io/kafka-summit-nyc17/every-message-counts-kafka-foundation-highly-reliable-logging-airbnb/)

- Started off with Rails → Kafka → Hive. Then expanded.
- Now, other teams (such as search results) wanted to use this service.
- Reliable logging:
  - Schemas as a contract.
  - Events are delivered reliably/can recover if restarted.
  - Events are available in real-time.
  - Schemas and data are discoverable.

# Domain model
[Reference](https://en.wikipedia.org/wiki/Domain_model)

- A conceptual model of the domain that incorporates both behavior and data. A formal representation of a knowledge domain with concepts, roles, datatypes, individuals, and rules.
