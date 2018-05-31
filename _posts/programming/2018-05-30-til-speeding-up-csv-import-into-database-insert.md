---
layout: post
title:  "TIL, 2018-05-30 Speeding up CSV Import into Database Insert"
date:   2018-05-30 16:45:03 +0800
categories: programming
summary: "Bootstrap forms, activerecord-import, idempotency, thinking about Kotlin sealed classes"
---

# Musings, Ruby

- [activerecord-import](https://github.com/zdennis/activerecord-import) really works. Like 3x speed improvement.
- [Bootstrap form](https://github.com/bootstrap-ruby/bootstrap_form) for quick Bootstrap forms!
- [What is an idempotent operation?](https://stackoverflow.com/questions/1077412/what-is-an-idempotent-operation?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
- [Coding Sidekiq the Right Way](https://www.reddit.com/r/ruby/comments/8n5p1x/coding_sidekiq_workers_the_right_way/)
- [Remote: true](https://stackoverflow.com/questions/43013354/form-with-search-field-in-rails-5-1)

# On Processing Large CSV Files
[Reference](https://dalibornasevic.com/posts/68-processing-large-csv-files-with-ruby)

- Helpers for printing memory used and time spent:

``` ruby
require 'csv'
require_relative './helpers'

headers = ['id', 'name', 'email', 'city', 'street', 'country']

name    = "Pink Panther"
email   = "pink.panther@example.com"
city    = "Pink City"
street  = "Pink Road"
country = "Pink Country"

print_memory_usage do
  print_time_spent do
    CSV.open('data.csv', 'w', write_headers: true, headers: headers) do |csv|
      1_000_000.times do |i|
        csv << [i, name, email, city, street, country]
      end
    end
  end
end

require 'benchmark'

def print_memory_usage
  memory_before = `ps -o rss= -p #{Process.pid}`.to_i
  yield
  memory_after = `ps -o rss= -p #{Process.pid}`.to_i

  puts "Memory: #{((memory_after - memory_before) / 1024.0).round(2)} MB"
end

def print_time_spent
  time = Benchmark.realtime do
    yield
  end

  puts "Time: #{time.round(2)}"
end
```

- When building the CSV file, the Ruby process did not spike in memory usage because the GC was reclaiming the used memory.
- Reading the entire file at once: Really high memory usage. 19 sec, 920 MB.
- Parsing CSV from an in-memory string `CSV.parse...`: 21 sec, 1 GB memory.
- Parse line by line: 9.73 sec, 74 MB. (`CSV.new...`)
- Fastest way: `CSV.foreach`. 9 sec, 0.5 MB.

# Sealed Classes
[Reference](https://codeascraft.com/2018/04/12/sealed-classes-opened-my-mind/)

- Enums with actual types.
- For a `ResultClass`, we have this:

```
sealed class Result {
 class Success(val items: List<String>): Result()
 class Failure(val error: Throwable): Result()
}
```

- The `when` expression is a bit like pattern matching.

```
when (result) {
  is Result.Success -> showItems(result.items)
  is Result.Failure -> result.error.printStackTrace()
}
```
