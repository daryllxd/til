---
layout: post
title:  "TIL, 2017-04-07, Where Um"
date:   2017-04-07 15:00:04 +0800
categories: programming
summary: "Where Length vs Size vs Count."
---

- Multiple email addresses for the same account--um why?
- `validate_false:` Allows you to do a `create(:user, :validate_false)` (create a user but skip validations) [Reference](https://github.com/thoughtbot/factory_girl/issues/578)

``` ruby
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }

    trait :validate_false do
      to_create { |instance| instance.save(validate: false) }
    end
  end
end
```

#### The Elements of Style in Ruby #13: Length vs Size vs Count
[Reference](http://batsov.com/articles/2014/02/17/the-elements-of-style-in-ruby-number-13-length-vs-size-vs-count/)

- Good idea: `size` for collections and `length` for strings, since hashes and stacks don't have a length but a size.
- `count` can be invoked with a block or argument.

``` ruby
arr = [1, 1, 2, 3, 5, 6, 8]

arr.count(&:even?) # => 3
arr.count(1) # => 2
```

- AR::Relation `count` will perform a count query, `length` will load up the records, and `size` will do the smart thing based on whether it is loaded.
- Set or Hash are faster with `length` and `size` vs. `count`.
