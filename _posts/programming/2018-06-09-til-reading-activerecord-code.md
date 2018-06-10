---
layout: post
title:  "TIL, 2018-06-09, Reading ActiveRecord Code"
date:   2018-06-09 17:46:43 +0800
categories: programming
summary: "RDBMS vs NoSQL, Different Flavors of NoSQL, UX re: adding a new item in a table list."
---

# Reading AR code
[Reference](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/core.rb#L299-L302)

- I was answering a Stack Overflow question and I just wondered, what was actually inside?
- [Rails ActiveSupport, `mattr_accessor` and `cattr_accessor`](https://stackoverflow.com/questions/185573/what-is-mattr-accessor-in-a-rails-module)
  - They provide getter/setter methods at the class or module level. Implementation: hash, metaprogramming, and `class_eval`. [Reference](https://github.com/rails/rails/blob/5-2-stable/activesupport/lib/active_support/core_ext/module/attribute_accessors.rb)
- Accessor methods:
  - `default_timezone`
  - `schema_format`
  - `error_on_ignored_order`: with scopes carrying limit or order information, they were ignored before. So you can choose to raise an error with `find_in_batches` instead of just logging a warning. [Reference](http://www.fsainz.com/2016/10/29/find-each-warnings/)
  - `timestamped_migrations` (I have no idea why you would turn this thing off lol.)
  - `dump_schema_after_migration` and `dump_schemas`
- You have to catch a lot of `RangeError`.

- Example pattern of "Switch this off first, then revert"

``` ruby
[Reference](https://github.com/rails/rails/blob/master/activerecord/test/cases/unsafe_raw_sql_test.rb#L312-L318)
def with_config(new_value, &blk)
  old_value = ActiveRecord::Base.allow_unsafe_raw_sql
  ActiveRecord::Base.allow_unsafe_raw_sql = new_value
  blk.call
ensure
  ActiveRecord::Base.allow_unsafe_raw_sql = old_value
end
```

- [`ActiveRecord::Result < Object`](http://api.rubyonrails.org/classes/ActiveRecord/Result.html)
  - `ActiveRecord::Base.connection.exec_query('SELECT id, title, body FROM posts')`
  - It includes `Enumerable`.

# RDBMS vs. NoSQL: How do you pick?
[Reference](https://www.zdnet.com/article/rdbms-vs-nosql-how-do-you-pick/)

- Nature of data: Multi-level nesting/hierarchies are easily represented in JSON.
- Volatility of the data model: if things change daily, maybe schema-less is better.
- Operational issues.
- Data warehousing/analytics.

# SQL vs NoSQL: How to Choose
[Reference](https://www.sitepoint.com/sql-vs-nosql-choose/)

- *SQL databases are ideal for projects where requirements can be determined and robust data integrity is essential.* It works best for clearly defined, discrete items with exact specifications. Typical use cases are online stores and banking systems.
- *NoSQL databases are ideal for unrelated, indeterminate or evolving data requirements where speed and scalability are more important.* It works best for organic data with fluid requirements. Typical use cases are social networks, customer management and web analytics systems.

# What does “Document-oriented” vs. Key-Value mean when talking about MongoDB vs Cassandra?
[Reference](https://stackoverflow.com/questions/3046001/what-does-document-oriented-vs-key-value-mean-when-talking-about-mongodb-vs-c)
# Comparing Document Databases to Key-Value Stores
[Reference](http://nosql.mypopescu.com/post/659390374/comparing-document-databases-to-key-value-stores)
# What are the main differences between the four types of NoSql databases (KeyValue Store, Column-Oriented Store, Document-Oriented, Graph Database)?
[Reference](https://www.quora.com/What-are-the-main-differences-between-the-four-types-of-NoSql-databases-KeyValue-Store-Column-Oriented-Store-Document-Oriented-Graph-Database)

- K-V: Limited to query by key, store doesn't know anything about them.
  - Special data types (left/right, pop/push in redis)
  - Like a hash table data structure, fast for writing, fast for reading/updating, if you have the key. Slow on multiple updates and if you have to query the entire store.
  - Because of fast read, used as caching store.
- Document-oriented database extends the previous model and values are in a structured format that the db can understand. Ex: Document is a blog post, comments are denormalized.
  - Fast write, good query times based on indexing, flexible and nestable.
  - Some can do a relational join for different documents.
  - Allows ad-hoc querying, and relies on indexes defined on the document values to help it achieve reasonable performance when the data size grows large enough.
  - Secondary indexes.
- Column stores
  - Seem to store data in related rows, but they actually serialize the data into columns.
  - Faster querying and processing of data while storing data that's somewhat related.
  - Searching on each column are faster, but inserts/updates are slower.
  - Store it in column families, where they are stored together.
- Graph stores
  - Relationships. Metadata documents to nodes and relationships, as well as labels.
  - For social networking. Neo4j and orientDB.
- Possible features:
  - Scale up/down cluster
  - Pluggable data store
  - Built-in web config/web app support
- Not limited to querying by key.

# Render Cached JSON Using Rails and Redis
[Reference](https://coderwall.com/p/fpww3q/render-cached-json-using-rails-and-redis)

``` ruby
class MyController
  def index
    render_cached_json("api:foos", expires_in: 1.hour) do
      Foo.all
    end
  end

  def render_cached_json(cache_key, opts = {}, &block)
    opts[:expires_in] ||= 1.day

    expires_in opts[:expires_in], :public => true
    data = Rails.cache.fetch(cache_key, {raw: true}.merge(opts)) do
      block.call.to_json
    end

    render :json => data
  end
end
```

# Musings

- [Wappalyzer](https://www.wappalyzer.com/) can be used to identify technology on websites.
- [Material UI](https://material-ui.com/) has a few ideas on UI elements.
- [Adding new item in a table list: At the end of the list or open a new page?](https://ux.stackexchange.com/questions/101798/adding-new-item-in-a-table-list-at-the-end-of-the-list-or-open-a-new-page) The easy solution is to use an external form if the relation between the data input and the data view might not be necessarily be the same.
  - Use a preview window if the way the output displays is relevant.
  - If the data displays in the view mode exactly as entered in the edit mode, you can modify the field in the same table.
  - Complex validation: open an external form. So we can write the validation in the new screen, and if there are dependent fields we can include them too.
  - Direct table input: we cannot visualize dependent fields.
  - New page for the form: "Enriches the platform.", or "As long as it is not needed, avoid it."
