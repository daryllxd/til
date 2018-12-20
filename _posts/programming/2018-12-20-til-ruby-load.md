---
layout: post
title:  "TIL, 2018-12-20, Ruby load Gemfile gems"
date:   2018-12-20 11:14:25 +0800
categories: programming
summary: "Tech leading, repository pattern, Django business logic"
---

# Musings

- To load all the Gemfile's gems:

```ruby
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
require 'bundler/setup' # Set up gems listed in the Gemfile
```

# Understanding ruby load, require, gems, bundler and rails autoloading from the bottom up
[Reference](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0)

- `load`: This will always return true, else raise a `LoadError`. Global variables, classes, constants, and methods are all imported, but not local variables.
- Calling `load` twice executes the code in that file twice.
- `require`: executes the file once. It returns `true` if the file was executed, and `false` if it wasn't.
- `require_relative`: relative to the current file.
- How does the code in a gem get loaded:
  - `require` looks at all the directories in the `$LOAD_PATH`.
  - Rubygems will look for an installed gem which has a file called `json.rb`.
- `gem environment`: looks at the output of where the gems are saved.
- If a gem needs another gem, it installs those dependencies too.
- `bundle exec` ensures that `require` will load the version of a gem specified in your `Gemfile.lock`.

# Tech Leading - A Story of One Project in Four Acts
[Reference](https://www.monterail.com/blog/tech-leading)

- Performing an audit: checking out the UX, an entire repo's code review, and gather all information from previous points and confront them with out best practices used in other projects.
- This audit helped us quickly understand most of the business logic behind the project. We could provide our client with a complete report of existing problems and prepare a plan to make a newer implementation.
- Repositories: all AR calls moved into single files. This creates thinner models and more reusable code.
- Terraform and Ansible: hosting staging and pre-production environments on Heroku.
- Production should have: monitoring, automatic service restarts, and everything was set up on a single instance, so no horizontal scaling.
- Fast decisions can speed up the MVP, but they also create technical debt that we must take care of later.
- Architecture as code.
- Planning poker - estimates effort, not time.
- Communication is crucial: weekly calls with updates build trust.

# How to Use Repository Pattern with Active Record— Ruby on Rails Development
[Reference](https://www.monterail.com/blog/repository-pattern-active-record)

- Possible improvements:
  - Divide repos into queries and commands.
  - Build your own entities.
  - Get ride of AR completely?

# Separation of business logic and data access in Django
[Reference](https://stackoverflow.com/questions/12578908/separation-of-business-logic-and-data-access-in-django)

- Data model vs domain model: data is where you actually store your data, and domain model is where you find the business logic.
- Domain model: classically, it's about queries and commands. Commands can be expressed by the `given-when-then` scenarios.
- Service module: defining a separate module, with each command represented as a function.
- Django forms: combines executing the command, validation of the command parameters, and presentation of the command.
- Queries: think, is it a presentational query, a business logic query, or a reporting query?
- Proxy models: Enhanced subset of the model.
- Query models: A form of denormalization where relevant data for a single query is stored in a separate model.
- Guidelines:
  - **Does my model contain methods that do more than managing database state? You should extract a command.**
  - **Does my model contain properties that do not map to database fields? Extract a query.**
  - **Does my model reference infrastructure that is not my database (such as mail)? Extract a command.**
