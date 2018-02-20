---
layout: post
title:  "TIL, 2018-02-19, Programming Phoenix"
date:   2018-02-19 17:27:27 +0800
categories: programming
summary: 'Reading Programming Phoenix. "When you think about it, typical web applications are just functions."'
---

## Musings

- Gin, Martini: Go frameworks.
- Plug: Rack for Elixir.
- Hexdocs are the documentation for Phoenix.
- `mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez` to install Phoenix or upgrade to latest version. [Reference](https://hexdocs.pm/phoenix/installation.html)
- `Ctrl-C` during IEx to break out of it.
- `cowboy`: Phoenix web server.
- Controller and View are explicitly separate. They are also separated from the template being shown.
- Templates: Embedded Elixir (`.eex` file).
- Change starting port: `dev.exs`, `HabitsOne.Endpoint`, then there is a port section there.
- Or you can do: `PORT=4002 mix phx.server`
- `$ gem cleanup` to remove stuff. Solves `Unresolved specs during Gem::Specification.reset` (which usually means there are old gems in the system which may be interfering with your command). [Reference](https://stackoverflow.com/questions/17936340/unresolved-specs-during-gemspecification-reset)
- Pluralsight Ruby Beyond the Basics:
  - Currying in Ruby.
  - You can do functional things when applying multiple discounts for the report.
  - "What this class does is what this class is."
  - Functional programming: Composition, referential transparency, and small, specific solutions.

### Color Filter

``` ruby
class ColorFilter
  def initialize(color)
    @color = color
  end

  def apply(products)
    products.select { |p| p.color == @color }
  end
end
```

## Programming Phoenix

- `mix local.hex` to install Hex, the package manager.
- `mix phoenix.new -v` to check Phoenix version.
- `mix phoenix.new hello`: Creating the app.
- `mix ecto.create`: `rake db:create`?
- `mix phx.server`: `rails server`?
- `config/dev.exs`: Edit this thing for the database.
- `iex -S mix phx.server` to run the app inside IEx.
- `prod.secret.exs`.
- `MIX_ENV` environmental variable to switch between prod/dev.
- This looks really nice:

``` elixir
conn
|> put_flash(:info, "Whoa cool.")
|> put_flash(:error, "Error.")
|> render("world.html", name: 'SWAGG')
```

- This is like the part of the Rails boot process/Action Pack:

``` elixir
defmodule Hello.Endpoint do
  user Phoenix.Endpint, otp_app: :hello

  plug Plug.Static,
  plug Plug.RequestId,
  plug PLug.Logger

  plug Plug.Parsers,
  plug Plug.MethodOverride,
  plug Plug.Head

  plug Plug.Session,
  plug Hello.Router
end
```

- This is essentially:

``` elixir
connection
|> Plug.Static.call
|> Plug.RequestId.call
|> router
|> HelloController
...
```

## How I Rented a Nice Place
[Reference](https://medium.com/@DFilipeS/how-i-rented-a-nice-place-to-live-using-elixir-and-a-facebook-messenger-chat-bot-836f79498c5c)

- Umbrella: A way of organizing a project into different standalone modules that depend on each other.
- `$ mix phx.new --umbrella rent_bot`.
- HTML parsing library: `Floki`.
- HTML requester: `HTTPoison`.
