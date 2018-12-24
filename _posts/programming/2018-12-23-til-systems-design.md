---
layout: post
title:  "TIL, 2018-12-23, Systems Design"
date:   2018-12-23 16:45:04 +0800
categories: programming
summary: "Designing Instagram, NoSQL stores data in JSON"
---

# Musings

- [Reddit thread](https://www.reddit.com/r/webdev/comments/9lc9n5/nosql_stores_data_in_json_format_then_what_does/)
  - NoSQL excels at data storage, retrieval and flexibility but not search, filtering or data integrity. They each have their strengths.
  - Simply put there's an infinite amount of ways in which to store data. Most RDBMSes store data in a single file on disk. How it is formatted is vendor-specific.
  - JSON format, as far as I'm aware is one of the least performant and robust ways of storing data. Relational databases tend to put safety and concurrency in front of ease of understanding when considering the storage format.
- Hash table is better than array for lookups.
- Paper programming: thinking about how the problem is going to be solved first before actually coding.

# Designing Instagram
[Reference](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5673385510043648)

- Get requirements:
  - Functional requirements:
    - Upload/download/view photos.
    - Searching.
    - Following.
    - Generate/display a user's News Feed.
  - Non-functional requirements:
    - Highly available.
    - Acceptable latency of the system is 200ms for News Feed generation.
    - Consistency can take a hit in the interest of availability.
    - System should be highly reliable.
  - Not in scope: adding tags to photos, searching photos on tags, commenting on photos, tagging users to photos, who to follow, suggestions.
- Design considerations:
  - Read-heavy, and practically users can upload as many photos as they like.
  - Low latency is expected while viewing photos.
  - Data should be 100% visible.
- High-level systems design.
  - We need object storage servers to store photos and some database servers to store metadata information about the photos.
  - Database schema. We need to store data about users, uploaded photos, and people they follow. Photo.
  - RDBMS is the straightforward one, but it's hard to scale them.
  - Storing photos: in a distributed file system like S3 or HDFS.
  - Wide-column data store like Cassandra.
- Component design.
  - Reads cannot be served if the system gets busy with all the write requests. We can split reads and writes into separate services. We will have dedicated servers for reads and different servers for writes.
- Reliability and redundancy: Replication in S3 for the images.
- Sharding: partitioning based on User ID?
- Planning for future growth:
  - Multiple logical partitions residing on a single physical database server.
  - We can separate databases for each logical partition on the server.
  - We can maintain a config file that can map our logical partitions to database servers.
- Generating a News Feed:
  - Get a list of people the user follows, and then fetch metadata info of latest 100 photos from each user.
  - Possible problem with this approach: higher latency, as we have to query multiple tables and perform sorting/merging/ranking on the results.
  - So, we probably have to pre-generate the News Feed and storing it in some table.
  - We can either pull the feed (request when needed), push (server pushing data as soon as its available), or do a hybrid thing where for celebrity users, we pull.
- Caching: CDN/geographically distributed photo cache servers and use CDNs.
  - We can introduce a cache for metadata servers to cache hot database rows. We can check Last Recently Used if a row is hot.
  - We can use the 20%-80% rule, where we can try caching 20% of daily read volume of photos and metadata.

# Relational databases vs Non-relational databases
[Reference](https://www.jamesserra.com/archive/2015/08/relational-databases-vs-non-relational-databases/)

- RDBMSes are used to manage OLTP (frequent, short transactions that include updates) and that touch a small amount of data and where concurrency of thousands of transactions is very important. Integrity of data is very important so they support ACID transactions.
- Data warehouses/analytical databases have long, complex queries that touch a large amount of data and require a lot of resources.
- RDBMS dominance: simple, robust, flexible, scalable, compatibility in managing generic data. RDBMS also has a query optimizer.
- The main concern with large RDBMS is scalability. It is hard to horizontally scale across multiple servers. This is when the complexity starts to cause problems with their potential to scale.
- Non-relational:
  - Simplicity, meaning we can store the customer order in one document as opposed to having to join many tables together, resulting in less code to write, debug, and maintain.
  - Easier to horizontally scale as it auto-shards itself. They natively and automatically spread data across an arbitrary number of servers.
  - Finer control over availability. Much easier to add/remove servers.
  - Captures big data (semi-structured ones).
  - Speed.
  - Cost. Cheap commodity servers as opposed to proprietary servers/storage systems.
  - What is compromised: Consistency. They lack true ACID and/or support transactions in certain circumstances and at certain levels.
- Comparing the two:
  - KV pairs allow you to store several related items in one "row" of data in the same table. (Example, each row would contain the customer's details as well as their account, load, and investment details).
  - Drawback: Cannot enforce relationships between data items. Also, the transactions would also be stored as another single data record.
  - The RDBMS model has primary keys and foreign keys that enforce business logic and rules at the database layer. In KV stores, the responsibility then becomes the application's, and not the database's responsibility.
  - So RDBMS suffer from no horizontal scaling for high transactions loads, while NoSQL solves high transaction loads but at the cost of data integrity and joins.
