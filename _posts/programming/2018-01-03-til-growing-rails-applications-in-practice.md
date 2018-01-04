---
layout: post
title:  "TIL, 2018-01-03, Growing Rails Applications in Practice"
date:   2018-01-03 15:47:25 +0800
categories: programming
---

- Controller redesign:
  - Security (authentication/authorization)
  - Parsing/white-listing parameters
  - Loading/instantiating the model
  - Deciding which view to render
- Rails responders? [Reference](https://github.com/plataformatec/responders)
- `ActiveType` and revisiting `ActiveModel` to use for sign ins and other things which have some form of a model.
- Ruby 2.5: `delete_prefix`.
