---
layout: post
title:  "TIL, 2019-01-10, How Reddit Scaled/Algorithm Questions"
date:   2019-01-10 22:50:16 +0800
categories: programming
summary: "Rereading High Scalability"
---

# Reddit: Lessons Learned From Mistakes Made Scaling To 1 Billion Pageviews A Month
[Reference](http://highscalability.com/blog/2013/8/26/reddit-lessons-learned-from-mistakes-made-scaling-to-1-billi.html)

- SSD is cheap RAM, not expensive disk.
- Not necessary to build scalable architecture from the start.
- Treat non-logged in users as second-class citizens: they give logged out users cached content.
- Moving to EC2: S3 for logos and thumbnails first, then for batch processing, when they moved the entire site, it was down for a day.
- Web tier then application tier: app tier talks to memcache, Cassandra, Postgres. Postgres uses a master-slave configuration. Batch system makes use of Cassandra and Postgres.
- SOA/Netflix advantage: easier to auto-scale, easier capacity planning, problems can be identified more easily, effects of change are narrowed, more efficient local caching.
- Queue = savior (RabbitMQ).
- Traffic: HAProxy and Nginx.
- Pylons/Pyramid (Django was too slow) from the start.
- Data gravity: data is hardest to move.
- PG is fast and supports KV.
- Sharding: writes are split across 4 master DBs: links, accounts, subreddits, comments, votes, and misc. Vote database has one master and one slave, the comment database has one master and 12 slaves. Read from slave, write to master.
- Cassandra: good for writes, negative lookups, incrementally scalable.
- Offload page rendering to client: Facebook is the mater of this.
- Expire data when it's old.
- Consistent hashing?
- Automate the infrastructure if you can.
- Always assume you will have more than 1 app server, database, and cache.
- Schemaless: it makes it easy to add features, no need to alter tables.
- API.

# Algorithm questions

- Determine if a string is a rotation of another substring with one function call only: check if the first string is a substring of the second string + the second string again. Smart!
- [Determining length of a string in Python is O(1)?](https://www.reddit.com/r/learnpython/comments/752zbp/why_is_the_complexity_of_lenlist_o1/)
- [Check if a string is a permutation of another string](https://nbviewer.jupyter.org/github/donnemartin/interactive-coding-challenges/blob/master/arrays_strings/permutation/permutation_solution.ipynb): you can either sort both and check that they are the same (O n log n), or you can do a hash map lookup to keep track (O(n) time and O(n) space).
- [Compressing a String](https://nbviewer.jupyter.org/github/donnemartin/interactive-coding-challenges/blob/master/arrays_strings/compress/compress_solution.ipynb) How it works is that you just check if the character is the same as the last one, add to the count, and construct the compressed string. Time is O(n) since you have to traverse the string, and space is O(n) since you can potentially store the entire string.
- [Dynamic Programming for Knapsack](https://www.youtube.com/watch?v=8LusJS5-AGo): I get the recursive call, but the array to store current item + capacity left is awesome.
- Magic square/minimum cost - apparently you have to look at all possible squares and all possible costs.
