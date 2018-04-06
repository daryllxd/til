---
layout: post
title:  "TIL, 2018-04-05, Bike Paps!, React state vs Redux store, Types of Indexes."
date:   2018-04-05 17:16:06 +0800
categories: programming
summary: "REST/RPC, JSON disadvantages, a few other JS libraries to add to the toolkit."
---

# Musings, Ruby/Designing Data-Intensive Data Applications

- The simplest database is 2 bash functions (1 to set, 1 to get), K-V storage.
- DBs don't index everything by default because writes are slower.
- Clustered index: storing an entire row inside the index, with secondary indexes referring to the primary key.
- Nonclustered index: storing only references to the data within the index.
- Heap file: The places where the reference to the rows are stored in.
- Indexes suck at fuzzy querying.
- JSON:
  - Distinguishes strings and numbers, but not integers and floating point numbers. Problem with large numbers.
  - Good support for Unicode character strings, but not binary strings.
  - Schema support?
- Binary encoding:
  - JSON still uses a lot of space compared to binary formats.
  - How do Thrift and Protocol Buffers handle schema changes while keeping backward and forward compatibility? Change field tags.
- Alternatives to JSON: Apache Thrift/Protocol Buffers/Apache Avro.

## Modes of Data flow

- Via database:
- Via REST and RPC:
  - REST: Emphasizes simple data formats, using URLs for identifying resources and using HTTP features for cache-control, authentication, and content-type negotiation.
  - ***Remote procedure call: The RPC model tries to make a request to a remote network service look like the same as calling a function or method in your programming language, within the same process.***
  - Problems with RPC:
    - Network requests are unpredictable.
    - Network request can return a timeout.
    - If you retry a failed network request, the requests might be coming through, but the responses are getting lost. So you might be doing something that you've done already.
- Via Message-Passing Dataflow.
  - Advantage of message broker over RPC:
    - It can act as a buffer if the recipient is unavailable or overloaded.
    - It can redeliver messages to a process that has crashed, and thus prevent messages from being lost.
    - Avoids the seller needing to know the IP/port of the recipient.
    - Allows one message to be sent to several recipients.
    - Logically decouples the sender from the recipient.
  - Brokers: RabbitMQ, Apache Kafka.
  - Implementations:
    - One process sends a message to a named queue or topic, and the broker ensures that the message is delivered to one or more consumers or of subscribers to that queue or topic. There can be many producers and many consumers on the same topic.
    - No data model. Just messages and shit.

# Musings, JS/React

- Very important: How to do a React project: this is the exact commit where things are working fine: [Reference](https://github.com/daryllxd/bikepaps/tree/2fb18ac566ced08b135016708943830e8494efcd)
  - Basically, I replicated the strategy I did with create-react. Create react, get the router to work, then add the deployment/CNAME afterwards.
  - I wonder if this would work in Netlify.
- [The prophet Dan Abramov re Redux's store and React's state:](https://github.com/reactjs/redux/issues/1287#issuecomment-175351978)
  - ***Use React for ephemeral state that doesn't matter to the app globally and doesn't mutate in complex ways. For example, a toggle in some UI element, a form input state. Use Redux for state that matters globally or is mutated in complex ways. For example, cached users, or a post draft.***
  - ***Sometimes you'll want to move from Redux state to React state (when storing something in Redux gets awkward) or the other way around (when more components need to have access to some state that used to be local). The rule of thumb is: do whatever is less awkward.***
- String interpolation: `Hello ${world}`.
- First functional component! Hehe.
- [Weird bug where the page moves because of the scrollbar appearing when I resize the web page.](https://stackoverflow.com/questions/1417934/how-to-prevent-scrollbar-from-repositioning-web-page)
- The `getYear` and `getMonth` in JS is zero indexed. (?)
- [Relay](http://facebook.github.io/relay/) combines React with GraphQL? Hehe.
- Discovered libraries:
  - Form validation recommended by Reddit: [Reference](https://github.com/jaredpalmer/formik)
  - Autocomplete library: [Reference](https://github.com/reactjs/react-autocomplete)
  - Select library: [Reference](https://github.com/JedWatson/react-select)
  - For large lists: [Reference](https://github.com/bvaughn/react-virtualized)
  - Schema validation library: [Reference](https://github.com/hapijs/joi)

# Disadvantages of GraphQL?
[Reference](https://stackoverflow.com/questions/40689858/are-there-any-disadvantages-to-graphql)

- Joins are not trivial.
- Nested queries can lead to circular queries.
- Rate limiting of calls becomes harder due to the user firing multiple queries in one call.
- The response matches the shape of the query.
- Caching is hard, you have to have a transformation layer to reshape the response.
- Handling file upload: nothing in the GraphQL spec.
- Unpredictable/possible to N+1.
- For really simple APIs, why not just use normal REST?
