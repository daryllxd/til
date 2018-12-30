---
layout: post
title:  "TIL, 2018-12-27,  ID vs GUID, Production Quality Code"
date:   2018-12-27 13:09:46 +0800
categories: programming
summary: "SQL refactoring, sharding, aspect oriented programming"
---

# Musings

- [SQL Refactoring techniques – How to split a table in SQL](https://solutioncenter.apexsql.com/how-to-split-a-table-in-sql/)
  - Splitting the table = when some columns are accessed much more frequently. This will improve the time to retrieve data from a table, especially in cases of applications that select all columns from a table.
  - Restricting access to some information in a table - by splitting a table, different access rights to a table.
  - Ex: to split a table vertically (split a column out), you can create the new table, copy data to/from, add triggers so that columns that belong to a common table are synchronized, and then drop the column from the older table.
- [How Sharding Works](https://medium.com/@jeeyoungk/how-sharding-works-b4dec46b3f6)
  - Splitting and storing a single logical dataset in multiple databases. Horizontal partitioning: storing rows of the same table in multiple database nodes. Vertical partitioning: storing different tables and columns in a separate database.
  - Vertical partitioning: domain specific, logical split within the data, and store them in different databases.
  - Sharding: splitting out a type of data into multiple databases. So you can shard on the app level or the database level.

# How to write Production quality code?
[Reference](https://javarevisited.blogspot.com/2011/09/how-to-write-production-quality-code.html)

- Production: all about load, which exposes concurrency issues, load issues, memory, and CPU issues.
- More scenarios in prod that you would not think about in development.
- Different data input or incorrect data. Have to think about this always.
- Boundary conditions (null, empty) exposed in production.
- Get requirements right, make sure you figure out the scenarios as early as possible.
- Think through. Think of all scenarios.
- Boundary condition - null, empty, small numbers, large numbers, function called at the wrong time.
- Concurrency - major culprit and big problem which exposes itself in production when due to load, multiple threads get triggered and access your program concurrently.
- Exception handling. Whole program should not crash due to one single bad input or scenario.
- Recoverable, code should be able to recover itself in the case of premature closing or crash.

# Aspect Oriented Programming : Overview
[Reference](https://medium.com/@mithunsasidharan/aspect-oriented-programming-overview-6c03235e666a)

- Cross cutting concerns: a concern is a particular set of information that has an effect on the code of a computer program.
- Usually, the code can be separated into logical sections, each addressing separate concerns, and so it hides the need for a given  section to know particular information addressed by a different section.
- Cross cutting concerns: concerns that often cannot be cleanly decomposed from the rest of the system in both the design and implementation, and can result in either scattering (code duplication), tangling (significant dependencies between systems), or both.
- AOP helps you solve cross cutting concerns across application modules by separating them off the other concerns.

# User IDs or GUIDs?
[Reference](https://rachelbythebay.com/w/2018/04/27/uid/)
[Reference](https://news.ycombinator.com/item?id=16946557)
[Reference](https://begriffs.com/posts/2018-01-01-sql-keys-in-depth.html)

- Not really a good idea to have IDs as integers, because then they can be used in the code. They should just be identifiers.
- For static languages, just make sure that you have type checking to make sure you don't accidentally use a user id. For dynamic languages, make it hard to do it (use a unique field name).
- Randomly assigned IDs - perform sub-optimally in RDBMS. So people have internal IDs, then random external IDs.
- Other advantages of UUIDs: client can generate the UUID, allowing eventual consistency and retrying using distributed databases. Merging of databases is easy. Allow capability based access control. Use a bit to encode production vs development IDs, so cross-contamination of systems is less likely.
- Postgres uniqueness constraint: there is an index already for this, so no need to create another index on columns declared unique.
- A primary key does not prevent declaring other keys. In fact, a table with keys will function fine when none is designated as primary.
