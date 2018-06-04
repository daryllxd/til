---
layout: post
title:  "TIL, 2018-06-03, Sharding, Read/Write Databases"
date:   2018-06-03 14:01:21 +0800
categories: programming
summary: "Crying around in Capybara. Order of columns in indexes. Also finished Gradetecko!"
---

Visit [Grade Tecko](https://github.com/daryllxd/gradetecko) and [its accompanying Heroku app](https://gradetecko.herokuapp.com)!

# Research on Sharding, Reading Octopus
[Reference](https://github.com/thiagopradi/octopus/blob/master/lib/octopus/shard_tracking.rb)

- If you have `HashWithIndifferentAccess`, just use it?
- `ActiveRecord::VERSION::MAJOR` and `MINOR` is a thing to check versions.
- Logger method:

``` ruby
def self.logger
  if defined?(Rails.logger)
    @logger ||= Rails.logger
  else
    @logger ||= Logger.new($stderr)
  end
end
```

- Hooks into `ActiveRecord::Base.connection`, creates an `Octopus::Proxy`
- Inclusion method:

```
def self.included(base)
  base.extend(ClassMethods)
end
```

# How would I implement separate databases for reading and writing operations?
[Reference](https://stackoverflow.com/questions/2914664/how-would-i-implement-separate-databases-for-reading-and-writing-operations)

- Read/write master databases and read-only slaves are a common pattern, especially for big applications doing mostly read accesses/data warehouses.
- It allows you to scale and to tune the databases differently, for either efficient reads or efficient writes.
- It really depends on what you are trying to achieve by having two databases.
  - *If it is for performance reasons (which i suspect it may be) i would suggest you look into denormalizing the read-only database as needed for performance.*
  - If performance isn't an issue then I wouldn't mess with the read-only schema.
- I've worked on similar systems where there would be a read/write database that was only lightly used by administrative users. That database would then be replicated to the read only database during a nightly process.

# Slow Rails Queries
[Reference](https://pawelurbanek.com/slow-rails-queries)

- New Relic, `PgHero` to track down query bottlenecks in the applications.
- `Seq Scans`: Means PG needs to scan a table row by row to find matching entries.
- Seed local database to mimic production. Perform benchmarks on a local computer, with settings resembling a real production site.
- Siege for local benchmarks.

# Musings/Links

- [Bootstrap 4 File Input](https://stackoverflow.com/questions/48613992/bootstrap-4-file-input-doesnt-show-the-file-name): I fixed this with JQuery.
- [Capybara upload file:](https://stackoverflow.com/questions/24267462/how-to-use-capybara-upload-file) Use `File.absolute_path`.
- You need `type: feature` to enable Capybara methods (RSpec).
- [When creating an index over multiple columns, put the column with least variance first.](https://stackoverflow.com/questions/2292662/how-important-is-the-order-of-columns-in-indexes)
- [Getting a file's MIME type using Rack.](https://stuff-things.net/2016/06/29/get-the-mime-type-of-a-random-upload-in-rails/) `Rack::Mime.mime_type(File.extname(filename))`
- [Apparently you shouldn't offset when using an index?](https://use-the-index-luke.com/no-offset)
