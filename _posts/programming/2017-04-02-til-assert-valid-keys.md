---
layout: post
title:  "TIL, 2017-04-02, assert_valid_keys"
date:   2017-04-02 18:16:58 +0800
categories: programming
summary: "Assert Valid Keys"
---

- Mass move: `mv _posts/*.md _posts/programming`.
- Just use `update_attributes!` and `create!` instead of `update_attributes` and `create`, if only to avoid silent failures. The `update_attributes` will work if you are doing a `valid?` later. [Reference](https://rails-bestpractices.com/posts/2012/11/02/check-the-return-value-of-save-otherwise-use-save/)
- Another ActiveSupport gem: `assert_valid_keys`.
- `rack-mini-profiler`.

#### Benefits of Testing

- It is a way to document what your code does.
- Sooner or later, you will forget what your code actually did, it is like a mental reminder of why your code is like this or like that.
- It is a way to ensure sanity when trying to refactor a class. Show: `Tenants::CreateService.`
- It is a way to ensure that everything still works when trying to optimize something in your Rails code. Show: An example of ensuring that n+1 queries will be sped up. [Reference](https://blog.heroku.com/solving-n-plus-one-queries)
- It is just a good practice to do. You
- Small thing: You figure out what is memoized or not. BTW small things like this are impora

#### Cons

- You are like learning a new programming language.
