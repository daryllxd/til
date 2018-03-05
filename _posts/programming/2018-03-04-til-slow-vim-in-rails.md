---
layout: post
title:  "TIL, 2018-03-04, Vim is Slow in Rails."
date:   2018-03-04 10:12:25 +0800
categories: programming
summary: "Where I Struggle with the Slowness of Vim in Rails."
---

- Vim has been unbearably slow in Rails projects. This repo works fine, Elixir repo works fine, but in Rails projects, ugh. I'm not sure if it's a `CtrlP` thing or something else.
- Currently looking at authentication solutions for Rails.
- There's a thing called `ApiConstraints`?
- [Rails routes](https://devblast.com/b/rails-5-routes-scope-vs-namespace):
  - `namespace`: prefixes the URL option, and try to locate under a module names in the same manner as the namespace. Simple.
  - `scope`: has `module`, `path`, and `as`:
  - `module`: controller directory location.
  - `path`: prefix set in the URL, before the resource name.
  - `as`: name of the path method used to identify the resources.
- [Rails API constraints in the routes file](https://www.bignerdranch.com/blog/adding-versions-rails-api/):
  - It's nice, and I tried it out, I just need to add a fallback controller and tests.
- [Setting up doorkeeper.](http://naturaily.com/blog/post/api-authentication-using-devise-and-doorkeeper-minimal-setup)
  - It's a standardized implementation of access tokens.
  - To stub access: `allow(controller).to receive(:doorkeeper_token) { double(acceptable?: true) }`
  - [Override the Rails helpers here.](https://github.com/doorkeeper-gem/doorkeeper/blob/master/lib/doorkeeper/rails/helpers.rb) [Customizing the response body when unauthorized.](https://github.com/doorkeeper-gem/doorkeeper/wiki/Customizing-the-response-body-when-unauthorized) [Testing Protected Controllers.](https://github.com/doorkeeper-gem/doorkeeper/wiki/Testing-protected-controllers)
