---
layout: post
title:  "TIL, 2018-05-27, Review Heroku"
date:   2018-05-27 21:01:37 +0800
categories: programming
summary: "Prep for potential deployments."
---

- [Heroku practice ;).](https://devcenter.heroku.com/articles/getting-started-with-rails5)
  - `be rails new --database=postgresql -T`.
  - `be rails generate scaffold HighScore game:string score:integer`
  - `heroku create` → at this point the Heroku app will exist, but no code yet.
  - `git push heroku master`
  - `heroku run rails console`
  - `heroku run rake db:migrate`
  - `heroku logs --tail`
- [Hanging `Use realline from homebrew` when installing a Ruby from `rbenv`.](https://github.com/rbenv/ruby-build/issues/1064)
  - Patience from Zhou.
  - `RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)" rbenv install 2.5.1`
