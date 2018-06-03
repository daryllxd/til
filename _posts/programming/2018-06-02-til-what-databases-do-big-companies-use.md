---
layout: post
title:  "TIL, 2018-06-02, What Databases Do Big Companies Use?"
date:   2018-06-02 12:18:29 +0800
categories: programming
summary: "Thoughtful article on the Tech Industry, ActiveRecord::Batch, More Reading about ES."
---

# Musings

- [NoSQL Replacing RDBMS?](https://www.quora.com/Is-NoSQL-db-going-to-replace-relational-database-in-programming)
  - Computed relational join is important!
  - App-side joins are bad performance-wise.
  - Convergence: RDBMSes are adding JSON support, NoSQL databases are adding join capabilities.
  - A lot of data sets are inherently relational and have a natural structure well represented with SQL.
- [What do big websites like Facebook, Google, Twitter, and LinkedIn use for their database? What would be the pros and cons of what they use and why?](https://www.quora.com/What-do-big-websites-like-Facebook-Google-Twitter-and-LinkedIn-use-for-their-database-What-would-be-the-pros-and-cons-of-what-they-use-and-why)
  - `BigTable`, Hive, Cassandra, PostgreSQL, MySQL, SQL Server.
  - Hadoop HBase, MongoDB, Redis, DynamoDB.
  - Data Cache: Redis. Pro: Small footprint, good for caching. Con: how much data you can handle.
  - Data Search: ES. Pro: Good for data search.
  - Data Piping: Kafka. Pro: Can handle billions of message. Cons: Java, relatively complex to code or manage.
  - NoSQL: Cassandra. Pro: Good for clustered env. Cons: data modeling is more complex.
  - Polyglot persistence: Use whatever tools are most effective for what you're trying to accomplish. If you have a WordPress public site, this doesn't mean you should use WP for your CRM.
- [If Facebook is "trapped" by MySQL in a "fate worse than death," what would have been a better option for data persistence for the site back in the day?](https://www.quora.com/If-Facebook-is-trapped-by-MySQL-in-a-fate-worse-than-death-what-would-have-been-a-better-option-for-data-persistence-for-the-site-back-in-the-day/answer/Bill-Karwin)
  - HBase for Graph Search/Messages.
  - Cassandra for inbox search.
  - Haystack for storing photos.
  - Memcached for an in-memory KV store.
  - Scribe for logging.

# 12 Things Everyone Should Understand About Tech
[Reference](https://www.linkedin.com/pulse/12-things-everyone-should-understand-tech-anil-dash/)

- ***Tech is not neutral.*** The choices that developers make about design, technical architecture or business models can have profound impacts on our privacy, security, and even civil rights as users. Square or rectangular photos? Microphone in our living rooms? Being reachable by our bosses at any moment?
- ***Tech is not inevitable.***
- ***Most people sincerely want to do good.*** While most do want to change the world, good intentions don't absolve them from being responsible for the negative consequences of their work, no matter how well-intentioned.
- ***Tech history is poorly documented and poorly understood.***
  - Why did your favorite app succeed, and others didn't?
  - What failed attempts were made to create such apps before?
  - What problems did those apps encounter, or what problems did they cause?
- ***Most tech education doesn't include ethical training.***
- ***Tech is often built with surprising ignorance about its users.*** Tech creators now regularly get treated as authorities in a wide range of fields like media, labor, transportation, infrastructure, and political policy, even if they have no background in those areas.
  - *The best, most thoughtful tech creators engage deeply and sincerely with the communities that they want to help, to ensure they address actual needs rather than indiscriminately disrupting the way these established systems work.*
- ***There's never one single genius creator of technology.***
  - The myth around Steve Jobs, where one guy gets credit for inventing the iPhone when it was the work of thousands of people.
  - Real creation stories are complicated and involve many people.
- ***Most tech isn't from startups or by startups.***
- ***Most tech companies make money in just one of three ways.***
  - Advertising.
  - Big business: MS, Oracle, Salesforce. Vendor lock-in.
  - Individuals: Buying a whatever.
- ***The economic model of big companies skews all of tech.***
  - Make a cool product, get money, grow a huge audience of users, turn those users into a business, and start fighting or buying off other competitive companies in the market.
- ***Tech is much about fashion as function.***
  - Languages, toolkits depend on what's in fashion.
- ***No institution has the power to rein in tech's abuses.***
  - Most business reporters and regulators are illiterate about tech, and tech writers report about events, not civic/social concerns.
  - The traditional activism like boycotts/protests do not work on tech because they can rely on advertising, surveillance, and venture capital investment to continue operations even if activists are effective in identifying problems.
- Biggest cost: attracting and hiring programmers.

# ActiveRecord::Batches
[Reference](http://api.rubyonrails.org/classes/ActiveRecord/Batches.html#method-i-find_each)

- `find_in_batches` with a batch size of 1000.
- It's not possible to set the order. Set to ascending on the primary key to make the batch ordering work.
- Not possible to set the order, it is set to ascending on the primary key to make the batch ordering consistent.
- *Subject to race conditions if other processes are modifying the database.*

``` ruby
Person.find_each.with_index do |person, index|
  person.award_trophy(index + 1)
end

Person.in_batches.delete_all
Person.in_batches.update_all(awesome: true)
```

- While looking into the code:
  - `relation.skip_query_cache!`
  - It is basically a loop across the relation. There are some infrastructure things.

# The Cult of the Complex
[Reference](https://alistapart.com/article/cult-of-the-complex)

- *When we divorce ideas from the conditions under which they arise, the result is dogma and misinformation—two things the internet is great at amplifying.* Somehow, over the years, in front-end design conversations, the premise “don’t use a div when you mean a p” got corrupted into “divs are bad.”
- Indeed, many designers and developers I speak with would rather dance naked in public than admit to posting a site built with hand-coded, progressively enhanced HTML, CSS, and JavaScript they understand and wrote themselves. For them, it’s a matter of job security and viability. *There’s almost a fear that if you haven’t mastered a dozen new frameworks and tools each year (and by mastered, I mean used), you’re slipping behind into irrelevancy.*
- Design is its most brilliant when it appears most obvious, most simple. The question for web designers should never be how complex can we make it.
- "I talk with a lot of developers who list Angular, Ember, React, or other fancy JavaScript libraries among their technical skills. That’s great, but can you turn that mess of functions the junior developer wrote into a custom extensible object that we can use on other projects, even if we don’t have the extra room for hefty libraries? Can you code an image slider with vanilla JavaScript so we don’t have to add jQuery to an older website just for one piece of functionality? Can you tell me what recursion is and give me a real-world example?"

## Comments

- I think the business pressure of ‘deliver fast’ has also played a part in complicating workflows under the guise of automation. If I can say such and such is automated, it’s immediately perceived as being efficient, even though the costs of set up, maintenance and on-boarding aren’t considered.
- I completely agree, web development has become too complex and I don’t know what to focus on and what to learn anymore. As soon as you learn something its out of date and replaced by something else. It makes me concerned with the future of the industry and my future career.

# Hacker News: Building a CQRS/ES web application in Elixir using Phoenix
[Reference](https://news.ycombinator.com/item?id=13338848)

- *Problem with ES: Versioning events, projection, reporting, maintenance, administration, dealing with failures, debugging, etc etc are all more challenging than with a traditional approach.*
- Migrating immutable events: Multiple versions, upcasting, lazy transformation, in-place transformation, copy and transformation.
- OTOH, if understanding ES just as an ADDITION to classical mutable-state processing - it can be made very useful. Not only ES will serve as a perfect audit, the duplication of information (once in mutable state and once in input events) will allow such things as regression testing, and fixing data problems caused by bugs, within the DB.
- Possible successful examples:
  - Double-entry accounting/bookkeeping/core banking systems.
  - RDMSes, specifically the replayable log structure of transactions.
- The alternative: `Customer` and `CustomerAudit` table. Write it in a transaction. Solved.
- Not good idea to do real-time querying of the event store.
- How do you know if the projection worked? What if there was a conflict with another address change form somewhere else?
- Things I found:
  - Do not try to apply ES to all areas of your software, if you apply it at all.
  - CQRS does not require ES, ES does not require CQRS.
  - On-demand projections are fine for a lot of purposes, learn to tell when you're going to need a static projection.
  - A projection is a part of BC. Don't query other BC's at runtime for their data.
  - Use UUID for PK, and originate them with the client whenever possible.
- Fixing an event that should not have gotten in the store: reverse transaction.
- Long comment:
  - If you've only ever built systems under a single paradigm, then you might not even be aware of the differences in reversibility concerns between paradigms.
  - You won't learn it (and wield it safely) if you believe that all things should be as readily-consumed as Meteor over Mongo, or Rails, or pick-your-forms-over-data tool.
  - Event sourcing makes things simple - far simpler than ORM, for example. But it only does so when approaching it from its own predispositions, rather than the predispositions (especially unrecognized) of some foreign and impertinent approach.
  - I can do an event-sourced system today as fast as I could have built the same system in a rapid-prototyping tool like Rails in years past. However, unlike Rails (for example), my productivity, and my team's productivity remains stable, and changes in scale and complexity of the business and its organization don't induce the panic that it used to.
  - *By "problems that shouldn't exist in the first place", I mean complexity and lack of clarity that is the result of presuming to reproduce a relational database schema in an object model. This is the single biggest problem in application software development today, and unfortunately it's also a default mode of development.*
  - *Until it clicks that ORM is as unnatural an abstraction now as server pages was in the 2000s, event sourcing probably won't matter.* And working with event sourcing might create all kinds of problems for not having recognized how to partition a domain. You may just end up with a distributed monolith rather than a service architecture. And at that point, you might just end up blaming event sourcing as a pattern rather than the unconscious importing of anti-patterns from "traditional" development.
