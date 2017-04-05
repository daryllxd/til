---
layout: post
title:  "TIL, 2017-04-04, Enterprise Rails Chapter 4."
date:   2017-04-04 15:05:55 +0800
categories: programming
summary: "Where I Read Enterprise Rails Chapter 4."
---

-  `a.sort { |a, b| [a['foo'], a['bar']] <=> [b['foo'], b['bar']] }` to sort by multiple fields. [Reference](http://stackoverflow.com/questions/4309723/ruby-sort-by-multiple-values).
- Tail from local environment: Apparently this works huhu. [Reference](http://www.talkingquickly.co.uk/2013/12/tailing-log-files-with-capistrano-3/)

``` ruby
namespace :logs do
  desc "tail rails logs"
  task :tail_rails, :roles => :app do
    trap("INT") { puts 'Interupted'; exit 0; }
    run "tail -f #{shared_path}/log/#{rails_env}.log" do |channel, stream, data|
      puts "#{channel[:host]}: #{data}"
      break if stream == :err
    end
  end
end
```

- You can do `map_with_index(index)`.

#### The Database as a Fortress [Reference](https://dan.chak.org/enterprise-rails/chapter-4-as-a-fortress/)

- Data is probably more important than people--you can teach a person but if your data and your backups get corrupted&hellip;
- The most important asset of a web-based company is its data.
- Rails has several DB abstractions: DDL with migrations. SQLite as a default database. DML with ActiveRecord. Data integrity with AR::Validations.
- What happens when you need to switch out of Rails? **Software is constantly in flux, but the data you collect over the years is not.**
- AR::Validation: There are some cases where AR validations just do not exist (ex: referential integrity constraints). RDBMSes have their own built-in mechanisms that can make protecting your data easy and worry-free.
- **Accept that your application will have bugs, and leave it up to the data layer to be the final gatekeeper of what is allowed to enter the database.**
- When you app grows you will have to write scripts that run maintenance tasks to clean up or to summarize data. You might even need to access the database through a db client and manipulate your data with raw SQL queries.
- Since the AR::Validations scope is the Rails app that it is defined it, we cannot rely on it to protect our data (what if we are not inside THAT Rails app?  **The validations do help generate an interface that gives the user useful feedback before rejecting bad input. And that’s the key: validations do not safeguard data. They can be bypassed, turned off, or easily deleted. Only at the data layer itself can this be accomplished.**
- A lot of people have worked on RDBMSes, you might as well use all their cool features.
- MySQL vs PostgreSQL: MySQL gained popularity faster because of corporate support offerings and a simple installer in Windows. PostgreSQL was for the longest time the RDBMS for UNIX and Linux users. Why Postgres? It implements much more of the SQL standard, and more faithfully, PostgreSQL has a better query planner than MySQL. **In addition, MySQL has a variety of strange vestiges from its early days, such as the number value zero being treated as equal to the absence of a value, NULL. MySQL is also case insensitive by default. Idiosyncrasies like this seem small at the outset, but often come back later to haunt you.**
- Real benefit of AR as an ORM: Converting all the database entries into an actual Ruby object.

``` ruby
# Example of no ActiveRecord:

db_result = ActiveRecord::Base.select_one("
  select first_name, last_name, birthdate, favorite_food
    from users
   where id = #{id}
")
user = User.new
user.id = id
user.first_name = db_result[:first_name]
user.last_name = db_result[:last_name]
user.birthdate = db_result[:birthdate]
user.favorite_food = db_result[:favorite_food]

## With ActiveRecord, the same is accomplished with a single statement:
user = User.find(id)
```

- DML is always used, whereas DDL is executed once, usually when your application isn't running. What actual benefit do migrations have than straight DDL? Migrations also support only a small subset of the DDL language.
- Referential integrity: You need this, especially when you start releasing updates when your application is already live. **Testing every conceivable use case, including full regression testing for each release, is next to impossible.** Users, including bots, will test every possible edge case. Production is not where you want to find referential integrity bugs. If you want to keep your data intact, you want your constraints to be as complete as they can be.
- As your website grows, biz dev will want to get reports. Visitors per hour, access by state, revenue events related to traffic sources, and is revenue coming external links or links from the email campaign? To generate these reports, your initial db might get overloaded by the reports queries. **If you try to report out of the same database in which you are collecting your data, the simple act of loading the reports creates abnormal load on your database.**
- OLTP vs OLAP: Online Transaction Processing: Queries that store, update, and retrieve data. Ex: CRUD. These are engineered to execute quickly, as there is generally a user waiting for the result of the query. Online Analytical Processing: They are used for business intelligence. Ex: "How many customers who bough a sale item also bought a non-sale item? Nightly or quarterly generated reports are OLAP queries too, and so real-time results are generally not a requirement of an OLAP system.
- OLTP wants normalized tables for speed. Denormalizing makes more sense for OLAP queries to remove costly joins.
- This is why reporting queries are done in a data warehouse. This is where your historical data resides. Over the long run, you might want this over a slave database.
