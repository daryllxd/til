---
layout: post
title:  "TIL, 2018-02-27, Objects on Rails."
date:   2018-02-27 13:27:33 +0800
categories: programming
summary: "Got Phoenix auth to work, and after 4 years, I finish Objects on Rails."
---

## Musings

- [Capitalization after colons.](https://data.grammarbook.com/blog/commas/capitalization-with-colons/)
  - Do not capitalize if only one sentence follows the colon.
  - Capitalize if more than one sentence follows the colon.
  - Do not capitalize the first word of a list after a colon.

## Musings, Rails

- I think that you should really think of Rails apps as "Can this exist without Rails around it?". It makes things easier re: how you write your app.
- Although we are used to Rails's convention over configuration, there has to be some missing pieces.
- Reading Objects on Rails.
  - Choosing appropriate domain language for program elements often means we don't need to rename as many things as we add more features down the road.
  - Structuring objects in trees.
    - Control access based on authorization.
    - Pre-load child objects with a reference back to their parent.
    - Save a reference to the child object in the parent.
  - Stubbing out modules: a way to insert ActiveModel into the tests if it is loaded already, but use the existing one if it is loaded already.

``` ruby
def stub_module(full_name)
  # If you do ActiveModel::Naming,
  # You create a module ActiveModel, then you create a module ActiveModel::Naming
  full_name.to_s.split(/::/).inject(Object) do |context
    begin
      context.const_get(name)
    rescue NameError
      context.const_set(name, Module.new)
    end
  end
end
```
  - On the backlash vs Dependency injection: It's just a way to pass an object's collaborators in from the outside.
  - Logic in views is almost always bad news.

- Structuring apps:
  - Cache layer via Redis.
  - Backing store that is triggered by a job.
  - Orchestrator to figure out how data is going to persist.
  - Presenter to command line application.

## Musings, Elixir/Phoenix

- JWT bug: Right, just a config file!
- Phoenix slim:

``` elixir
= if ...
else # Yes, no anything...
  h4 You're logged in boys
```

- An `= else` would lead to 100% CPU usage.
- `mix phoenix.gen.model`, but `mix phx.gen.html`.
- Watched Chris's Lonestar Elixir talk re: the `models` directory slowly becoming a dumping ground. I love how deliberate he is re: extracting things.
- The Phoenix generators are just a way to help people to learn "where to put things". (As they should!)
- `when byte_size(value) >`
