---
layout: post
title:  "TIL, 2018-04-23, AI, Postgres Vacuum, Node use cases"
date:   2018-04-23 13:16:53 +0800
categories: programming
summary: "Reading Gitlab issues re: databases, reading on Node."
---

## Musings, Front-end

- Weird caching thing with Github.
- Github uses Akamai CDN for caching and services. Also, no modifying of `.htaccess`.
- `RequireJS`: A bit older, replaced by Webpack. Not that compatible with `npm`.
- `CommonJS`: A way to include JS modules within the current scope and keeps the global scope from being polluted. This reduces the chance of naming collisions and keeps code organized.
- Passing a function with parameters through props: use `<Button onClick={() => this.props.myFunction(param)} />`. [Reference](https://stackoverflow.com/questions/41369497/passing-a-function-with-parameters-through-props-on-reactjs)
- On parameterized event handlers: do not curry it, some binding thing can be done. [Reference](https://medium.freecodecamp.org/reactjs-pass-parameters-to-event-handlers-ca1f5c422b9)

## Musings, Postgres:

- [Multiversion Concurrency Control (MVCC):](https://www.postgresql.org/docs/current/static/mvcc-intro.html) Each SQL statement sees a snapshot of data as it was some time ago, regardless of the current state of the underlying data.
  - Contrast this to locking.
- [What's the difference between a tuple and a row in Postgres?](https://stackoverflow.com/questions/19799282/whats-the-difference-between-a-tuple-and-a-row-in-postgres)
  - Tuple is the abstract term, row is the concrete implementation.
  - `n_live_tup` in the `pg_stat_user_tables` to figure out how many tuples you have.
- [SQL `VACUUM`:](https://www.postgresql.org/docs/9.1/static/sql-vacuum.html)
  - Reclaims storage occupied by dead tuples.
  - Tuples that are updated or deleted are not physically removed from the table, they remain present until a `VACUUM` is done. So it's necessary to do `VACUUM` periodically, especially on frequently-updated tables.

## Musings, Ruby, Node

- [Database Outage on 2016/11/28 when `project_authorizations` had too much bloat](https://gitlab.com/gitlab-com/infrastructure/issues/791)
  - Cool article on what they did to solve a problem with the site going down.
  - Killing queries.
  - Use `htop` to figure out memory usage.
  - Check dead tuples for the tables.
  - `VACUUM FULL` on offending table.
  - [`pg_repack`](https://github.com/reorg/pg_repack) lets you remove bloat from tables and indexes, and optionally restore the physical order of clustered indexes.

- [I/O bound](https://en.wikipedia.org/wiki/I/O_bound): The time it takes to complete a computation is determined by waiting for I/O operations to be completed, opposite of CPU bound (where computations are the ones that take longer).
- [Artificial Intelligence — The Revolution Hasn’t Happened Yet](https://medium.com/@mijordan3/artificial-intelligence-the-revolution-hasnt-happened-yet-5e1d5812e1e7)
  - Distraction: the idea of having an intelligence that rivals our own.
  - Ex: the medical system that can misdiagnose unborn babies for having down syndrome, due to some error in white noise.
  - Provenance: where did data arise, what inferences were drawn from the data, and how relevant are those inferences to the present situation?
  - There is a need to develop AI systems for the medical, commerce, transportation, and education domains.
  - We are now building societal-scale decision-making systems that involve machines, humans, and the environment.
  - ML in the 90s: fraud detection, logistics-chain prediction, recommendation systems. Data science: combining ML with database experts to build scalable/robust ML systems.
  - Trend: intelligence augmentation (computation/data to augment human intelligence and creativity).
  - Intelligent infrastructure: computation + data + physical entities to make human environments more supportive, interesting, and safe.
  - Ex: data flows/data analysis flows to aid human diagnoses and providing care.
  - The scope of AI is not about science-fiction dreams or nightmares, but the need for humans to understand/shape technology as it becomes more present in our lives.
