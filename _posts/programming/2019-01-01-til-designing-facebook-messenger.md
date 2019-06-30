---
layout: post
title:  "TIL, 2019-01-01, Designing Facebook Messenger"
date:   2019-01-01 17:09:50 +0800
categories: programming
summary: "Reading Systems Design Stuff"
---

- [Reference](https://dev.to/anabella/a-junior-a-mid-and-a-senior-dev-walk-into-a-bar-414f)
  - Never use a `*` query if you can. Better to write a hundred column names.
  - Be scared of database changes.
  - Migrations should be decoupled from deployments.
  - Make sure all code is already in place and it can handle the previous database state, and the one after the change.
  - Staging environment for such tests = needed.
- [Ask HN: What skills to acquire in 2019?](https://news.ycombinator.com/item?id=18765383)
  - Elixir: for concurrent and scalable systems. No locks, race conditions, and low-level stuff.
  - Concurrency: Doing some database operation and deciding to do some work on a separate thread so I'm not idling.
  - Parallelism: You can add more workers to the queue, and now we have parallelism!
  - Erlang and Elixir: A sound mental model where the communication between nodes and workers are done via message passing between Erlang processes (not OS processes) and the receiving process may or may not be on the same computer as the server.
  - Erlang gives a construct/toolkit via Gen servers and Supervisors that you organize into what are called supervision trees.
  - Guaranteeing "fairness" between jobs.
  - ***Elixir sets you up to build more complicated systems if you need to.***
  - They are also designed to be able to hot upgrade your system.

# Designing Facebook Messenger
[Reference](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5724160613416960)

- Should support one-on-one conversations, keep track of online/offline statuses, persistent storage of chat history.
- Real-time chat experience with latency, highly consistent/same history will all device.
- High level design: we will need a chat server that would be the central place orchestrating all the communications (when a user sends a chat, they connect to that server, send to the other user, and save it in the database).
- User A sends message to B, server receives the message and sends an ACK to User A, server stores the message in its database, User B receives the message and sends the ACK to the server, server notifies A that the message has been delivered to B.
- Pull: users ask the server if there are new messages. Push: users keep a connection open with the server and depend on the server to notify them whenever there are new messages.
- Maintaining an open connection with the server: HTTP Long Polling or WebSockets.
- If receiver has disconnected, then we can ask the sender to retry sending the message.
- Planning for X million connections, then if a server can handle Y concurrent connections, we would need 10K such servers.
- To know which server holds the connection to each user, we use a software load balancer to map each ID to a server.
- Options for storing/retrieving the messages from the DB: start a separate thread to save stuff to the database, and send an asynchronous request to the database to store the message.
- When designing the database:
  - Database connection pool?
  - How to retry failed requests?
  - Where to log those requests that failed, even after some retries?
  - How to retry these logged requests, when all the issues have been resolved?
- Can't use an RDBMS because we can't afford to read/write a row from the database every time a user receives/sends a message. This is too huge load.
- Wide-column database solution: can store multiple values against one key into multiple columns. HBase groups data together to store new data in a memory buffer, and once the buffer is full, it dumps the data to the disk.
- Data partitioning is based on...? User ID so each person will have fast performance on messages.
- Cache: We can cache a few recent messages in a few recent conversations that are visible in a user's viewport.
- Group chat: Separate group-chat objects in the system.
- Push notifications: just a check if the person is on or offline.

# Queues
[Reference](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5080491044634624)

- When a server gets more requests than it can handle, then
