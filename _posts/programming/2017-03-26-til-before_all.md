---
layout: post
title:  "TIL, 2017-03-26, Before All is Done"
date:   2017-03-26 00:01:38 +0800
categories: programming
summary: "Where before_all has a lot of weird side effects."
---

- Instead of `expect_any_instance_of`, just do a dynamic dispatch.
- `before_all`--if using this, you need to do your own teardown in an `after_all`. [reference](https://makandracards.com/makandra/11507-using-before-all-in-rspec-will-cause-you-lots-of-trouble-unless-you-know-what-you-are-doing)
- `database_cleaner` transaction vs. truncation
- `rake db:reset` can help in intermittent failing tests, maybe it just wasn't cleaned.
- NO TO delimited list in a database column: [reference](http://stackoverflow.com/questions/3653462/is-storing-a-delimited-list-in-a-database-column-really-that-bad)
- When making seeders/seeder files, CSV is just easier for clients to use.
