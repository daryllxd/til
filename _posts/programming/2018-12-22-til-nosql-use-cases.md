---
layout: post
title:  "TIL, 2018-12-22, When to Mongo, When to Redis"
date:   2018-12-22 13:05:11 +0800
categories: programming
summary: "Brushing up on NoSQL use cases."
---

# Musings

- Goodbye MongoDB, Hello PostgreSQL [Reference](https://developer.olery.com/blog/goodbye-mongodb-hello-postgresql/)
  - MySQL for crucial data and MongoDB for storing reviews and similar data.
  - The problem of a lack of a schema: If your data's structure changes over time, this is problematic.
  - Mongoid: You can define a schema in the model, but why don't you just define it in the database then?
  - Database wants: consistency (transactions), visibility, correctness (if a field is a number, you shouldn't be able to insert text in), scalability.
  - Postgres: You can alert the table in different ways without requiring to lock it for every operation.
  - Other features: trigram based indexing and searching, full-text search, support for querying JSON, support for querying/storing KV pairs, pub/sub.
  - Migration: Set up a PG and migrate a small subset of data, then update apps that rely on Mongo to use PG instead, then migrate production data to the new DB and deploy the new platform.
  - Migrating production: migrate critical data first. Then, migrate less critical data, and test if everything is up and running on a set of separate servers. Then, switch the production environment to these new servers.

# NoSQL Use Case Scenarios or WHEN to use NoSQL [closed]
[Reference](https://stackoverflow.com/questions/10553860/nosql-use-case-scenarios-or-when-to-use-nosql)

- NoSQL is good for unstructured/schemaless data:usually you don't need to explicitly define your schema up front, and can just include new fields without any ceremony.
- It favors a denormalized schema because no joins.
- Easier to scale because you can just have more nodes to replicate data to.
- Complex queries/reporting are done from an RDBMS.
- NoSQL doesn't have an ability to perform atomic operations across multiple tables.
- Easier to scale by adding more nodes.
- Do you need automatic sharding, and map/reduce data processing?

# When to Use MongoDB Rather than MySQL (or Other RDBMS): The Billing Example
[Reference](https://dzone.com/articles/when-use-mongodb-rather-mysql)

- High write load: better performance than RDBMS, but there is no safety involved.
- High availability in an unreliable environment (MongoDB has replica set).
- You need to grow big and shard your data: a single MySQL table will degrade after 5-10GB per table.
- Location-based data.
- Data set is going to be big and schema is not stable.
- No DBA.
- Use case: billing system.
  - Schemaless design: enables rapid introduction of new types to a system.
  - Manages several TB in a single table.
  - Sharding.
  - Must support high insert load.
  - Elegant queries.
  - Location based.

# When to Redis? When to MongoDB? [closed]
[Reference](https://stackoverflow.com/questions/5400163/when-to-redis-when-to-mongodb)

- If you require a lot more QUERYING, then it would be more work for your developers to use Redis, as your data might be stored in a variety of specialized data structures, customized for each type of object for efficiency.
- *In Mongo, the same queries might be easier because the structure is more consistent across your data. Redis is just fast. So its payoff is the extra work of dealing with the variety of structures your data might be stored with.*
- So Redis requires more effort to learn, but greater flexibility.
- The Redis database size is limited by the amount of RAM in the machine.
- Some small problems with RDBMS: so much migrations, and having to write SQL.
- MongoDB: Good for prototyping.
- Redis: Used to speed up an existing application. Cache. Data structures but you have to explicitly define how you want to store your data. Scaling is not as easy as Mongo.
- Mongo: Prototyping, startups, hackathons. Also, when you need to change your schema quickly.
