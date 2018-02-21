---
layout: post
title:  "TIL, 2018-02-20, Programming Phoenix, Day 2"
date:   2018-02-20 13:27:28 +0800
categories: programming
summary: "Programming Phoenix, doing CRUD things."
---

## Musings

- Phoenix sample app: [Reference](https://github.com/gothinkster/elixir-phoenix-realworld-example-app)
- Layers in Rails: [Reference](https://www.amberbit.com/blog/2015/7/29/hold-on-i-know-where-it-leads/)
  - Internal API for the app, but surrounded by: HTTP interface, Database access, Logger, File storage, Messaging.
  - If simple app, then you can speed things up by integrating the HTTP code with the actual app.
  - When you have additional interfaces (user actions, cron jobs, bash scripts), you need something inside.
  - Bigger app: HTTP, CLI, events/jobs, database access, logger, file storage, messaging.
  - Comparison: ActionController, Rake, Resque, Sequel, Rails.logger, Fog/S3, ActionMailer.
  - Possible entrance to the app:

``` ruby
class ApplicationController < ActionController::Base
  attr_reader :app
  helper_method :app

  before_filter :setup_app

  private

  def setup_app
    @app = MyShinyApp.new(session[:user_id])
  end
end
```

- Phoenix is doing this via Contexts. [Reference](https://hexdocs.pm/phoenix/contexts.html)
- `h String` or `h Enum.map` in IEx to learn things about Elixir!
- `alias HabitsOne.User` to not need to constantly have `HabitsOne.User`, just use `User`. [Reference](https://elixir-lang.org/getting-started/alias-require-and-import.html)
- Linux: `cd -` to toggle between directories.

## Programming Phoenix

- `alias User`: Bring in `HabitsOne.User` to iex.
- `IEx.Helpers.recompile` to reload the current Mix application. [Reference](https://stackoverflow.com/questions/36490089/how-do-i-recompile-an-elixir-project-and-reload-it-from-within-iex)
  - This worked, I also tried `r HabitsOne.User` but it didn't recompile.
- Enumerable: `find` to get the first match only, `filter` to get all matches. Also Elixir's Enumerable is bigger than Ruby's!
- First model:

``` elixir
defmodule HabitsOne.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(HabitsOne.User) do
    [
      %HabitsOne.User{id: "1", name: "Daryll", username: "daryllxd", password: "daryllxd"},
      %HabitsOne.User{id: "2", name: "Jerico", username: "jerico", password: "jerico"},
      %HabitsOne.User{id: "3", name: "Justin", username: "justin", password: "justin"}
    ]
  end

  def all(_module), do: []

  # Given a module, iterate over and get all records with the same ID
  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  #
  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end

iex> alias HabitsOne.User
iex> alias HabitOne.Repo

iex> Repo.all User
iex> Repo.get(User, "1")
iex> Repo.get_by User, name: "Jerico", password: "jerico"
```

- Different error for no `UserController,` not having `user HabitsOne.Web, :controller`, and not having the right `index` action.
- Error: `cannot expand Struct User`: You did not alias `HabitsOne.User`.
- Debugging:

``` elixir
require IEx; IEx.pry
$ iex -S mix phoenix.server

pry> respawn # Kills the iex process and spins a new one up at the same place in the code

```
- Migrations: `$ mix ecto.gen.migration create_user`
- Insert: `Repo.insert(%HabitsOne.User{ name: name, email: "#{name}@yahoo.com", password_hash: "hehe" })`
- Link to path: `<%= link "All Users", to: user_path(@conn, :index) %>`
- `$ mix phx.routes`: `$ rake routes`
- Chapter 3: There's an error in `def changeset(model, params \ :empty)`, you need to change `:empty` to `:invalid`
[Reference](https://forums.pragprog.com/forums/393/topics/15368)
- So smart: Changesets
