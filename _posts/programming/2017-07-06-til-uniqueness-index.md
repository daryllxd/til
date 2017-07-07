---
layout: post
title:  "TIL, 2017-07-06, Uniqueness Index"
date:   2017-07-06 16:29:24 +0800
categories: programming
---

- Ruby: I'm not that really excited about the safe navigation operator (`&.`), but it does make sense when you're iterating over an update hash. Or just safe merge before the edit operation?
-  `described_class.connection.index_exists?(:match_participants, [:match_id, :participant_id], unique: true)` to check if an index exists.
- Factory girl sequence to get around unique index.
- Mass update at the same time, with different attributes per row--there's no easy way to do this in Rails without resorting to 1 query per row, or else you have to do it by SQL.
- Postgres DEFERRABLE uniqueness constraints only work on SQL.
- Viewing database constraints in PostgreSQL: `pg_catalog, pg_constraint` or `pg_catalog, pg_indexes`.
- RSpec: Recheck `expect` and `allow`: `expect` also sort of does the `allow` thing already, so.
- `make_database_queries(matching: /UPDATE/, count: 2)` is a thing.
- Ruby 2.4.0--10-15% more extra speed in Rails than 2.3.x. [Reference](http://engineering.appfolio.com/appfolio-engineering/2017/5/22/rails-speed-with-ruby-240-and-discourse-180)
