---
layout: post
title:  "TIL, 2018-06-29, ORM performance bugs"
date:   2018-06-29 17:30:18 +0800
categories: programming
summary: "Cool article on HN re: ORM weaknesses, caching antipatterns, CTO role changes"
---

# How not to structure your database-backed web applications: a study of performance bugs in the wild
[Reference](https://blog.acolyer.org/2018/06/28/how-_not_-to-structure-your-database-backed-web-applications-a-study-of-performance-bugs-in-the-wild/)

- It is difficult for application compilers or developers to optimize the interaction between the application and the underlying DBMS, as they are unaware of how their code would translate to queries by the ORM.
- 20K records = realistic setting for the applications under study.
- DBMS contributes at least 40% of this latency in at least 5 out of the top 10 pages for 11 of the 12 apps.
- `any?` or `exists?`: `exists?` is more efficient.
- `sum(:total)` is more efficient than `pluck(:total)` because it moves computation to the DBMS.
- Inefficient rendering?
- Database design issues:
  - Missing fields. An app repeatedly computes a value that it could just store.
  - Missing DB indexes.
- App design issues:
  - Not using pagination.
  - Excess functionality that is not used. The "sidebar" is actually expensive to compute.

## Comments

- Rails:
  - Long TTL on the cache servers with a way to proactively purge and refresh in the background.
  - Generate message/payloads/views asynchronously in background workers and have your synchronous path as streamlined as possible. Avoid serialization. Pre-calculate, denormalize. Do things asynchronously. Use message queues/streams.
  - Beyond this, GC becomes noticeable.
- ORMs, things you can do:
  - Index
  - Performance analysis
  - Just measure it first...
- My 2 cents are: if you don't know what queries your ORM API is generating, you shouldn't use one. I mean, sometimes there are bugs here and there, but people should know the methods they call.
- The metric for performance = not just the requests per second. It's the "it has to work immediately for the people using this app."
- If you don't close a connection in a `finally`, a connection will leak if an exception is thrown.

- Caching antipattern:
  - To fix, lock the cache key and have subsequent requests wait on the original computation.
  - You can't memoize because the thing hasn't happened yet.
  - Redis `redlock` before starting to refresh the cache. So only one process will perform the expensive calculation. This is called: cache stampede, thundering herd, dogpile effect.
  - Cache the promise, not the result.

```
    key = calculate_cache_key()
    if not cache.has(key):
        data = expensive_calculation()
        cache.store(key, data)
    else:
        data = cache.get(key)
```

# How my role as CTO has changed as we've grown to 100 engineers
[Reference](https://engineering.gusto.com/how-my-role-as-cto-has-changed-as-weve-grown-to-100-engineers/)

- 2-10 engineers: 60% coding, the rest was sourcing, interviewing, and closing engineers.
- 11-50 engineers: had to make a choice to move to people management. The focus began growing the team, not the code.
- 51-100 engineers: 60% trying to be the best manager I could be and training other engineering managers to do the same. 40% time spent recruiting.

## Comments

- "At this point, I believe technical co-founders have a binary choice: Stay on the technical track and hire a professional manager (usually given the VP of Engineering title), or give up coding and focus on the management aspects yourself. It really isn't possible to do both."
- I have to agree with dang. Most people running successful startups don't have (or take) the time to write about it.
- What they do in a day:
  - Calculating payroll/filling quarterly and annual forms.
  - It's different in every state.
  - FinTech, Payments, Risk teams.
  - Looking into the future of payroll (pay day?)
  - Technical debt.
- Once you get into the mindset of enabling everyone by focusing on training and knowledge sharing, you find that people are far more capable than perhaps you give them credit for and in fact do them a disservice by not giving them more reign. Worst case, you get a bit of sanity back from being less of a bottleneck.

# Musings

- [`MyFitnessPal`: A UX Case Study](https://medium.com/tradecraft-traction/myfitnesspal-a-ux-case-study-f377ff66a504)
  - If MFP didn't get you to log food on the first day, the chances you'd log a food on the second day were very low. So minimize friction and increase the customer's ability to complete certain tasks.
  - Fresh Start Effect: We are likely to motivate ourselves into good habits by using a new week, month, year, or national holiday marker to put past behavior behind us and focus on being better.
  - The idea was to make SEARCH A FOOD as clear as possible for new users while keeping the other core functions on this screen intact.
  - Case studies are awesome.
  - We need to move to a next level of UX which integrates voice, images, artificial intelligence, and some other technology stack.
- [Faster JSON Generation with PostgreSQL](https://hashrocket.com/blog/posts/faster-json-generation-with-postgresql)
  - Using PG `row_to_json` function is more verbose, but is faster than traditional Rails JSON generation. When the row is an object graph, the performance gains become more and more attractive.
- [Streaming Data with Ruby Enumerators](https://www.smartly.io/blog/streaming-data-with-ruby-enumerators)
  - Node over Ruby re: streaming API.
