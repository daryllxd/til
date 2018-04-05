---
layout: post
title:  "TIL, 2018-04-04, Result Objects and Callee."
date:   2018-04-04 18:07:38 +0800
categories: programming
summary: "Monads for SuccessfulOperation, Flaky Ruby tests, and getting method names."
---

# Musings, JS and React

- Formspree is awesome!
- HTML5 form validation is okay as a first declarative validation layer.

# Musings, Ruby

- `undef_method`: Only in class definitions, you can probably use this in a file.
- [Getting method names](https://stackoverflow.com/questions/35391160/difference-between-callee-and-method):
  - `__method__` to get the name of the method, good for passing to another abstraction thing.
  - `__callee__` looks up the name dynamically and refers to the name under which the method was called.
- Updating with bang methods:
  - `ActiveRecord::RecordInvalid` inherits `ActiveRecord::ActiveRecordError`, which inherits from `StandardError`.
  - When updating via `update_attributes`, we get `ActiveModel::Errors`, not `ActiveRecord::RecordInvalid`.
- Is the adapter design pattern an Anti-corruption layer?
- [Single vs Multi-tenant SaaS:](https://hackernoon.com/exploring-single-tenant-architectures-57c64e99eece)
  - Create a database, provision some servers, add a load balancer, add some caching, and call it a day.
  - Any-scale system: a system that's built to remove scale from that equation.
  - Multi-tenant: Load balancer, gateway, subnets, kinesis, lambdas, Redshift...
  - Multi-tenant: Teams share resources. Higher cost up front but each new cx doesn't really cost much.
  - Single-tenant: More expensive except for the human aspect.
  - At Kumu, every project is backed by a CouchDB database.
- Rubocop tells us to put mixins in separate attachments.
- [Ruby and Amazon Lambda:](https://stackoverflow.com/questions/29257411/running-ruby-on-rails-application-with-amazon-lambda) Currently, it doesn't support Ruby, but you can use it as a go-between for your S3 to Rails use case.
- [`bundler-audit`]: A way to audit your Gemfile for vulnerabilities.
- `lambda` or proc?
- [Flaky Ruby tests:](https://engineering.gusto.com/eliminating-flaky-ruby-tests/)
  - Capybara: Avoid dangerous methods that do not wait: `visit(path)` and `current_path`, `all(selector)`, accessors (`text`, `value`, `title`). Use safe methods that do wait: `find(selector)`, `find_field`, `has_selector?`.
  - DB pollution: `database_cleaner`: transaction vs truncation. Truncation is required when running request specs with Capybara. The thread running your Rails server uses a separate database connection from the one running your test.
  - Non-deterministic attributes: Don't use faker, just hardcode.
  - ID-dependent things: When tests run in a transaction, the auto-increment value still runs. Truncation = auto-increment will be reset.
  - To reproduce: run RSpec using the same seed, run the entire list of files, use the `--bisect` flag.
- [Sentinel value:](https://en.wikipedia.org/wiki/Sentinel_value) "A special value in the context of an algorithm which uses its presence as a condition of termination."

# Result Objects: Errors without Exceptions
[Reference](https://www.rubypigeon.com/posts/result-objects-errors-without-exceptions/)

- Resonad gem:
  - Errors are part of the return value, not an exception.
  - Expected errors are available through `result.error`, and unexpected bugs are exceptions.
  - All expected error cases are automatically "caught", without having to guess what they are.

``` ruby
result = register_new_user(params)
if result.success?
  handle_success(result.value)
else
  handle_failure(result.error)
end
```

- When not to use:
  - When the method should always succeed.
  - When there is only a single failure case, just return `nil` or whatever.
  - If you can recover Locally, and you can just return a Null Object.
- Result objects are appropriate:
  - When an operation can fail in multiple different ways.
  - When operations need to be chained together, and each individual operation can fail.
  - When it's important for callers to know that the method can fail.
  - Works with service/interactor/command objects.
- Implementation: `Resonad`, dry-monads, Github::Result, `monadic`, `result-monad`.

- [Refactoring to data:](https://www.rubypigeon.com/posts/refactoring-inheritance-composition-data/) "This is an example of what I call “data-driven design” or just “thinking in data”. All the specific details are described in data: numbers, strings, arrays, hashes, structs, etc. All the behaviour (i.e. the implementation) is generic, and controlled by the data."
- When thinking of inheritance, ask yourself if it is possible to think of the inheritance chain in terms of just data (array, hash, and do a concretion based on that).

