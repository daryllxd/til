---
layout: post
title:  "TIL, 2017-04-05"
date:   2017-04-05 14:37:32 +0800
categories: programming
summary: "Where I should check default gems more often."
---

- Turns out we have `capistrano_rails_console` already? And I was SSHing like a moron all this time.
- Always check query order selection. 3 bugs from that today.
- `as_json` works when you need an AR model to be rendered in its json form.
- Very important: When doing array operations/selections, ensure that they are arranged correctly.
- Grep the logs: `execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log | grep --line-buffered Parameters"`. [Reference](http://stackoverflow.com/questions/7161821/how-to-grep-a-continuous-stream/7162898#7162898)
- `Fuubar` is nice. [Reference](https://github.com/thekompanee/fuubar)
- No idea what [`rubygems-bundler`](https://github.com/rvm/rubygems-bundler) actually does, but you can do `gem install rubygems-bundler` and `gem regenerate_binstubs` so you can do `rake` if there are mismatches.
- Making your own generator is a thing apparently? I am thinking of making generators for common things like adapters, queries, service/commands, and the different types of specs.
