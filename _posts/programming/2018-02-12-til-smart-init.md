---
layout: post
title:  "TIL, 2018-02-12, smart_init"
date:   2018-02-12 06:12:56 +0800
categories: programming
summary: "Where I read smart_init gem code."
---

## Musings:

- On focusing: just minimize all the damn tabs that you're reading.

## `smart_init` gem study:

- You can do things like this to have the "created as a base class with the mixin" if you either need to have both mixin and base class form.

``` ruby
class SmartInit::Base
  extend SmartInit
end
```

- `define_singleton_method` basically creates a class method with the arguments in a block. You can call it like this:

``` ruby
  def is_callable
    define_singleton_method :call do |*parameters|
      new(*parameters).call
    end
  end
```

- `test_unit` looks simple enough, or is it just like the most basic example? Lol.
