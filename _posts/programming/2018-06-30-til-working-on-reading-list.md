---
layout: post
title:  "TIL, 2018-06-30, Working on Reading List"
date:   2018-06-30 15:34:34 +0800
categories: programming
summary: "Interviewing, Monads in Ruby, Wrapping APIs, Locking in AR"
---

# How I landed offers from Microsoft, Amazon, and Twitter without an Ivy League degree

[Reference](https://medium.freecodecamp.org/how-i-landed-offers-from-microsoft-amazon-and-twitter-without-an-ivy-league-degree-d62cfe286eb8)
- When to use Cassandra over MySQL, when to use OAuth, Redis vs Memcached, streaming vs batch processing. High Scalability.
- I listed out my competency level for: data structures (linked list, hash map, binary tree, binary search tree, heap, array), algorithms (binary search, hashing, dynamic programming, sorting), and language-specific syntax and libraries (like sort, lambda for Python, appending, indexing).
- Thinking how to make a file system (recursion).
- 2 months of deliberate practice. 20 hours/week (80 hours/month) learning and writing notes on top of a full time job.
- Pick up the tough and icky parts so you can learn more than anyone else.

# Rubyists Already Use Monadic Patterns
[Reference](http://dave.fayr.am/posts/2011-10-4-rubyists-already-use-monadic-patterns.html)

- A language with Nil punning has a rule that says "every value except Null and false are considered true. (Ex: JS, Python). We can relate this to the Maybe Monad.
- Monads: rules for chaining functions together. If you have functions that you want to chain together, you can probably use a monad to do it.
- The "Maybe Monad": it chains functions together when the functions might fail. The Maybe Monad's rules assume you have Something or Nothing.
- The rules:
  - If I have Nothing, stop computing.
  - If I have Something, pass it to the next function.
  - That function may return Something or Nothing. You can go back to step 1 form here.
- In Ruby, this is applied in the `||=`, `&&=`, and the `&& SOMETHING &&` operators.
- What's the point? This allows you to write briefer code in Ruby. Try to write these examples with explicit boolean conditionals, and you'll rapidly watch the code have `end end end`.
- Example:

``` ruby
class Object
  def mbind(&k)
    k.call(self)
  end
end

class << nil
  def mbind(&k)
    nil
  end
end

def open_connectionM(addr, password)
  get_host_by_name_or_nil(addr).mbind { |ip|
    Connection.new(ip).mbind { |conn|
      ConnectionDecrypter.new(conn, password)
    }
  }
end
```

- What this means is that, we can safely chain functions, but if they return a `nil`, just return a `nil`. This is safer than conditional hell.

- Chaining for lists:

``` ruby
class Array
  def mbind(&k)           # We break the Maybe monad here. Sorry, Maybe!
    self.map {|v| k.call(v)}.flatten(1)
  end
end
```

- For the IP address example: We can structure code to have a different monad at the top of the chain, which handles Something or Nothing in the manner that we want. The functions don't even know they are in a monad, they just do their thing.
- Why are they not popular?
  - No type inference, so what monad are you supposed to use?

# Musings, Ruby

- [`CashNotify` for Stripe](https://cashnotify.com/journal/motivation/)
  - Sale notification!
  - Validation, chance to meet a new customer, you can celebrate, and it's addictive.
- [Real world startup sales and marketing:](https://www.indiehackers.com/@cliffordoravec/real-world-startup-sales-and-marketing-for-the-lost-and-the-clueless-part-5-of-the-epic-guide-8f2df4804c)
  - Find 10 potential customers a day and send cold emails to each of them.
  - Write at least 1 piece of content a day and promote it in at least 3 places.
  - Promote your startup in at least 5 different places a day.
  - Create and run a new ad for 1 week every week.
  - Find at least 4 people talking about or asking questions about topics related to your startup a day and write them a detailed, personal answer.
- [Understanding Locking in Rails ActiveRecord](http://thelazylog.com/understanding-locking-in-rails-activerecord/)
  - Optimistic locking: allows multiple users to access the same record for edits, and assumes a minimum of conflicts with the data. Throw an `ActiveRecord::StaleObjectError` if that has occurred.
  - Pessimistic locking: When you lock the object, no other users can read the account, because they have to wait until the lock is released. `account.lock!`
  - Pessimistic lock does prevent a read, but it only prevents a write.
- [A Guide to Optimistic Locking](https://www.engineyard.com/blog/a-guide-to-optimistic-locking)
  - Create a migration to have the lock version.
  - Create a `lock_version` hidden input in the Rails view and set it in AR (`self.locking_column = 'lock_column'`)
  - In the controller layer or wherever, add a handler to rescue `AR::StaleObjectError` that appears when trying to update a stale row.
- [Designing a Design Team](https://medium.com/flexport-design/designing-a-design-team-a9a066bc48a5)
  - Most important thing: get out of the office, meet clients, and conduct user interviews.
  - Product designer, user researcher, communication designer.
  - Problem with a centralized design team: designers missed the small decisions between engineers and PMs, and engineers/PMs thought they didn't have a way to contact the design team for those decisions.
  - Communication designer: in charge of brand identity.
  - Meetings:
    - Weekly standup.
    - Design critique. Provide context, fidelity, and questions they want answered.
    - 1:1s, one per designer per week.
- [Returning something + raising an AR error: Store it in a variable and return that outside the transaction block.](https://stackoverflow.com/questions/1058738/how-to-raise-an-activerecordrollback-exception-and-return-a-value-together)
- [4 Ways to Secure Your Authentication System in Rails](https://ducktypelabs.com/4-ways-to-secure-authentication/)
  - Throttle requests: You can use `rack-attack`, and tell Devise to lock accounts if there are too many unsuccessful attempts to log in.
  - Cloudflare to help mitigate DDoS attacks.
  - Security headers: `Strict-Transport-Security` header to tell a browser to only communicate with it via https.
  - Read about the auth libraries.
  - Secure the rest of the app: Cross site scripting.
- `Fail2Ban`: Intrusion protection software.
- [Prevent MySQL deadlocks in your Rails application](https://www.brightbox.com/blog/2014/11/13/preventing-mysql-deadlocks/)
  - Deadlock means 2 transactions hold a lock on a row that the other requires to continue working. This leaves the two transactions working on the other transaction to release the lock.
  - Keep the transactions short: locks get released at the end of a transaction anyway.
  - Be orderly about locks your code is going to acquire.
  - You need to exit out from all transactions if they are nested.
  - Serialize your transactions with table locks. (Only if you need to, you can lock a table, but this will reduce concurrency).
- [`1.instance_methods(false)` to show only the unique instance methods for this integer.](https://www.ruby-forum.com/topic/193625)
- [Kong](https://github.com/Kong/kong)
  - A microservice abstraction layer (API gateway, API middleware, service mesh). Core values: high performance and extensibility.
- [3 Ways to Configure Your Ruby API Wrappers](https://www.justinweiss.com/articles/3-ways-to-configure-your-ruby-api-wrappers/)
  - Global. Problem: Only one Product API as one user, and it has global data that's easy to accidentally change.

``` ruby
# config/initializers/product_api.rb

ProductApi.root = "https://staging-host.example.com/"
ProductApi.user = "justin"
ProductApi.secret = "mysecret123"

```

  - Other way: Initialize it on demand. Problem is, you have to configure the API every time you use it.
  - Objective: Get good defaults and flexibility.

``` ruby
def show
  @product = ProductApi.default_product_api.find(params[:id])
end

...

def show_special
  special_product_api = ProductApi.new(
    root: "https://special-product-host.example.com/"
    user: "justin"
    secret: "mysecret123")
  @special_product = special_product_api.find(params[:id])
end

class ProductApi
  def initialize(root:, user:, secret:)
    @root, @user, @secret = root, user, secret
  end

  def self.default_api
    @default_api ||= new(
      root: ENV['PRODUCT_API_ROOT'],
      user: ENV['PRODUCT_API_USER'],
      secret: ENV['PRODUCT_API_SECRET'])
  end

  def find(product_id)
    ...
  end
end
```

https://www.youtube.com/watch?v=ZgdS0EUmn70

- Reading `rack-attack`
  - Cool way to enforce options.
  - `respond_to?(:call)` is a common pattern when you're not sure what the argument is.

``` ruby
MANDATORY_OPTIONS.each do |opt|
  raise ArgumentError.new("Must pass #{opt.inspect} option") unless options[opt]
end
```
