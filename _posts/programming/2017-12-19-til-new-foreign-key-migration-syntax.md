---
layout: post
title:  "TIL, 2017-12-19, New Foreign Key Migration Syntax"
date:   2017-12-19 12:17:53 +0800
categories: programming
---

- `git worktree list` to see the worktrees. These are also on like an absolute basis path wise.
- Color picker tool: [Reference](https://coolors.co/browser/best/1)
- New `add_reference` thing:

``` ruby
add_reference(
  :transcripts, :created_by_user,
  index: true, null: false,
  foreign_key: { to_table: :users }
)
```

- `hub` [Reference](https://hub.github.com/) looks nice!
