---
layout: post
title:  "TIL, 2017-11-04, Database Cleaner and before all"
date:   2017-11-04 17:03:19 +0800
categories: programming
---

- Database cleaner:
  - `transaction` strategy means the transactions are just rolled back. You can make the tests also read the uncommitted transactions.
  - `deletion` and `truncation`: `DELETE` is faster but it doesn't completely recreate the tables, it just deletes the rows. `TRUNCATE` is the slowest but it recreates the tables.
  - `DatabaseCleaner.clean_with(:truncation)` to do a truncate delete, then you can put this in an `after` block.
  - `DatabaseCleaner.logger = Rails.logger` if you want.
- `RSpec` best practices [Reference](https://kpumuk.info/ruby-on-rails/my-top-7-rspec-best-practices/)
  - `before(:all)` block is not wrapped in a transaction.
  - Only create what you need.
  - Mock creating a ton of records.
  - Do not over-mock.
- Create different test suites to speed up your workflow. That way you can run different test suites.
- RSpec order: `before(:suite), before(:all), before(:each), after(:each), after(:all), after(:suite)`.
- You can do things like `params.fetch(:hello) { 'hello' }`
- Service object article [Reference](https://avdi.codes/service-objects/)
  - Modules over objects?
  - **The problem with just a lot of service objects handling business rules: you can end up with a whole basket full of Service Objects, many with implicit data dependencies between them, representing business workflows that have no explicit representation.**
  - Domain Driven Design:
    - Appropriate domain model to receive the functionality.
    - Infrastructure services should be things like "send an email". This should be separate from the domain-level services.
    - Domain-level services should be named in terminology that everyone understands.
    - Services should have no persistent state.
    - Usually better to do `Service.new(dependencies).call` instead of `Service.call(dependencies)` because it allows breaking down `call` into multiple private methods that have access to the dependencies without having to pass them around as arguments to all the methods.

``` ruby
class ProcessIpn
  def initialize(*args)
    # Setup
  end

  def process
    # Do stuff...
  end

  def self.with(*args)
    processor = new *args
    processor.process
  end
end
```

- Backing up your own database: create a private repository, `git submodule add`, then run a script that does the backup thing via the shell.
