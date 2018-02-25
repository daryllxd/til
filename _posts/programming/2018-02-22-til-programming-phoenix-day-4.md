---
layout: post
title:  "TIL, 2018-02-22, Phrug Meetup"
date:   2018-02-22 08:33:49 +0800
categories: programming
summary: "Ruby Meetup, Reading Programming Elixir/Concurrency."
---

## Musings

- I've been thinking about teaching programming lately. To be honest, I prefer teaching another programmer how to learn Rails, as opposed to from scratch because of mechanical things. It's really difficult for me to navigate around using Windows.
- Reflecting on how I'm learning Elixir and how you compare it to learn.
- Ruby meetup: GraphQL, websockets via Phoenix, shipping a product.

## Programming Elixir

- `$ mix deps`: List all dependencies/tasks.
- Mixfile:
  - `aliases` part: shortcuts for things you combine with each other.
- Processes chapter. I'm reading it for appreciation, but not sure how to use it yet.
  - I'm guessing you can fork the processes like background jobs?
  - Or do things like split database retrieval/make them parallel, not sequential?
  - Linking two processes: `spawn_link`.
  - Monitoring a process: `spawn_monitor`.

### Parallel Map

- Awesome but I don't really understand it that much. Will implement this in the future!

``` elixir
defmodule Parallel do
  def pmap(collection, fun) do
    me = self

    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, { self, fun.(elem) }) end
      end)
    |> Enum.amp(fn (pid) ->
        receive do { ^ pid, result } -> result end
      end
    end
  end
end

iex> c("pmap.exs")
[Parallel]
iex> Parallel.pmap 1..10, &(&1 * &1) # Multiple first argument by itself?
[1, 4, 9...]
```
