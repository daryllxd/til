---
layout: post
title:  "TIL, 2017-11-26, Setting up a Server."
date:   2017-11-26 18:29:04 +0800
categories: programming
---

- `git rev-parse --abbrev-ref HEAD` if you want to see the current branch in Git.
- Capistrano `pty`: telling the back-end that this is an interactive session. Non-login, non-interactive shell.
- Nano exiting: `Ctrl-X`. Saving: `Ctrl-O`.
- Setting up RDS: You can do free tier here.
- `source /home/deploy/.rvm/scripts/rvm` to add `rvm` to `rvm install` on the server.
- Even if you are going to use RDS, you still need to install PG on the EC2 instance.
- Install node if no JS runtime (`uglifier` will tell you this).
- You make the RDS allow public but set its security group to only allow stuff in the same VPC.
- `nc -zv postgresql1.c6c8mn7tsdgv0.us-west-2.rds.amazonaws.com 8299` to check if you can connect to the RDS.
- Security group has the highest chance to like make the thing not work re connecting to the database. What I did was to set the security group to allow PostgreSQL for the VPC that the web server (and the database server) is residing in. So you allow HTTP and SSH access.
- Creating the database: Go to a release then `RAILS_ENV=production bundle exec rake db:create`.
- Starting up Puma: Put the puma in the `Capfile`. Then, the commands are: `bundle exec cap puma:start puma:stop puma:restart`.

``` ruby
require "capistrano/puma"
install_plugin Capistrano::Puma
```

- If no CSS, maybe cause the nginx server isn't set up to use Capistrano's conventions.
- Time Machine status: `tmutil status`.
