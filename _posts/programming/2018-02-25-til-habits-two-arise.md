---
layout: post
title:  "TIL, 2018-02-25, Habits Two, arise!"
date:   2018-02-25 14:43:29 +0800
categories: programming
summary: "Where I scrap out Elixir Habits One for a better one."
---

## Musings

- Rebind iBooks `hjkl` to be Vim-like.
- `expected action/2 to return a Plug.Conn, all plugs must receive a connection (conn) and return a connection`: You have to return a `conn` object at the end of the controller action. You can't just do a `require IEx; IEx.pry`, you have to still return the connection.
- What the hell re: searching for `brunch phoenix`, we get to brunches in Phoenix, Arizona lol.

``` elixir
def delete(conn, %{"id" => id}) do
  require IEx; IEx.pry
  conn
end
```

- After a redirect, the flash var from the other side still exists.
- I just recreated Habits One as Habits Two. Apparently I have a 1.3.0rc version of Phoenix, I need at 1.3.0. Might as well get the latest one.
