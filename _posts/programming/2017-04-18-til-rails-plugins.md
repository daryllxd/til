---
layout: post
title:  "TIL, 2017-04-19, Enterprise Rails--Plugins"
date:   2017-04-19 09:29:54 +0800
categories: programming
summary: "Where I Read About Rails Plugins"
---


## Chapter 2: Organizing with Plug-ins
[Reference](https://dan.chak.org/enterprise-rails/chapter-2-organizing-with-plug-ins/)

- I need to read this because GC might support multiple match types.
- At some point you will get to 100 classes.
- Refactoring is harder late in the game.

#### Benefits

- Plug-ins provide a convenient mechanism to separate architectural enhancements from business logic. Intertwining these two can be a quick route to bugs.
- Plug-ins can be tested independently from the rest of your application, giving you greater confidence in the overall robustness of your code.
- Limiting application code to business logic makes application easier to upgrade when new Rails versions are released.
- They can be shared between multiple applications. This is good for SOA.
- **Think of your application as layers. There’s the Ruby language itself. On top of that is the Rails framework. Instead of dumping a behemoth, unorganized “code layer” on top of the framework, you can gain a lot by splitting that layer in two: architecture enhancements (plug-ins) and business logic.**

#### Why Extend Hash?

- Ex: of when Ruby is slow: Converting the results of an SQL query into AR objects.
- Along with the sugar that AR provides comes a heavy overhead of creating the object itself.
- **Getting your results out of the database as hashes is much faster--more than 50% faster than requesting AR objects.**

``` ruby
MyObject.find(:all) => 7 seconds
MyObject.connection.select_all(“select * from my_objects”) => 3 seconds
```

#### Custom Extensions

- Make a plug-in out of a mixin (`acts_as...`).


``` ruby
module Animal

  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      include InstanceMethods
    end
  end

  module ClassMethods
    def acts_as_animal(params)
      class_eval <<-STUFF
        def noise
          '#{params[:noise]}!'
        end
      STUFF
    end
  end

  module InstanceMethods
    def generic_animal_thing
      'poop'
    end
  end
end
```

- Testing: Include the module again, then create a small class that implements that module. Then test that the small class can do the plugin thing.
