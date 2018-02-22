---
layout: post
title:  "TIL, 2018-02-21, Programming Phoenix Day 3."
date:   2018-02-21 18:53:30 +0800
categories: programming
summary: "Changesets, CRUD using forms, Installing my first package, Vim digraphs, Ruby ri."
---

## Musings

- Ruby help [Reference](https://www.jstorimer.com/blogs/workingwithcode/7766081-5-reasons-you-should-use-ri-to-read-ruby-documentation) [Reference](http://samuelmullen.com/2012/01/up-and-running-with-ruby-interactive-ri/)
  - Within irb, `help String`.
  - In the shell, `$ ri String`.
  - `gem rdoc --all --ri --no-rdoc` to generate documentation.
  - `$ri ActiveRecord::Base`.
  - `$ ri -i`: Interactive gem.
  - `pry-doc`, then `show-doc`, or in Pry, you can do `> ri String` to get the documentation without Internet.
- On why JS is called JavaScript: [Reference](https://stackoverflow.com/questions/2018731/why-is-javascript-called-javascript-since-it-has-nothing-to-do-with-java)
  - Mocha, then LiveScript, then it became JavaScript when Netscape/Sun got together. It's like a licensing deal that can complement Java.
- Looked into Netlify, it seems nice re: static sites, I'll look into it.
- Vim digraphs:
  - Ctrl+K in insert mode. <- ← , -> →, -! ↑, -v ↓.
- Looking through gems:
  - `isolator`: This looks good, I'll test drive it out in daryllxd.
  - `uniform_notifier`: customized logger!
- Looked into ActiveRecord/ActiveModel attributes.
- Git extras. [Reference](https://github.com/visionmedia/git-extras) TJ Holowaychuk is such a baller.
- Watched some RubyTapas videos:
  - 42: Streaming. I did not know about Enumerable each inside of a block. [Reference](https://www.youtube.com/watch?v=_H4uLaSjWrk)
  - 45: Default values. I sort of know about this. [Reference](https://www.youtube.com/watch?v=dWPNVCzP-R4)
  - 52: The end of mocking. Do not mock stuff in an adapter. I completely agree. [Reference](https://www.youtube.com/watch?v=9nzXcFVPeI8)
- Elixir static code analysis: Credo. [Reference](https://github.com/rrrene/credo)
- Elixir casts: Plugs. [Reference](https://elixircasts.io/intro-to-function-plugs)
- Elixir packages: Awesome Elixir. [Reference](https://elixir.libhunt.com/)

## On installing a package: I can't take HTML anymore! Lol

- `$ mix deps.get`.
- "Gemfile" is in `mix.exs.`
- I installed `phoenix-slime` [Reference](https://github.com/slime-lang/phoenix_slime). Turns out I have to explicitly set the versions, which is cool!

``` elixir
# This is what the Gemfile looks like
defp deps do
  [
    {:phoenix, "~> 1.3.0-rc"},
    {:phoenix_pubsub, "~> 1.0"},
    {:phoenix_ecto, "~> 3.2"},
    {:postgrex, ">= 0.0.0"},
    {:phoenix_html, "~> 2.10"},
    {:phoenix_live_reload, "~> 1.0", only: :dev},
    {:phoenix_slime, "~> 0.9.0"},
    {:gettext, "~> 0.11"},
    {:cowboy, "~> 1.0"}
  ]
end
```

## Programming Phoenix

### Forms

``` ruby
defmodule User do
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 1, max: 20)
  end
end
```

- Accept a User struct/parameters.
- Tell Ecto that `name` and `username` are required. `cast`
- No optional fields.
- Pipe `cast` to `validate_length`.
- In Rails, validations are directly in the schema. Why not in Elixir?
  - Different contexts of updating. Ex: Log in via Facebook.
  - Decouple update policy from the schema, because one size fits all does not fit in this context.
- Helper function `form_for` takes care of security, UTF-8 encoding.
- This is how a basic `new` form is supposed to look like:

``` slim
h1 New User
= if @changeset.action do
  .alert.alert-danger
    p Oopsies

= form_for @changeset, user_path(@conn, :create), fn f ->
  .form-group
    = text_input f, :name, placeholder: "Name", class: "form-control"
    = error_tag f, :name
  .form-group
    = text_input f, :email, placeholder: "Email", class: "form-control"
    = error_tag f, :email
  .form-group
    = password_input f, :password, placeholder: "Password", class: "form-control"
    = error_tag f, :password
  = submit "Create User", class: "btn btn-primary"
```
