---
layout: post
title:  "TIL, 2017-03-18, RubyconfPH Day 2"
date:   2017-03-18 08:21:18 +0800
categories: programming
---

# RubyConfPH 2017 Second Day

## Nick Sutterer: The Ruby Box - 10 Ideas for Change

#### Rails ActiveRecord 631 public methods: bad design because:
- Deprecation PITA
- Wrong order

#### Solution: Functional Objects

- This is why Trailblazer has 1 public `call` method.
- No state to maintain.
- Easier to test since fewer methods.

#### Ruby

- The `&.` operator helps do the `try` pattern, something like `user.&.profile&.thumbnails&.large`.
- Trailblazer - The `><` operator.
- A feature in Ruby is not exactly something that you should use.
- Ruby `extend`, don't use it at runtime.
- Monkey patching, not really
- `const_missing?` - allows you to load constants at runtime. Possible to misuse.
- `autoload`.
- `respond_to` -- Ask object if the object responds to the method. Problem with `respond_to` is that it is used everywhere in Ruby. The problem with `respond_to` is that it is an "do you have this behavior". `is_a` is okay, since you are asking for what it is, not what it behaves like.
- People rewriting gems are sometimes "I think I can write this gem better".

#### Service Objects

- Trailblazer--it extends the MVC thingie.
- `Trailblazer::Operation` -- gives you a Service Object implementation for free. Passing around state is free. You have a unit test for the service object.

#### Enterprise

- We're basically all enterprise software writers. Stop resisting the idea that we are against enterprise because we want Ruby to be a stable language.
- New Trailblazer feature--make diagrams so non-tech people can understand software. `BPMN`.
- Define the workflows in `BPMN`.

#### Summary

- Don't use tools just because you have it.
- MRuby does not use those tools.
- AR Concern--bad since it looks like you're abstracting, but you are just hiding the methods in another file.

## Simone Carletti: How Programming In Other Languages Made Me a Better Ruby Developer

- "Emerging languages" - Lua, Kotlin, Clojure, Erlang, Haskell, Elixir, Go, Rust, Swift, Julia. Some of these have existed for years, but they offer some hints of how to improve programs.

#### Structs to the Rescue

- We are trying to move responsibility to other data objects.

``` ruby
module Structs
  class Domain
    def initialize(attributes = {})
    ...
    end
  end
end
```

- Separate data from execution logic
- No state changes, means very loose coupling between the data and operations

### Stateless business logic

- Inspired by Elixir. Ruby is not f(x)al but it has f(x)al language features.
- What we usually do is not do `update_attributes` but do methods like `update_score` and it is a wrapper around `update_attributes`, so we aren't tied to Rails `update_attributes`.
- Eventually, we will just have persistence-related methods in the AR::Base object.
- Reduce side effects cause by states, improving test effectiveness and code maintainability.
- Simplify tests by reducing context setup.

#### Functional-like

- There are very few functional languages.
- Functional approach: Returning the value that is supposed to get returned. That way you can return the new value that was supposed to get returned or you can mock the return value.

#### Dependency Injection

- `CoffeeMachine` example--if it is possible to decouple the machine implementation, you have to be able to isolate the dependency in the initializer code

``` ruby
def initialize(company, machine: CoffeeMachine.connect('api.dnsimple.coffee'))
  @company, @machine = company, machine
end
```

- Benefit of this approach: You can do shit like `described_class.new(company, machine: machine)`. The `machine` can exist as an actual mock `class TestCoffeeMachine` with actual methods.

#### Powerful Error Handling

- You can rescue errors based on Inheritance.
- As a library designer, it is nice to make your own library-related error, that way when consumers use your gem, they can see errors from your library.
- `error.cause`.

#### Programming Without Defaults

- What would you do if Ruby would drop default parameters? Because in Go, there are no default parameters. The way to do it is to make an explicit Struct that contains those default parameters.

#### Value of Simplicity

- Value of Simplicity. Rob Pike, dotGo 2015.
- Limit the use of `alias`.

## Joy -- Ruby Golf

- A practice in which one tries to achieve the shortest possible code that solves a certain problem using the Ruby language.
- `*1..$*`
- Asterisk is shorter than `Array#join`. `*splat` to create the array, `splat*` to join an array.
- [] -> Access array.
- Bad things: Unreadable code, where the fuck is the syntax error if everything is in line 1.
- Good things: Language features that aren't used that much, alternative use of language features.
- The program that outputs itself.

## Prathamesh - Hidden Features of Rails 5

- New Welcome Page!
- Rendering views outside of the controller: `OrdersController.render :show`.
- Request environment.
- Faster rendering of partials from cache.
- `ActiveJob` per active job adapter,  you can do this

``` ruby
class EmailJob ActiveJob
  self.queue_adapter = :sidekiq
end

class NewsLetterJob < ActiveJob
  self.queue_adapter = :delayed_job
end
```

- `rails dev:cache`--will restart the serve with caching also working. Do `rails dev:cache` again to disable caching.
- Puma as default web server.
- `#config/environments/development.rb #=> config.assets.quiet = true`
- Finer control over SSL usage. `config.force_ssl = true`. `hsts` (I don't know what this is :().
- Controller actions default to `204 No Content`. -> `No template found for PostsController... Completed 204 No Content`
- `ActionController::Parameters` is no longer a permit, you decide what to permit and what to not permit. To hash it, you do `user_params.to_h` or `user_params.to_unsafe_h`. You can't call hash methods i.e. inject on AC::Parameters.
- [http://blog.bigbinary.com/categories/Rails-5](http://blog.bigbinary.com/categories/Rails-5)
- Rails 5.1.0 beta is already out.

## Gautam Rege: GoFFI Around With Ruby

- Foreign Function Interfaces.
- Josh Software.
- Background jobs are done for speed!  If we can get a better value, why not go with it?
- Why Go (the language)?
- Can we actually use the speed of Go in Ruby?

#### Go

- Power of multi-core
- `Goroutines` to the rescue
- Language is focused
- Programming Ethics
- Compiled

#### What is FFI?

- Language interoperability, calling convention, `libffi.so`. No more `Building native extensions...` while installing gems. This makes the code portable.
- `arr := []int{}`.
- x times faster to do the same shit (50 million element array).
- Call Go from Ruby. Compile the Go code to C, then use FFI from Ruby to access the Go code (code sample huhubells).
- Practical example: Calculate something with 500k combinations then index them in `ElasticSearch`?
- Sidekiq: 2GB memory, 18 minutes. GoFFI: 135MB, 2 minutes?

## Complexities of FFI

- Memory Management
- Pointer Management
- Learning Go--never try to compare a language. Thinking about Go is about programming ethics. Something about ordered hashes. Effective Go and A Tour of Go.
- Why not just do microservice in Go and hit it? Depends on the use case.
- Deploying this? When the Go binary compiles, it is self-contained.
- The problem is trying to give the
- Error handling:

## JP Moral: Microservices

#### Reasons for the Switch

- Make deploys safer
- Simplify and standardize code.
- Improve performance.

#### What Went Well

- Good Isolation of Business Concerns
- Easier to make and deploy/rollback isolated systems
- Same feature set, avoiding second-system syndrome.

#### What We Learned

- Planning is Crucial
- Leave Room to Make Design Changes
- Choose a Sane Initial Feature et
- Automation

## Lightning Talks

- Minecraft Mod: 1. Needed to open source and edit. 2. Forge, problem is that each version of Minecraft has their own forge. Eventually it became something like Rubygems.
- Something about water treatment.
- Sometihing about claps and automating it.
- Lackeys gem. How you add stuff to the model.
- The best way to to take a picture = a selfie. Good way to see your progression as an individual to see what has changed. Life is about people + selfies have people = selfies are life.
- IRB magic tricks. This is a magic trick! Hehe.
- Visualizing Your Rails' Requests. Gem: Waypoints, you can see the methods called in a file thingie.
- Lester "Conference Talk". Being a conference talk speaker.
- Low tech vs. High tech. It is not binary. You can sometimes combine low tech stuff like analog input and combine
