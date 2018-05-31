---
layout: post
title:  "TIL, 2018-05-29, More Event Storage"
date:   2018-05-29 17:13:52 +0800
categories: programming
summary: "CSV/Files, Postgres timestamp, Event Horizon."
---

# Building an Event Storage
[Reference](https://cqrs.wordpress.com/documents/building-event-storage/)

- Basic Event Storage: RDBMS with 2 tables:
  - 1 table as Event log: `AggregateId`, `Data`, `Version`. The event is stored using some sort of serialization.
  - Possible additional information: timestamp, context information, the user who initiated the change, IP address, level or permission.
  - Other table: `AggregateId`, `Type`, `Version`, which stores all of the aggregates. The version number is denormalized. This value is used in the optimistic concurrency check.

- Operations for an event:
  - At the simplest level, there are just two operations. This makes Event Storage simpler than most data storage mechanisms as well as easier to optimize.
  - Operation 1: To get all of the events for an aggregate, then you do a `SELECT * FROM EVENTS WHERE AGGREGATE_ID='' ORDER BY VERSION`.
  - Operation 2: Writing the sets of events to an aggregate root. Either code or stored proc.
    - Write: Check if an aggregate exists, if not, create one and consider the current version to be zero. Then, attempt to do an optimistic concurrency test on the data coming in if the expected version does not match the actual version it will raise a concurrency exception. Then, loop through the events being saved and insert them into the events table, incrementing the version number by one for each event. Transaction to insure that optimistic concurrency amongst other things works in a distributed environment.

- Rolling snapshots: A denormalization of the aggregate at a given point in time. There might be some process of creating the snapshots (a process outside of the app server as a background process).
  - Creating a snapshot: Having the domain load up the current version of the Aggregate, then take a snapshot of it.
  - Use Memento pattern.

- ES as a Queue:
  - Very often, these events are not only saved but also published to a queue.
  - An issue that exists with many systems publishing events is that they require a two-phase commit between whatever storage they are using and the publishing of the events to the queue.

# Musings, Ruby

- Bootstrap not collapsing: [Reference](https://github.com/twbs/bootstrap-rubygem/issues/88), but you have to include `jquery3` and `bootstrap` in `application.js`!
- `load` instead of `require` to force the re-evaluation of a file.
- When you can't parse via CSV, just use the File library, because CSV is literally written on top of File: [Reference](https://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html#method-c-open)

- [File reading:](https://stackoverflow.com/questions/6012930/how-to-read-lines-of-a-file-in-ruby?) `foreach`, `readlines`. `foreach` executes the given block for each line in the file, `readlines` puts the entire file in memory.
  - Feel free to read the [IO class](https://ruby-doc.org/core-2.1.0/IO.html) if you need to.

- [Storing a timestamp in PG.](https://dba.stackexchange.com/questions/107475/how-to-best-store-a-timestamp-in-postgresql)
  - `timestamp` or `timestamptz` (timestamp with time zone). This enforces valid data and is typically the most efficient.

- [Native type mappings, PostgreSQL](https://medium.com/@frodsan/activerecord-better-native-types-mappings-for-postgresql-b5391d14ea68)
  - By default, AR uses serial for primary keys, timestamp without time zone for DateTime/timestamp, `varchar` for strings. [Reference](https://github.com/rails/rails/blob/v5.2.0/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb#L75..L116)

- [A Guide to the Ruby CSV Library, Part I:](https://www.sitepoint.com/guide-ruby-csv-library-part/) and [A Guide to the Ruby CSV Library, Part II:](https://www.sitepoint.com/guide-ruby-csv-library-part-2/)
  - You can either import the CSV all at once, or read from it row-by-row.
  - Ruby will store each table row as an array, with each cell being a string element of the array.
  - It can also process strings, not files (`CSV.parse(a_string)`). `CSV.parse` takes in a string, `CSV.read` from a file somewhere.
  - `col_sep`: specifies the separator used in the file.
  - `converter`: Converts? Lol.
  - You can use an enumerator (RubyTapas).


- [Liberal parsing/parsing a CSV with un-escaped quotes](https://blog.bigbinary.com/2016/11/22/ruby-2-4-introduces-liberal_parsing-option-for-parsing-bad-csv-data.html)
  - We cannot have un-escaped double quotes in the CSV input since such data can't be parsed.
  - Ruby 2.4 has added a liberal parsing option to parse such bad data. When set to true it will try this:

``` ruby
# Before Ruby 2.4

> CSV.parse_line('one,two",three,four')
CSV::MalformedCSVError: Illegal quoting in line 1.

# With Ruby 2.4
> CSV.parse_line('one,two",three,four', liberal_parsing: true)
=> ["one", "two\"", "three", "four"]
```

# The EventHorizon Saga
[Reference](https://codeascraft.com/2018/05/29/the-eventhorizon-saga/)

- Events/beacons - clickstream data, a record of actions visitors take on the site, what content they saw, what experiments they were bucketed into.
- Events are sent from the web/API servers and web browsers, and logged in Kafka.
- Event Horizon: debugging tool to make sure that a new event you've added is working as expected, but also serves to monitor the health of the system.
- Consumes messages from the main event topic on Kafka, then forwards them via Web Sockets to any connected browsers.
- Sometimes the thing was lagging.
  - Concurrency bug?
  - Something that sent events?
  - Another Kafka consumer began to log.
  - Possible problem with the NIC?
- Apparently it was just a "null" string.
- Lessons:
  - Graph everything.
  - Think about what assumptions you make.
  - Talk to people.
