---
layout: post
title:  "TIL, 2018-05-28, Research on Event Sourcing"
date:   2018-05-28 22:40:18 +0800
categories: programming
summary: "Where I..."
---

# Musings on Event Sourcing

- [Best Event Sourcing DB Strategy](https://stackoverflow.com/questions/28667367/best-event-sourcing-db-strategy)
  - One table for each event?
  - One generic table, save events as a serialized string.
    - Query the event stream by aggregate ID, not event type.
    - Reproducing the events in order is hard if they are in different tables.
    - It would make upgrading events a bit of pain.
    - Searching via event type: add an index on that column.
  - Something to consider: "We still had a set of normalized tables, because we just could not accept that in order to get the latest state of an object we would have to run all the events." So ES is good for versioning/serving as a full audit log, and it should be used just for that, not as a replacement of a set of normalized tables."
    - Treat the views as a convenience that can be trashed/rebuilt at any time.
- [Using an RDBMS as an Event Sourcing Storage](https://stackoverflow.com/questions/7065045/using-an-rdbms-as-event-sourcing-storage?rq=1)
  - Simplest form: Event → `Aggregate_ID`, `Aggregate_Version`, `Event_Payload`.
  - *Event store should not need to know about the specific fields or properties of events. Otherwise, every modification of your model would result in having to migrate your database.*
- [Design Patterns: Why Event Sourcing?](https://www.youtube.com/watch?v=rUDN40rdly8)
  - This is a good talk. Just didn't take down notes yet.
- [Why are event sourcing (CQRS) databases not popular?](https://dba.stackexchange.com/questions/147439/why-are-event-sourcing-cqrs-databases-not-popular)
  - It is arguable that the write-ahead-log that every SQL product uses is an event stream, allowing rebuilding of objects in the event of an instance fault.
  - CQRS can be considered a design pattern as much as it can be considered a product. As such, any mainstream store could implement a CQRS.
  - Accounting, banking, and finance systems: "every transaction is immutable".
  - On querying the history: your probably don't want to query against the event store itself. The most common solution would be to hook up a couple of event handlers that project the events into a reporting or a BI database, then replay the event history against these handlers.
  - CQRS: Separate your read and write models. ES: Use an event stream as the single source of truth in your application.

# Other Musings

- [Hacking Hacker News](https://news.codecademy.com/how-to-hack-hacker-news/?utm_source=customer.io&utm_medium=email&utm_campaign=fortnightly_5-24-18&utm_content=HackHN)
  - 2015: 2.6M views/day, 300K daily uniques, 3-3.5M monthly unique views in 2015.
  - A goal of HN was to allow YC to "get to know" would-be founders before they apply, so applicants can use the same YC account to contribute to HN and apply to the accelerator program.
  - Same as Reddit, but users can't downvote submissions/comments until they've accumulated 501 karma, and can't flag comments until 30 karma.
  - So more meritocratic, and its hard to coordinate an upvoting brigade.
  - Success of submissions? Karma + source URL + timing (the basic algorithm is divides points by a power of the time since a story was submitted).
  - 4 power users accounted for 22% of the total karma in the dataset. Github, NY Times, Medium are trusted sources. Most active on 7am EST and between 6-8pm EST.
- [On `require 'csv'`](https://stackoverflow.com/questions/50571927/do-i-really-need-to-require-csv-gem-with-rails)
  - CSV is part of the Ruby standard (not the core) library.
  - In huge libraries, this is usually loaded, but it is a bad idea to rely on libraries loading this thing.
  - So I would recommend writing `require 'csv'` when you need it, and if you really need it, consider just loading it in places like `config/application.rb`.
