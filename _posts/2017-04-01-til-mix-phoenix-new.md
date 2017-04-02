---
layout: post
title:  "TIL, 2017-04-01, mix Phoenix.new"
date:   2017-04-01 03:07:13 +0800
categories: programming
summary: "Where I tried out Phoenix."
---

## Phoenix Hello World

- `mix phoenix.server` to start the app. The documentation is fairly straightforward.
- `ecto` is the ORM. By default it will look for a postgres user. Change the username in `config/dev.exs`.
- Routes are in `web/routes.exs`.

- `Foreman`--if it is too quiet, you can pipe the tail over to only get what you need. Ex:

```
alias tail-log="tail -f log/development.log
tail-log | ag 'SELECT':

User Load (1.2ms)  SELECT  "users".* FROM "users" WHERE "users"."remember_token" IS NULL  ORDER BY "users"."id" ASC LIMIT 1
CACHE (0.0ms)  SELECT  "users".* FROM "users" WHERE "users"."remember_token" IS NULL  ORDER BY "users"."id" ASC LIMIT 1
```

- https://deardesignstudent.com/ethics-and-paying-rent-86e972ce9015
