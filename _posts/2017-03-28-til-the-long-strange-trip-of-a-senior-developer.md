---
layout: post
title:  "TIL, 2017-03-28, The Long Strange Trip of a Senior Developer"
date:   2017-03-28 12:48:16 +0800
categories: programming
---

- `ActionView::Helpers::NumberHelper`.
- Resque web weird stuff????
- VALUES RULE
- Factory Girl, when creating a value object

```ruby
      FactoryGirl.define do
        trait :initializes_as_value_object do
          skip_create
          initialize_with { new(attributes) }
        end
      end
```

## [RubyConf 2016 - The long strange trip of a senior developer by Brandon Hays](https://www.youtube.com/watch?v=egntf0nykzk)

- Technical capability: Curiosity, rigor/discipline, fearlessness, propensity to ship.

#### Curiosity

- Junior: Just enough to ship.
- Mid: Deep exploration of 1 language/toolset.
- Senior: 2+ languages/toolsets.
- Beyond: Synthesis advances state of the art.

#### Rigor and Discipline

- The ability which foot to put forward and a willingness to go forth that path.
- Junior: Very bad or no tests.
- Mid: Slow, fragile tests.
- Senior: Decent, fast tests.
- Beyond: "We need a new approach to testing."

#### Fearlessness

- An unwillingness to be intimidated with a problem without a clear solution.
- Junior: Isn't there a framework for this?
- Mid: I'll try to write a framework.
- Senior: Let's not write a framework.
- Beyond: Let's fix the framework we already have.
- It's knowing that failure is an outcome, and knowing what to do anyway.

#### Propensity to Ship

- Junior: Nothing to show just yet.
- Mid: A graveyard of abandoned projects.
- Senior: Maintains a few long-running projects.
- Beyond: Has projects with industry-wide usage.

#### Owner's Mindset

- TOO MANY! Hehe
