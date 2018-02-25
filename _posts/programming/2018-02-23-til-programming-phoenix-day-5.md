---
layout: post
title:  "TIL, 2018-02-23, Mechanics/Koans"
date:   2018-02-23 15:34:53 +0800
categories: programming
summary: "Tinkering around app config, Elixir Koans, ElixirCasts Guards/Gravatar."
---

## Musings

- Tried tinkering around accessing app config. `Application.get_env` is different in Phoenix than from Elixir.
  - `Application.get_env(:my, My.Endpoint)[:title]` [Reference](https://stackoverflow.com/questions/35725536/how-to-read-config-variable-in-phoenix-elixir)
- When you edit something in `config/config.exs`, the server asks you to restart. It's not like that in Rails, which causes "???" confusion.
- Pattern matching: [Reference](https://elixir-lang.org/getting-started/pattern-matching.html) [Reference](https://revelry.co/pattern-matching-elixir/) [Reference](https://elixirschool.com/en/lessons/basics/pattern-matching/)
  - Underscore if you don't care about a part.
  - You can't have a function on the left side.
- alias multiple: `alias Teacher.{Repo, Post}`

``` elixir
iex> x = 1
iex> ^x = 2 to attempt a match instead of a reassignment? # Pin operator

iex> { x, x } = { 1, 1 }
iex> { x, x } = { 1, 2 } # All references should bind to the same pattern.

# Match on starts_with

def greet("Ben" <> _) do
 IO.puts("Hello, Ben")
end

# Lists

def greet(["Ben" <> _, _last_name]) do
 IO.puts("Hello, Ben")
end

# Head/Tail

def greet([name | _]) do
 IO.puts("Hello, #{name}")
end

# Tuples

def greet({"Ben" <> _, _last_name}) do
 IO.puts("Hello, Ben")
end

# Maps. As long has map has k/v, this will work

def greet(%{first_name: name}) do
 IO.puts("Hello, #{name}")
end
```

## Elixir Koans, 1-6.

- `"hello" <> "world"` to concatenate.
- `String.contains?("Hello", "He")`, `trim`, `duplicate`, `upcase`, `reverse`.
- `Integer.digits/1`: splits to list. `Integer.to_string`
- `Integer.parse("5 years") == {5, " years"}`                                  # the un-parseable part is also returned.
- `Integer.parse("1.2") == {1, ".2"}`                                          # note first return in tuple is int, second is string
- `Float.ceil\2` # second argument decimal places to round
- `Float.floor`
- `Range.new(1, 10)`
- `Range.range?(1..10)` # true
- `true`, `false`, and `nil` are atoms. `:true` == `true`
- Tuple: `tuple_size`, `elem`, `insert_at`,  `append`, `delete_at`, `to_list`.
- List: `[a] ++ [b], [a, b] -- [a]`, `List.wrap("value") => ["value"]`.

## ElixirCasts, Guards
[Reference](https://elixircasts.io/elixir-guards)

- Guards: does a type check on the function argument (not all expressions are allowed, and it's this way because they don't want anything bad to happens while executing guards/no mutations happen anywhere).
- `iex> r(Shirt)` to reload in memory.

``` elixir

def greet(name) when is_binary(name) do
 IO.puts("Hello, #{name}")
end

---

defmodule SizeTranslator do
  defguard is_small(size)  when size == 1 or size == "s" or size == "S"
end

defmodule Shirt do
  import SizeTranslator

  def colors_for(size) when is_small(size) do
    # Colors for small size
  end
end
```

## ElixirCasts, Gravatar with Phoenix
[Reference](https://elixircasts.io/gravatar-with-phoenix)

``` elixir
def gravatar(email)
  email
  |> String.trim()
  |> String.downcase()
  |> :erlang.md5() # Use erlang in Elixir
  |> Base.encode16(case: :lower)

  img = "https://www.gravatar.com/avatar/#{hash}?s=150&d=identicon"
  img_tag(img)
end
```

