---
layout: post
title:  "TIL, 2018-06-01, The Saga Pattern"
date:   2018-06-01 11:51:24 +0800
categories: programming
summary: "Importing data and handling conflicts, Keeping JSON key casing consistent, type systems, ActiveRecord::Suppress."
---

# Applying the Saga Pattern (Great Talk!)
[Reference]((https://www.youtube.com/watch?v=xDuwrtwYHu8)

# Confusion about Saga pattern
[Reference](https://medium.com/@roman01la/confusion-about-saga-pattern-bbaac56e622)

- Saga is a failure management pattern. Sagas are an approach to handling system failures in long-running transactions.
- It is not a state machine (state machine is a set of well-defined states, where transition between states is initiated by triggering an action.)
- Workflow: where transition between them occurs when the previous activity is completed. This includes branching to other activities.
- *Saga: Multiple workflows, each providing compensating actions for every step of the workflow where it can fail.* Sagas are not necessarily implemented using workflows.
- Sagas are for handling long-running transactions/and their cancellation, and is a process manager, managing orchestration between different bounded contexts that don't share any dependency.

# Saga: How to implement complex business transactions without two phase commit.
[Reference](https://blog.bernd-ruecker.com/saga-how-to-implement-complex-business-transactions-without-two-phase-commit-e00aa41a1b1b)

- In Domain Driven Design (DDD) the pattern is well known as you need to apply it as soon as you have use cases involving multiple bounded contexts to collaborate.
- In the microservice community it is less known but necessary whenever an overall flow involves multiple services.
- Saga includes state handling + remembering what you did.
- What you need:
  - Durable Saga log.
  - SEC Process (Saga Execution Coordinator).
  - Idempotence of compensating actions.

# Importing data and handling conflicts in Ruby on Rails applications
[Reference](https://www.mutuallyhuman.com/blog/2016/08/19/importing-data-and-handling-conflicts-in-ruby-on-rails-applications)

- We can do a `on_duplicate_key_update` thingie to specify that we want to update `name` when a duplicate is found.
- If the data being inserted would cause a duplicate, then MySQL will perform an `UPDATE` on the existing row.

``` ruby
Author.import(
  [:name, :key],
  rows_to_import_second,
  on_duplicate_key_update: [:name],
  validate: false
)
```

- On how to detect duplicates: `columns: [:name], conflict_target`

# RailsConf 2017 Panel: Performance, Performance
[Reference](https://www.youtube.com/watch?v=SMxlblLe_Io)

- Measure it first boys. Each Ruby object gets a slot in the Ruby VM.
- Discourse: Sam has a blog post on this thing.
- Defer JS, CDN.
- Low request variance on seconds thingie.
- Slowest endpoints that have a high amount of traffic.
- Freezing fucking strings?
- Fast vs pretty code?
- The thing about freeze is that if you don't really use the string more than once, why?
- Strike-proof.
- Thing that can cause a slow thing in production: Data in the database. Also when one specific user is logged in. Like paper trail.
- Chrome Dev Tools for throttling your network connection.

# Musings, Ruby

- [Sifter Class](https://www.mutuallyhuman.com/blog/2016/11/18/sifting-scoping-and-selebrating)
  - AR's merge does a no-op if you merge `nil`. So you can still chain `Sifter` scopes that we do not want applied.
  - So you can have an `apply_scopes` where you slowly inject the scopes.
- [Keeping JSON Key Casing Consistent.](https://www.mutuallyhuman.com/blog/2018/01/22/keeping-json-key-casing-consistent-over-http-requests-and-websockets-a-ruby-on-rails-short)
  - Olive Branch: used to ensure that JSON keys were lower camel case by the time the front-end received an HTTP response.
- `Hash#deep_transform_keys` exists, where you convert a hash's keys via the block operation.
- [ActiveRecord::Suppress](https://blog.bigbinary.com/2016/03/11/suppress-save-events-in-rails-5.html) exists. (I don't like it.)
- [Stripe is building a Ruby typechecker](https://medium.com/byteconf/stripe-is-building-a-ruby-typechecker-d6cd7cee6abf)
  - Facebook's Flow and MS's TypeScript added stability to a famously "loose"language.
  - Ruby typechecker: Sorbet.
  - 9 months of work by 3 people. Real thing, ruins over all code of Stripe.
  - Focus on practicality, designed with nice error messages, local type inference, no need to declare local variables, non-nillable types by default, smart control-flow dependent typing, union/intersection types.
