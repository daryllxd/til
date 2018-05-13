---
layout: post
title:  "TIL, 2018-05-12, Stack Overflow Triage"
date:   2018-05-12 01:11:06 +0800
categories: programming
summary: "Database views in Rails."
---

- Triaged some questions in SO. Man they are really smart with this stuff. They can let a human do machine-learning things to get reputation scores. THAT IS AWESOME man.
- [Error codes from Rails Exception?](https://stackoverflow.com/questions/50302565/how-to-tell-which-error-status-code-will-be-rendered-from-rails-exception): It's in ActionPack lol.
- [Database View in Ruby on Rails](https://medium.com/@ali.sepehri.kh/database-view-in-ruby-on-rails-7331d2ee9784):
  - The problem with a concatenation like `PhotoPost.all + TextPost.all` is: performance issue and hard to sort/paginate, because you get out of `ActiveRecord::Relation`.
  - With a polymorphic model, honestly, ugh!
  - Database View, `CreatePostView` and inherit from AR. Problem is, the view will not get added to `schema.rb`. You can change the `schema_format` to SQL.
- [`scenic_view` gem](https://github.com/thoughtbot/scenic): "I use it for data roll ups (like a data warehouse) and for times when I need fast access to a weird collection of joins (subselects, etc). It's great!"
