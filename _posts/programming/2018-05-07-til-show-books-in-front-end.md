---
layout: post
title:  "TIL, 2018-05-07, show books in the front-end."
date:   2018-05-07 16:19:30 +0800
categories: programming
summary: "Flexbox to solve columns thing, Reading Seven Concurrency Models in Seven Weeks"
---

# Musings, JS

- [On "Link cannot appear as a descendant in react-bootstrap's `NavItem`][https://stackoverflow.com/questions/42561137/link-cannot-appear-as-a-descendant-of-a-link?]
- [this.state.books.map is not a function][https://stackoverflow.com/questions/30142361/react-js-uncaught-typeerror-this-props-data-map-is-not-a-function]: You're trying to iterate over a non-array. You're iterating over the JSON hash, not the `books` inside the JSON hash.
- [Flow type for is a thing][https://github.com/flowtype/vim-flow] for type-checking JS.
- I used `flex-basis` and `flex-wrap` to solve column things.
- [Preprocessors for browsers?][https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Mixins]
- `Array.join(' ,')` also works for JS now? Yay.
- `<NavItem componentClass={Link} href="/expenses" to="/expenses" active={window.location.pathname === '/expenses'}>`

# JS Project Guidelines
[Reference](https://github.com/elsewhencode/project-guidelines)

- Git: Feature branch, `develop` branch, PR to `develop`, update local `develop` branch and do an interactive rebase before pushing your feature and making a PR, delete local and remote feature branches after merging, make sure your feature branch builds successfully.
- Git workflow: Feature-branch workflow with interactive rebase.
  - `git rebase -i --autosquash develop` to squash all commits into a single commit.
- Commit messages: Separate subject from body with a newline, capitalize subject line, do not end with a period, imperative mood.
- [README template.][https://github.com/elsewhencode/project-guidelines/blob/master/README.sample.md]
- Environments: separate development, test, and production environments.
  - `nvm` and `.nvmrc` in the root.
  - `preinstall` script to check node and npm version.
  - Use Docker image if you can.
- Testing: test mode.
  - Naming convention: `*.test.js` or `*.spec.js`.
  - Use a static type checker.
- Structure and naming: organize your files around product features, not roles.
- Code style:
  - ESLint as linter.
  - AirBNB JS Style guide.
  - `prettier` and `.editorConfig`.
- Code style checker to remove console logs in production. Use logging libraries (`winston`, `node-bunyan`).

# Musings, Ruby/Back-end

- [API Security checklist.][https://github.com/shieldfy/API-Security-Checklist]
- [Disadvantages of Pub-Sub Implementation][https://www.toptal.com/ruby-on-rails/the-publish-subscribe-pattern-on-rails]
  - The event payload must be well-defined, so when it's changed, all Subscribers must be changed. So it's harder to refactor Publisher code.
  - Need to make sure that the Messaging Bus is stable. Services such as Rabbit, Pusher, etc. are more stable than Wisper for more complex systems.
- [Implementing PUB/SUB in Rails; using ActiveSupport::Notifications][http://alma-connect.github.io/techblog/2014/03/rails-pub-sub.html#problem-handling-special-events]
  - Mail deliveries + code, instead of `after_save`, we use the PS to publish a "user signed up" event.
  - "User milestone reached".
  - Pubsub is synchronous, you still need a Sidekiq or something.
- [Sucker Punch][https://github.com/brandonhilkert/sucker_punch]
  - A single-process Ruby asynchronous processing library. This means you can run it inside the Rails app. You can do this thing in the background within the same process as your web app.
- Tried out AWS Transcribe. Wow it's actually really smart, to be honest. But I was listening to like really cool shit anyway. I need to ask people about it.
