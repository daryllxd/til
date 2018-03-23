---
layout: post
title:  "TIL, 2018-03-22, Finishing the Deploy, and Experimenting with Redis Cache for Pomodoros"
date:   2018-03-22 13:24:08 +0800
categories: programming
summary: "I finish deploying Transcripto, show it to the homeboys, and hack on Redis optimizing the Pomodoro app."
---

## Musings

- I look through Eloquent Ruby and look at the delegation chapter. I have to think about this theory where I need to know how to implement things. Do I implement via inheritance, delegation, mixins, dependency injection? I think I'll study this topic for a few hours because I need to know, I think they are the same thing, but done multiple ways.
- Also beginning to write about my first blog post on Design Patterns in Ruby: Adapter. I'll put a first example on `terminal-table` and see if it works. It's a small enough example that I like it.
- Ruby `NaN`: Not a number. You get it by dividing 0.0 by 0.0.
- Ruby Delegation Patterns: Inheritance, Composition, Mixins.
- Redis flushing: `redis-cli flushall`
- `time` outside of commands to discover how long they actually took!
- Redis caching: Substantial gains: 2 seconds for a Pomodoro all, and about .3 seconds for a Pomodoro yesterday. I still have to refine my findings, though.
- Vim: Folding in Ruby.
  - `let ruby_fold = 1` " A way to make ruby folding
  - `let ruby_foldable_groups = '#'` " Granularizing ruby folds to occur only in the comments.
  - `set nofoldenable` if you want to disable folding
  - [Reference](https://github.com/vim-ruby/vim-ruby/issues/258)
  - `hi Folded ctermbg=016` [Change fold color](https://stackoverflow.com/questions/16014361/how-to-set-a-custom-color-to-folded-highlighting-in-vimrc-for-use-with-putty)
  - `cterm` is color terminal.

## Musings on Deployment and all the Bugs

- `I need to su - deploy` to have access to ruby?
- No node found for webpacker: `https://github.com/nodejs/node-v0.x-archive/issues/3911`
- `nvm installation`, then link to `nvm`.
- No `webpacker.yml` found, copy from your local.
- [No webpack](https://stackoverflow.com/questions/38116731/node-modules-bin-webpack-d-doesnt-run-says-not-recognised-internal-command) found - `npm install -g webpack`. Other fix: Add [`capistrano-npm`](https://github.com/capistrano/npm).
- No binstubs: `bundle install -binstubs`.
- `npm i webpack -g`
- Weird npm directory: I'm not using the correct node? Ubuntu node is really different. [Upgrade process.](https://askubuntu.com/questions/426750/how-can-i-update-my-nodejs-to-the-latest-version.)
- Autoloading lib in Rails 5? [Reference](https://stackoverflow.com/questions/38198668/rails-5-load-lib-files-in-production).
- Nginx config file: I have to understand it better. [Reference](https://stackoverflow.com/questions/11404502/rails-3-2-2-getting-a-404-on-stylesheets-and-js-assets-after-deployment-with-cap)
