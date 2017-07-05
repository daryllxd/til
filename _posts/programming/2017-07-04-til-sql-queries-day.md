---
layout: post
title:  "TIL, 2017-07-04, SQL Queries Day"
date:   2017-07-04 13:59:12 +0800
categories: programming
---

- `association_cache`--good to test if an association has been loaded or not.
- PN cer files
- If you need something that is just one table away, then you might want to do the `Author.joins.select('books.title as book_title').joins(:books)` thing, usable especially for `has_one` or `belongs_to` associations.
- Each AR query usually only runs against one table. You have to figure out when to join and when to do includes.
- Running `db-query-matchers` to check SQL queries--this is an awesome gem.
- Rendering something and then
- Serializer with a serializer inside: you have to explicitly pass scopes or AR results if it turns out that the needed database objects are already existing in memory. You can do the optional arguments if you need to.
- `vimrc` location: `:version` in Vim.
- Good to know that I know some programming tools that I expect will still be here in the future: Vim, Unix, man pages. I think at some point I will need to learn C, probably Python.
- LLVM is pretty important to learn.
- Set time zone in Ruby: `TZ=UTC` [Reference](https://stackoverflow.com/questions/4703830/set-time-zone-offset-in-ruby)
