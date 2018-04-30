---
layout: post
title:  "TIL, 2018-04-28, We're Back"
date:   2018-04-28 15:42:02 +0800
categories: programming
summary: "`I18n` on Non-Rails, `alias` vs `alias_method`, Serverless book"
---

# Musings, Back-end and Ruby

- Rails loads the I18n, you need to load it outside of Rails with `I18n.load_path += Dir["#{app_path}/config/locales/**/*.yml"]` [Reference](https://stackoverflow.com/questions/12917329/i18n-without-rails?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
- `File.realpath("symlink_path")` to get the target of a symlink. [Reference](https://stackoverflow.com/questions/1237939/how-do-i-get-the-target-of-a-symlink?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
- [Removing a scaffold in Rails: `rails d scaffold SCAFFOLD_NAME`](https://stackoverflow.com/questions/963420/undo-scaffolding-in-rails?rq=1).

- Habitat: used for the app, Chef: used for provisioning the server.
- [10 Common Software Architectural Patterns](https://towardsdatascience.com/10-common-software-architectural-patterns-in-a-nutshell-a0b47a1e9013)
  - Layered: Subtasks, each of which is at a particular level of abstraction. Presentation/application/business logic (domain)/data access (persistence).
  - Client-server.
  - Master-slave: used in DB replication.
  - Pipe-filter pattern: Each step is ran through pipes, and can be used to sync or for buffering.
  - Broker: Structures distributed systems with decoupled components. A broker is responsible for the coordination of communication among components. Servers publish their capabilities to a broker: clients request a service from the broker, and the broker then redirects the client to a suitable service from its registry.
  - Peer-to-peer.
  - Event bus: Sources publish messages to channels on a bus, and listeners are notified.
  - MVC.
  - Blackboard.
  - Interpreter: SQL, languages used to describe communication protocols.

- `alias` vs `alias_method`: [Reference](https://stackoverflow.com/questions/4763121/should-i-use-alias-or-alias-method?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa), [Reference](https://blog.bigbinary.com/2012/01/08/alias-vs-alias-method.html)
  - If you implement `alias`, when you call the aliased method in a child class, the child class calls the aliased method in the parent class.
  - Ruby style guide: "prefer alias when aliasing methods, so it communicates to the user that your alias will not be altered at runtime or by any subclass unless explicit."
  - ***`alias` is a keyword and is lexically scoped: it treats `self` as the value of `self` at the time the source code was read.***

``` ruby
class User

  def full_name
    puts "Johnnie Walker"
  end

  def self.add_rename
    alias :name :full_name
  end
end

class Developer < User
  def full_name
    puts "Geeky geek"
  end
  add_rename
end

Developer.new.name #=> 'Johnnie Walker'
```

- [On skills:](https://dev.to/isaacandsuch/years-of-experience-is-a-garbage-metric)
  - Side projects, contributing to open-source, hacking on Github, enthusiasm for cool shit/software.
  - Learn about code quality, show that you care about it.
  - Teach the world that developers are more than their resumes.
  - Of course, experience matters, but it's not everything.
  - 15 years of experience, of 1 year of experience repeated 15 years in a row?


- Readline in the Ruby library: `require 'readline'`
- `parslet`: Parsing expression grammar?
- Regex: `^` as not?

- DAS 83: Test cases vs example
  - Hamster vector library?
  - Representing test cases not as things that happen, but as human-readable output.
  - You can put test helpers to make the thing terse/readable.
  - By doing shit like `def_delegator`, it's testable literally by doing an alias anyway.
  - If you can rewrite a class such that the value just relies on everything inside of it, why not?

  - Bitcoin mining inside of a Browser?

# Reading Serverless Stack Book

- Amazon Cognito. Wow. Amazon really does a lot of things.
- DynamoDB: Is this
- CloudFront: Create distribution, has custom error responses.

# Musings, React

- [When to state and when to props?](https://hackernoon.com/understanding-state-and-props-in-react-94bc09232b9c)
  - Props flow downward from the parent component.
  - When a component receives data from someone other than the parent, we can use state.
  - State: for data that will change.
- Medium posts: I like gists for this, for interpolation shit.
