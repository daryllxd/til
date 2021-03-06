---
layout: post
title:  "TIL, 2018-02-24, Ecto and Plugs"
date:   2018-02-24 10:26:49 +0800
categories: programming
summary: "Phoenix Authentication, Changeset composition, IEx History."
---

## Musings

- ***Time-saver:*** To save shit in `iex>`, you still need to `alias HabitsOne.Repo`, then save things like `Repo.insert(changeset)`.

- Immutability in Javascript: The copying part/massive cloning.
- Erlang shell: `erl`.  Get Erlang versin: `erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell` [Reference](https://stackoverflow.com/questions/9560815/how-to-get-erlangs-release-version-number-from-a-shell)
- Wow composition of changesets are really cool.
- Then you can separate the validation from the saving.
- Method names for variable: doesn't exist. [Reference](https://elixirforum.com/t/how-to-get-a-list-of-available-methods-for-my-variable/11937/2)
  - `String.module_info(:exports)`.
  - `iex> i hello` => inspect?
  - `iex> exports Ecto.Changeset`, readable format.
  - `iex> h Ecto.changeset` to browse documentation without exiting the terminal.
- IEx History: [Reference](https://til.hashrocket.com/posts/is9yfvhdnp-enable-history-in-iex-through-erlang-otp-20-)
- `Keyword`:
  - A set of functions for working with keywords.

## Programming Phoenix, Studying Ecto

- Sample debugging when trying to insert things

``` elixir
def registration_changeset(model, params) do
  aw = model
        # creates an Ecto.Changeset instance from the model, blank changes
        |> changeset(params)
        # cast: applies the given params as changes for the data according to the given set of keys.
        |> cast(params, ~w(password), [])
        # applies a required validator. if no password, still pass through the function but add an error to the changeset
        |> validate_required(:password)
        # applies a length validator
        |> validate_length(:password, min: 6, max: 100)
        # calling another function which can transform the changeset (change attributes, add an error) or not
        |> put_pass_hash()

  require IEx; IEx.pry
  # Because of immutability, you need to have an assignment to the "changed model". You can't just do `model` here because you get the untouched model.
  # This is actually cool because you can then do things step by step as long as you assign and re-assign.
  # At this point, you can call `Repo.insert(aw)`

  aw # Still have to return the changed model or inserted model
end
```

- Pattern match to get the `user_params` from the inbound form.
- Create a registration changeset, and if it's valid, we insert it and present the result to the user.
- If not, render the same thing, with the changeset.
- Controller is separate from change policies in the model layer.
- Model layer has no side effects. (Repo takes care of inserting).
- Changeset = data structure that tracks changes and their validity.

## Programming Phoenix, Plugs

- Module plugs: a module that provides 2 functions. `plug Plug.Logger`.
- Function plugs: single function. `plug :protect_from_forgery`.
