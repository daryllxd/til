---
layout: post
title:  "TIL, 2018-05-31, More Speeding up CSV Import Tricks"
date:   2018-05-31 16:37:40 +0800
categories: programming
summary: "Ask Reddit, also continue reading on things from yesterday, read job search articles."
---

# Ask Ruby: Speeding up CSV imports?
[Reference](https://www.reddit.com/r/ruby/comments/8nazca/speeding_up_csv_imports/)

- Fastest way: Use Postgres' COPY command.
- `ActiveRecord::Base.connection.execute "COPY your_table FROM '/path/to/file.csv' FORMAT CSV"`.
- Using the `COPY` API with just a connection and IO stream.

```
ActiveRecord::Base.connection.raw_connection

File.open('sample_file.csv','rb') do |f|
  conn.copy_data('COPY "some_table"(col1, col2) FROM STDIN WITH CSV') do
    while chunk = f.read(10240)
      conn.put_copy_data(chunk) # does not need to be row-aligned
    end
  end
end
```

- If possible, load the data into a table with no indexes, and then create the indexes afterward.
- Create the table, COPY command in the same transaction and use the FREEZE option.
- Partitioned tables in PG 10. "I'm able to load ~200M rows into a partition, setup indexes on it, warm the data and put it into the line of fire in ~4 minutes using this approach (most of this time is index construction and warming)."
- Data loading: faster to `psql` and `\\copy`, faster than passing through Ruby.

- [What is an idempotent operation?](https://stackoverflow.com/questions/1077412/what-is-an-idempotent-operation?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
- [Coding Sidekiq the Right Way](https://www.reddit.com/r/ruby/comments/8n5p1x/coding_sidekiq_workers_the_right_way/)

- [Upgrading CQRS events:](http://danielwhittaker.me/2015/02/02/upgrade-cqrs-events-without-busting/)
  - Never rename a field.
  - Never delete a field.
  - Never rename an event message, add fields or create new messages (`SomeEventV2`).
- [Performance Impact of Removing OOBGC](https://githubengineering.com/removing-oobgc/)
  - OOBGC: A technique to use when deciding when to collect garbage in the program. Instead of allowing the GC to run normally, the GC is stopped before processing a web request, then restarted after the response has been sent to the client.
  - Ruby's GC: "Stop the world, mark and sweep."
  - Less CPU utilization, but higher memory usage.

# A Developer's Guide to Interviewing
[Reference](https://medium.freecodecamp.org/how-to-interview-as-a-developer-candidate-b666734f12dd)

- You will talk to: engineers, engineering managers, company leadership.

- ***For engineers:***
  - *How do you know what to work on each day?* Need to make sure if the process is consistent. Good answer: "sprints, report progress, etc." Bad answer: "I look at what fires are burning."
  - *What do you use for version control?* Branches, rebasing, merging, tooling.
  - *What do you like about working here?*
  - *Do you write unit tests?*
    - They need to explain why they unit test, their code coverage, and they know their tooling.
    - This is to make sure that you're working a tested codebase.
    - Do you prefer unit tests/integration tests/acceptance tests/testing frameworks/how long do the tests take to run?
  - *Do you have CI?* What do you like/dislike about the CI system?
  - *What do you measure?*
    - Performance metrics like server response times, request throughput, number of users, client-side responsiveness. Or: number of users who speak different languages, browser breakdown, cache hit/miss rates, other topics.
    - What are your most important product metrics? What measurement systems do you use?
  - *How do you find and fix bugs?*
    - How do you prioritize bugs? What bug tracker do you use? How long do your bugs take to fix?
  - *What collaboration tools do you use?* Chat + code review + email.
  - *What frameworks do you use?* Also, how much latitude do developers have in choosing technologies?
  - *When can we pair?*
  - *When is your next deadline?*
  - *How long does it take to set up a new development environment?*

- ***For managers:***
  - *When was the last time you wrote code?*
  - *How did you become a manager?*
  - *How do your engineers know what to work on each day?*
  - *What's your team's biggest challenge now?* You get to know their awareness of problems, the willingness to be honest, and the seriousness of the problems on the team.
  - *How do you measure individual performance?*
  - *Do you do formal performance reviews?* Can you tell me about a time you helped someone improve their performance? How do you coach people during these reviews?
  - *Do you do annual salary increases?*
    - Do you give me stock options? Will you give me more stock options every year?
    - How do you budget for raises? How much salary increase could I expect one year from now? Best case, worst case?
  - *Can I get some take-home material describing company benefits?*
  - *Do you rank employees against one another?*
  - *Do you do team retrospectives?* How often do you receive feedback from the members of your team? When was the last time you changed something about the way you run your team based on the feedback you received?

- ***For Leadership:***
  - How are you funded?
  - Are you profitable? Historical revenue for the past few quarters/years. Risks to profitability. Runway.
  - What's your opinion on outsourcing?
  - Tell me about the company culture.
  - What assurance do you have that this company will be successful?
  - What is your reporting structure?

## Comments

- How often do you find yourself working late or coming in on weekends?
- What is the company's revenue model? Is the company hiring to expand? Or are they replacing someone?
- Ask for feedback from the interviewer.
