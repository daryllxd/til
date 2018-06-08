---
layout: post
title:  "TIL, 2018-06-06. Engineers → Managers"
date:   2018-06-06 17:21:20 +0800
categories: programming
summary: "JS Frameworks, Rails Performance, RabbitMQ."
---

# Musings/Clearing Through Reading List.

- [JS Frameworks/Topics to Learn in 2017](https://medium.com/javascript-scene/top-javascript-frameworks-topics-to-learn-in-2017-700a397b711)
  - Tooling:
    - Chrome dev tools, npm, git/Github, Babel, Webpack, editor, ESLint, Tern.js, Yarn, TypeScript, Flow.
  - React:
    - React takes inputs to components as props and conditionally renders DOM updates if data has changed for specific parts of the DOM.
    - Event handling: After the DOM has rendered React automatically delegates DOM events to a single event listener at the root of its DOM tree.
    - *2-way data binding: changes to the DOM may directly update data. With 2-way binding, changes to the DOM during th DOM render process can potentially retrigger the drawing phase before the drawing is finished, causing re-flows and repaints.*
    - Libraries: `create-react-app`, `react-router`, `Next.js`, `velocity-react`.
  - Redux:
     - Transactional, deterministic state management for your apps. In Redux, we iterate over a stream of action objects to reduce to the current app state.
    - ***Even if you don't use Redux, this will teach you new ways to think about reducers, which are general-purpose functions for iterating over collections of data and extracting some value from them.***
  - RxJS: Reactive programming utilities.

# This 90-Day Plan Turns Engineers into Remarkable Managers
[Reference](http://firstround.com/review/this-90-day-plan-turns-engineers-into-remarkable-managers/)

- Which methods have been helpful for learning to manage effectively: "trial and error", feedback, observing peers.
- You need to have relationships with: your team (can you lead engineers), your peers (can you work well with your fellow managers), and your manager (can you give clear snapshots).
- This is an entirely new job. You now have people whose happiness and effectiveness at work rests largely on your shoulders. You're responsible for the results but can't do it all yourself.
- Look out for this:
  - *Don't manage in order to please the boss.*
  - *Don't manage only to advance your career.*
  - *Manage if growth for you involves others.* You can view interns as a time-suck or as an opportunity to groom a better engineer.
  - *Manage if you channel empathy.*
  - *Manage if you can give the trust you ask of others.* Most important tip: don't lie. Don't share sensitive information from a one-on-one meeting.
- Trust, but verify.
- Continuous career conversations: what are your career goals? Keep being an engineer, be a manager, do a startup, be a recognized technical expert.

- ***Education:*** Peopleware, The Mythical Man-Month, First, Break All the Rules. Don't hide your study sessions: when you block time for your education, own it. Find a management mentor. Get guidance from your boss.
- ***Find your rhythm.*** Cancel meetings: honor and defend their judgment re: meetings. Build an event loop: Did I do the things I need to do for the day, week, and month? [Reference](https://s3.amazonaws.com/marquee-test-akiaisur2rgicbmpehea/dgVXCQ87Ry2aeL7OKJyu_Screen%20Shot%202015-07-16%20at%2011.43.16%20AM.png)
- ***Assessment.***
  - What is unique about each team member and your plan to capitalize on it?
  - Good debugger vs good software designer, self-awareness.
  - Evaluating performance:
    - How is the quality of the software been?
    - How have they been doing with their milestones?
    - How's the morale?

# On Code Review
[Reference](https://medium.com/@9len/on-code-review-16ea85f7c585)

- Make it a top priority, and figure out the best way to work it into your event loop.
- Make the requests a pleasure to read.
- *Pending code reviews represent blocked threads of execution.*
- Don't put code review off for more than a few hours.
- Prioritize code review above most work.
- Expect to spend time on CR every day, throughout the day. Carefully review the diff before publishing.
- Keep review requests as small as possible.
- Acknowledge comments quickly.

# The Outrageous Cost of Skipping TDD & Code Reviews
[Reference](https://medium.com/javascript-scene/the-outrageous-cost-of-skipping-tdd-code-reviews-57887064c412)

- 30% longer with TDD, but reduce production bug density by 40-80%.
- Fixing a production bug costs 100x more than fixing a bug at design time, and over 15x more than fixing a bug at implementation time.

# API with Ruby on Rails: useful tricks
[Reference](https://railsware.com/blog/2013/04/08/api-with-ruby-on-rails-useful-tricks/)

- Inherit from `ActionController::Metal`, not `ActionController::Base`. Up to 40% speedup.

``` ruby
  include ActionController::Rendering        # enables rendering
  include ActionController::MimeResponds     # enables serving different content types like :xml or :json
  include AbstractController::Callbacks      # callbacks for your authentication logic
```

- Routing: Versioning.
- Hiding IDs with GUIDs.

# Rails Performance and the root of all evil
[Reference](http://blog.scoutapp.com/articles/2016/05/09/rails-performance-and-the-root-of-all-evil)

- Baking in performance with best practices and experience: Pagination, DB indexes, pagination, know what SQL AR is firing, using `includes` when necessary, know when caching is going to be useful.
- Measuring, identifying, and handling performance issues.
- ***It's much easier to build performance into an app than it is to hunt down random performance problems as they bubble up. Baking in optimization is not what Knuth means by "premature." Let's see a bit more context around the Knuth quote:***
- Quickest path:
  - Fix evidence.
  - Use APM services.
  - Work locally using logs or tools.
  - Keep narrowing down the problem until you have one line or area at fault.
- Evil optimizations:
  - Looking for Ruby problems instead of app problems/poorly written AR.
  - Figuring out how to display 5K rows of something on a page.
  - Is an alternative database necessary?
  - Build abstractions to work around performance problems.
  - Obsess about rewriting parts of the app in another language.
- Non-evil optimizations
  - Ensure a popular action stays under 300ms
  - Implement caching
  - Increase RAM
  - Evaluate the performance of the existing feature first
  - Monitoring

# Ruby Backend Performance Getting Started Guide
[Reference](https://schneems.com/2017/05/17/ruby-backend-performance-getting-started-guide/)

- Start by looking at the outliers (slowest endpoints, those with most memory).
- Check memory usage.
- Scout to check out memory leaks.
- Memory problems usually come from AR/how you use it.
  - Make sure all queries to the DB are using a `limit`.
  - Use `find_each` when you need to loop around a large number of objects.
  - Get a bigger database with production-ish data.
- Tools: `rack-mini-profiler`, `bullet`.

# N+1 Queries or Memory Problems: Why not Solve Both?
[Reference](https://www.schneems.com/2017/03/28/n1-queries-or-memory-problems-why-not-solve-both/)

- N+1 is bad, but unneeded memory allocation is worse.
- If you need count, do `counter_cache`.
- Pass values if you need to.

# Communication Layer Design for Ruby Microservices
[Reference](https://medium.com/matic-insurance/communication-layer-design-for-ruby-microservices-98b388174aef)

- Book reader vs Book storage.
  - `book_storage_client`: HTTP client initialization, classes for initiating API calls to and from the "Book Storage", serialization/deserialization logic, mapping to "Book Storage" models.

xxxxxxxxxxxxxxxxxx

# Event-Driven Microservices With RabbitMQ and Ruby
[Reference](https://dzone.com/articles/event-driven-microservices-with-rabbitmq-and-ruby-1)

- Event sourcing: works best when chosen as a top-level architecture for a new service from the start.
- Rabbit: Stable, manageable, highly-available solution for messaging.
- Producer/consumer (work queues) pattern.
- ***Event-driven services: a system of separate apps and services that communicate with each other in an asynchronous pattern, as loosely coupled as possible.***
- *Event publishers should not care who consumes messages, while our event consumers should never lose messages, even if the thing goes down.*
- Rabbit solves this problem using exchanges, topics, and queues.
- Kafka: Event history and storage mechanism.
- In Rabbit, events published on an exchange are ephemeral: unless they are bound to a queue, they are lost forever. And even if it ends up in a queue, the message is gone as soon as a customer finishes handling it.
- History table.
- State machines: The explicit state machine makes it easier to understand at a glance, as well as enforcing business rules. (We already do this anyway.)

``` ruby
module Products
  class Update < Mutations::Command
    required do
      model: product integer: adjust_inventory
    end

    def validate
      if adjust_inventory == 0
        return add_error(: adjust_inventory, : invalid, 'Inventory adjustment factory cannot be zero')
      end

      if adjust_inventory < 0 && ((product.inventory + adjust_inventory) < 0)
        return add_error(: adjust_inventory, : invalid, 'Cannot set inventory below zero')
      end

      if product.discountinued?
        return add_error(:product, :discountinued, 'Product is discountinued')
      end
    end

  def execute
    product.inventory += adjust_inventory
    product.save

    if adjust_inventory > 0
      product.add_inventory!
    else
      product.reduce_inventory!
    end

    product
  end
end
```

- A model that represents event data:

``` ruby
class StateTransitionEvent
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field: entity_type, type: String
  field: entity_id, type: BSON::ObjectId
  field: entity_attributes, type: Hash
  field: event, type: String
  field: from, type: String
  field: to, type: String
end
```

- Replaying messages: If we want to add a new microservices to our system that intends on storing its own copy of the event data.
- Or if we want to always read all events at startup and store the data in-memory.

# Event Sourcing Microservices with Kafka
[Reference](http://blog.kontena.io/event-sourcing-microservices-with-kafka/)

- E-commerce application, which is a collection of microservices and a front-end application.
- Web app → `CustomerService`, `ProductService`, `PurchaseService`.
- Each of these are Aggregate Roots and should manage their own data, storing only references to other aggregates.
- How do you join data across multiple services?
- *Materialized view: A database object that contains the result of a query. It can be a local copy of data located remotely, a subset of rows and/or columns of a table or join result, or a summary using an aggregate function.*
  - View: Virtual table representing the result of a database query.
- Kafka topics as the transaction log of the microservices: what are the tables?
- Kafka stores all the messages it has received in a topic/partition with a sequential index.
- On differentiating events:
  - Events that are the direct result of some user interaction or command.
  - Events that are the result of a command, used to publish the current state of the service and its entities. These topics can be subscribed to by all interested parties.
- Running out of disk space? Log compaction.
- Consistency: The service may have to validate itself. Better approach to ask for forgiveness rather than asking for permission.












  - Ruby refine method? [Reference](https://stackoverflow.com/questions/32115323/how-to-refine-module-method-in-ruby?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)


# Debugging Javascript

- Use `getDerivedStateFromNextProps` (formerly `componentWillReceiveProps`). You still need to initialize state. [Reference](https://stackoverflow.com/questions/39000698/react-call-function-on-props-change)

``` js
class TranslationDetail extends Component {
  state = {}; // initialize state (this requires instance props)

  // use new static method to derive state from props
  static getDerivedStateFromProps(nextProps, prevState) {
    if(nextProps.params.id !== prevState.id) { // check id was updated
      return {
        id: nextProps.params.id, // save id in state
      };
    }

    // do not update state otherwise
    return null;
  }
}
```

- React 16.3: `componentWillMount`, `componentWillUpdate`, and `componentWillReceiveProps` are deprecated.
- Looping through a JS object



https://github.com/cypriss/mutations



empty js object? => https://stackoverflow.com/questions/679915/how-do-i-test-for-an-empty-javascript-object?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

Conditional assignment = neesd to be ternary, not if

 Assoc array to string: `JSON.stringify()` => JESUS  CHIRST


 How the hell do you iterate over an object with keys

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/entries
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map
https://stackoverflow.com/questions/684672/how-do-i-loop-through-or-enumerate-a-javascript-object?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

[dqwdqw](https://stackoverflow.com/questions/41773778/sending-number-instead-of-string-from-select-in-react-component?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)


- Lodash StartCase
https://stackoverflow.com/questions/4149276/javascript-camelcase-to-regular-form?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

Passing a component into another component?


Removing XCode components

# Removing the @ Hack in Rails Controllers
[Reference](https://medium.com/@eric.programmer/removing-the-hack-in-rails-controllers-52396463c40d)

- Typical way: `render :show, locals: { user: user }`
- Ways to circumvent: `@user`, implicit rendering.
- Problem with setting things in the `before_action`: hard to figure out it the action is actually doing something.
- Solution: use a method, or do the `helper_method` thing.
- Solution: Use `let` metaprogramming to not use instance variables, because it exposes a lot of things.
- Materialized view?

- [Lambda trends](https://blog.newrelic.com/2017/11/21/aws-lambda-state-of-serverless/)
  - Lightweight functions using scripting languages (few hundred MS).
  - Polyglot (Python + NodeJS).
  - Media function timeout: 60 seconds.
  - Globally distributed.
- Apache Samza: Taking in streams of facts as they come in, and functionally process them in real time.
  - Stateless backend: Able to be scaled by running more processes in parallel, and you can route any request to any back-end instance, so it's easy to spread the load across multiple machines.
  - The state has to go SOMEWHERE, and so we have to put it in the database. We are now using the database as a kind of gigantic, global, shared, mutable state.
  - Replication strategies: send the update query to the follower, or ship the write-ahead log to the follower. Third: Have a logical log: have the leader write out the effect that the query had. Logical log identifies the row that was changed, gives the new value of that row, and also the old value.
  - `CREATE INDEX CONCURRENTLY`?
  - Caching problems: when to invalidate, race conditions, cold start/bootstrapping.
  - Samza: Stream processing framework designed to go well with Kafka.


- Lantern = unblocker? lol.
https://github.com/jackc/surus
