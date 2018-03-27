---
layout: post
title:  "TIL, 2018-03-26, Cache Implementation"
date:   2018-03-26 16:55:42 +0800
categories: programming
summary: "More redis caching, checking Chef, got to Redux chapter."
---

## Musings

- [Brew vs cask](https://apple.stackexchange.com/questions/125468/what-is-the-difference-between-brew-and-brew-cask)
  - `cask` is an extension to `brew` that allows management of graphical applications through the Cask project.
  - `brew` downloads as source code, `cask` is a compiled package.
  - Casks live in `usr/local/Caskroom`. I can just remove the directory if they are persistent AF. This is linked to in the `brew cask list` command.
  - [Export paths to get latex to work](https://tex.stackexchange.com/questions/307483/setting-up-basictex-homebrew)
- I can just use Adblock Plus as a zapper.
- RSpec: While `yield` is cool, it won't run if the test fails. Use `after_hook` to actually run the thing.
- There's something weird happening re: `redis-namespace` and setting a hash but I still have to figure it out.
- [Is redis-namespace good or bad?](https://www.mikeperham.com/2017/04/10/migrating-from-redis-namespace/) Not really sure but I like the namespacing thing.
- Redis: `scan_each` is a thing.
- The Redis hash actually just stores the first layer as a hash.
- Which brings me to my conclusion: I should have just used Redis's `LIST` to being with. That way I can append or edit shit. Lol.
- I can actually see Ruby versions with the `RUBY_VERSION` method. Also `Generator` is a thing but for older rubies.

```
if RUBY_VERSION.start_with?('1.8')
  require 'generator' unless defined?(Generator)
  Generator.new(&block).to_enum
```

- Looked at Chef vs Ansible vs Puppet vs SaltStack vs Docker vs Vagrant today.
  - I'm currently going with Chef just because I have the Reliably Deploying Rails Apps books and it's in Chef.
  - I might regret this but whatever, I just need to automate setting up servers just so I don't do long processes again.
  - If I ever become a CTO I'll be needing server skill so I might as well actually know how to automate.
- [Puts Debugging](https://medium.com/rubyinside/focused-puts-debugging-with-stderr-5343655255ed)
  - `bundle open <gem>` to open gem code.
  - `gem pristine <gem>` to undo all your changes.
  - `$stderr.puts("haha")
  - `bin/rails server 1\>/dev/null` to redirect STDOUT to `/dev/null`.

## Musings, React

``` js
// react-router imports:

import {
  BrowserRouter as Router,
  Route,
  Link,
  Redirect,
} from 'react-router-dom'
```

### Redux's Key Ideas

- All of your application's data is in a single data structure called the state which is held in the store.
- Your app reads the state from this store.
- The state is never mutated directly outside the store.
- The views emit actions that describe what happened.
- A new state is created by combining the old state and the action by a function called the reducer.
