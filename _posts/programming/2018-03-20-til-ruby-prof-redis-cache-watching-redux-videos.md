---
layout: post
title:  "TIL, 2018-03-20, Understanding Deeply. Solved CircleCI on Daryllxd finally."
date:   2018-03-20 14:31:00 +0800
categories: programming
summary: "Where I just power through"
---

## Musings + So Good They Can't Ignore You

- [Understand Deeply](https://brandur.org/fragments/understand-deeply)
  - Most of the world is happy enough to know just enough to be useful, and would never think to venture deeper.
  - The best people know how to peer beyond the curtain. They can explain its in-memory data structures, how it lays out information on disk, or describe the precise mechanics of its replication scheme.
  - Technology: It can be treated like a black box, but when you run into things like overflowing job queues, you need someone that knows what's happening internally.
  - Aim to be an engineer and not just a user. Start with the manual, and endeavor not just to understand, but to understand deeply.

## Musings

- `ruby-prof` easy to use.
  - `Pg::Connection#async_exec` is the method that AR is calling when it needs to get things from the database.
  - 15% going to start ActiveRecord when booting up the CLI.
  - What he hell `timecop` and `binding.pry` interaction, the tests become super super slow.
- Looking to implement `redis`, `redis-rb`, and `redis-namspace` again.
- Bye `stronger_parameters`, it was nice knowing you but I think I'll try `dry-validation` next.
- Upgraded `database_cleaner` to 1.6.2.
- Why did I just discover `tig` now?
- I just powered through
- Finally solved the freaking CircleCI thing. Turns out I was just not installing `rspec` because of the `bundle install --without development` lol.
- [Quickly reload ZSH config: `~/.zshrc`](https://coderwall.com/p/tffpoa/quickly-reload-zsh-config-zshrc)
- SQL `average` will cause an N+1 because it's better to just execute a raw SQL so the iteration is done in the database. AR does not know that it has to aggregate.
  - There is also a timing thing in Ruby when you aggregate. If high write, then data may be stale.
  - Cool snippet: `User.joins(:owned_ratings).select(*User.column_names).select("AVG(ratings.score) as average_rating_score").group(*User.column_names)`
- Formspree!
