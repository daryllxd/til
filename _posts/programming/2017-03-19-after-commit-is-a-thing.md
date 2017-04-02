---
layout: post
title:  "TIL, 2017-03-19, after_commit is a thing"
date:   2017-03-19 08:21:19 +0800
categories: programming
---

- Etymology of Grep: `:g/re/p`. `re` is RegEx, `p` is `:print`.
- `:g//d` => 2 slashes means use the past pattern matched.
- Rails `sort` and Enumerable `sort_by`. Honestly not really sure whats better.
- Class methods vs. instance methods, the problem with static methods is that if you are going to do 2 operations on one object, then you need to do the static method call again as opposed to chaining commands on the instance methods.
-  [`public_send`](http://apidock.com/ruby/Object/public_send): `public_send` calls public methods only. (Also it is more greppable).


#### [Source](http://jetruby.com/expertise/common-ruby-rails-mistakes-model-database/), [Source](http://jetruby.com/expertise/common-rails-mistakes-ruby-way/)

- [`after_create` vs. `after_commit`](http://apidock.com/rails/ActiveRecord/Transactions/ClassMethods/after_commit). The model's data *including its new ID* `after_create` is available from the inside but not from the outside. `after_commit` is also called after update and destroy. (Use `test_after_commit` gem.) You can also do `after_commit_on_create`.
- ORM is sometimes slower.

      # Bad
      Course.all.select { |course| course.created_at < 5.years.ago }.each { |course| course.articles.delete_all }

      # Good
      old_courses_ids = Course.where(‘created_at < ?’, 5.years.ago’).pluck(:id)
      Article.where(course_id: old_courses_ids).delete_all

- Ruby bang method. Trigger only if a method modifies the object it is called, or it will throw and exception if it doesn't execute successfully.
- Predicate method: ends with ?.
- Always use constants instead of random numbers to make them declarative.
- Readability aspect over "less code".

      # Bad
      def some_filter
        return unless user_signed_in?
        return if current_user.customer? || current_user.admin?

        redirect_to root_path
      end

      # Good
      def some_filter
        return unless user_signed_in? || !(current_user.customer? || current_user.admin?)

        redirect_to root_path
      end
