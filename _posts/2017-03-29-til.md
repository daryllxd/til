---
layout: post
title:  "TIL, 2017-03-29, THE MYSTERY OF THE PASTE IN VIM"
date:   2017-03-29 10:48:50 +0800
categories: programming
---

- THE MYSTERY OF THE PASTE IN VIM. Seriously this has bothered me for so long. If you paste stuff from outside and they are formatted, you need to `:set paste`, paste, then `:set nopaste` after. THANK YOU BASED [http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste](http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste).
- ActiveSupport: `instance_values`. [Reference](http://api.rubyonrails.org/classes/Object.html#method-i-instance_values)
- Jekyll themes are a thing. Jekyll also needs some tweaks to make sure included posts are also compiled to HTML from markdown.
- Made my own policy classes hehe.
- `nil.inspect` for human readable specs.

``` ruby
module Policies
  class BasePolicy
    attr_reader :context

    def initialize(context)
      @context = context
    end

    def call
      return_error unless valid?
    end

    protected

    def return_error
      error_class.new(error_message)
    end

    def valid?
      raise 'Must implement #valid'
    end

    def error_class
      raise 'Must implement #error_class'
    end

    def error_message
      raise 'Must implement #error_message'
    end
  end
end
```

``` ruby
module ImplementsPolicies
  def pre_method_hooks
    policies.map do |klass|
      proc { klass.new(context).call }
    end
  end
end
```
