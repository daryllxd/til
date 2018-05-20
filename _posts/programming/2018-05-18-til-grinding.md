---
layout: post
title:  "TIL, 2018-05-18, Grinding"
date:   2018-05-18 21:03:33 +0800
categories: programming
summary: "Coding, reading about Prefetch/preload."
---

- `classNames` library: What does this thing do?
- [If doesn't really work in JSX. Use a ternary.](https://react-cn.github.io/react/tips/if-else-in-JSX.html)
- `React must be in scope` error: You still need `import React from 'react'` for higher-order components.
- [Mistakes done in ReactJS by devs:](http://www.js-craft.io/blog/14-The-7-Most-Common-Mistakes-that-React-Developers-Make/)
  - Anything that is state changing should be done via the `setState` method.
  - `setState` is async, if you want to make things not async, you have to put it in a callback function.
  - When you want to set a number as a prop, surround it like this `value={2}`, not `value="2"`. Or, use React's prop-types.
  - Use `className`, not `class`. Also, React components only start with a capital letter.
  - Try to break down and reuse components as much as possible. It's easy to write bloated components when you first start using React.

- [JS Lint's No `bind()` or Arrow functions in JSX Props.](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-no-bind.md)
  - This creates a brand new function on every single render. This is bad for performance, as it will result in the GC being invoked way more than necessary.

- Bad:
  - `onClick={this._handleClick.bind(this)}`
  - `onClick={() => console.log('Hello')}`
- Ok:
  - `onClick={this._handleClick}`

- To solve this, pull the repeated section into its own component.

```
// Bad
var List = createReactClass({
  render() {
    return (
      <ul>
        {this.props.items.map(item =>
          <li key={item.id} onClick={this.props.onItemClick.bind(null, item.id)}>
            ...
          </li>
        )}
      </ul>
    );
  }
});


// Good

var List = createReactClass({
  render() {
    return (
      <ul>
        {this.props.items.map(item =>
          <ListItem key={item.id} item={item} onItemClick={this.props.onItemClick} />
        )}
      </ul>
    );
  }
});

var ListItem = createReactClass({
  render() {
    return (
      <li onClick={this._onClick}>
        ...
      </li>
    );
  },
  _onClick() {
    this.props.onItemClick(this.props.item.id);
  }
});
```

# Musings, Ruby

- I do not like the `validates :name, :age, presence: true`. I would rather just do validations for a field in one line.
- You use `PATCH` if you're modifying an existing resource. Use `PUT` if you're replacing a resource in it's entirety.
- [Catching exceptions:](https://stackoverflow.com/questions/3694153/catch-all-exceptions-in-a-rails-controller?noredirect=1&lq=1) catch `AR::RecordNotFound`, `AR::ActiveRecordError` first. Then you can do a `rescue_from ....` somewhere there.
  - [exception-handler gem?](https://github.com/richpeck/exception_handler)

# Ruby Timeouts
[Reference](https://github.com/ankane/the-ultimate-guide-to-ruby-timeouts)

- PG: Statement timeouts: Prevent single queries from taking up all of your database resources.
  - `database.yml`

``` yml
production:
  variables:
    statement_timeout: 250 # ms
```

- ActiveRecord:: `ActiveRecord::Base.establish_connection`
- ElasticSearch: `Elasticsearch::Client.new(transport_options: {request: {timeout: 1}}, ...)`
- Mongo: `Mongo::Client.new([host], connect_timeout: 1, socket_timeout: 1, server_selection_timeout: 1, ...)`
- Redis: `Redis.new(connect_timeout: 1, timeout: 1, ...)`
- Kafka: `Kafka.new(connect_timeout: 1, socket_timeout: 1)`
- Faraday:

```
Faraday.get(url) do |req|
  req.options.open_timeout = 1
  req.options.timeout = 1
end

Faraday.new(url, request: {open_timeout: 1, timeout: 1}) do |faraday|
  # ...
end
```

- Puma: `# config/puma.rb worker_timeout 15`
- ActionMailer:

``` ruby
ActionMailer::Base.smtp_settings = {
  open_timeout: 1,
  read_timeout: 1
}
```

- AWS:

```
Aws.config = {
  http_open_timeout: 1,
  http_read_timeout: 1
}
```

- `Gibbon`, `geocoder`, `Google-Cloud`, `hipchat`, `koala`, `kubeclient`, mail, `mechanize`, `net-dns`, `stripe`, `twilio-ruby`, `zendesk-api`.
- On rescuing exceptions:
  - `rescue Timeout::Error`


## UBER TALK
- Can make an echo
- HTTP becomes an RPC at some point
- Dashboard for everyone that is easy to implement
- Logging
- Tracing
- Accounting for all the log messages
- Load testing
- Way to check "test" traffic
- Failure testing: people hate it.
- Migrations: Old stuff still has to work.
- Mandates for people to migrate are bad. Carrots, not sticks, unless for security/compliance reasons.
- Platforms/not those parts of the core service: Those things usually become an open-source thing. Amazon might build it?
- Politics: When you put your values over the team and your team over the company. It's not "things you don't like." When you value individual things, something happens.
- Everything is a trade-off.
- Coupling in RPC: There's duplication and coupling sometimes. We try out best.


# Fear, Trust, and JS
[Reference](https://www.reaktor.com/blog/fear-trust-and-javascript/)

- Examples of "fear" in the data/what do these things contain?
  - `if (!user || !user.name) ...`: Defensive programming. This happens when you can no longer trust your own code to provide the data you expect. The code becomes full of defensive checks.
  - Optional types via TypeScript or Flow. Validation thingies? JSON schema validator like [Reference](https://github.com/epoberezkin/ajv) to make sure the data matches the schema.
  - You can use the TS or Flow compilers as libraries.
- On the "fear" of data changing. You can do pretend immutability.
  - `const` over `var` and duplicating values over mutation.
  - Use `let` to indicate value will change.
  - Ternary over `if`.
- Libraries: `Ramda` as a functional utility belt. `Immutable.js`, `Mori`.
- Ultimately, the strength of your types depends on the knowledge and belief of your team in applying them. If the team has a high level of belief/knowledge of types, they can encode a higher level of trust into the system.
- When you use more advanced functional programming tech, it becomes harder to check types.
- JS is centered around mutable data, and you can't enforce immutability from a library.
- Learning to code with fear:
  - Write better JS. Assume that you can trust little in your code.
  - Introduce type validation when necessary.
  - Use immutable data when you need so.
  - Adopt optional types when it makes sense.
  - Elm?


- What is DNS prefetching?

- [Prefetch/preload/prebrowse?](https://css-tricks.com/prefetching-preloading-prebrowsing/)
- Pre-fetch: A way to hint to the browser about resources that are definitely going to or might be used in the future. Some to the current page, some to possible future pages.
  - DNS prefetching: Notifies the client that there are assets we'll need later from a specific URL, so the browser can revolve the DNS as possible. Chrome does this all the time.
- Pre-connect: Will resolve the DNS but will also make the TCP handshake and TLS negotiation. Sets u p the sockets ahead of time.
- Pre-fetching: If we are certain that this thing is going to get requested, ask the browser to request that item and store it in the cache for reference later.
  - `<link rel="prefetch" href="image.png">`
  - Literally requesting/downloading that asset and storing it in the cache. This depends on the browser.
  - FF will only prefetch resources when "the browser is idle". For webfonts?
- Subresources: identify those who are the higher priority.
  - `<link rel="subresource" href="styles.css">`
- Pre-rendering pages: Pre-emptively loads the assets of a certain document.
  - `<link rel="prerender" href="http://css-tricks.com">`
  - You have to be certain that th user will click that link, otherwise the client will download all of the assets necessary to render the page for no reason at all.
- `Preload`: Just download an asset always.
  - `<link rel="preload" href="image.png">`
