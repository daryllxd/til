---
layout: post
title:  "TIL, 2018-03-07, Non-MRI Ruby?"
date:   2018-03-07 13:24:24 +0800
categories: programming
summary: "Asking about using non-MRI Ruby in production, and the state of `strong_parameters` in Rails 5.x."
---

## Musings

- Should I make a script for doing `bundle update <GEM NAME> | ag <GEM NAME>`?
- Fixing CircleCI bugs today. [Reference](https://discuss.circleci.com/t/rails-5-with-2-0-cant-run-rspec-using-multiple-containers/16665) [Reference](http://blog.overstuffedgorilla.com/rails-5-x-and-postgresql-on-circleci-2-0/)

## Non-MRI Ruby for Production Apps?
[Reference](https://www.reddit.com/r/ruby/comments/82nq0w/have_you_used_nonmri_ruby_for_production_apps/)

- JRuby, Rubinius, and TruffleRuby are all parallel implementations of Ruby, which is something that some people appreciate.
- JRuby for a real time analytics pipeline. It's because of proper threading and a good GC.
  - The first use case was a process working with RabbitMQ and MongoDB, which was very tricky in MRI.
- JRuby is used for places where code performance is a bottleneck. There's usually a lot of low-hanging fruit to optimize in an app before thinking you need the baggage of a non-MRI Ruby.
- MRuby to build a GUI for a musical synthesizer. MRuby is much easier to embed than other versions.
- JRuby in production.

## Strong Parameters for Rails API?
[Reference](https://www.reddit.com/r/rails/comments/82h6sv/strong_parameters_for_rails_api/)

- If you're not using mass-assignment, it's still a personal choice. Assume that your users an pass in bad parameters.
- Strong params is whitelisting in the controller. It works the same as a non-API app.
- Strong params: you are force to list the attributes which you are allowing to be changed for a particular circumstance.
- Complex validation requirements: `jschema`, this is quite flexible and more approachable than strong parameters.
