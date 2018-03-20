---
layout: post
title:  "TIL, 2018-03-19, CRUD Relationships in Ecto, React Router."
date:   2018-03-19 16:08:58 +0800
categories: programming
summary: "Ecto, pagination via `scrinever`, markdown parsing via `Earmark`, React router and stateless functional components."
---

## Musings, Elixir

- [`IO.inspect` to debug pipelines](http://minhajuddin.com/2016/05/20/elixir-io-inspect-to-debug-pipelines/)

``` elixir
:crypto.strong_rand_bytes(32)
  |> IO.inspect
  |> :base64.encode_to_string
```

- [`Repo.aggregate(Post, :count, :id)`](https://stackoverflow.com/questions/36683238/count-the-number-of-entries-in-an-ecto-repository?rq=1) to get count in an Ecto repository.
- Pagination via scrivener: doable in 15 minutes! It's separated into [Ecto](https://github.com/drewolson/scrivener_ecto) and [HTML](https://github.com/mgwidmann/scrivener_html)
- [Parsing markdown with Earmark](https://elixircasts.io/parsing-markdown-in-elixir-with-earmark)I
- Think through how I'd structure like "Days" in my habits app. I was thinking "Day", and then `"DailyHabit"`.

## Musings, React

- Because React doesn't care about the route, you can change the route and it just has to match? If nothing to match then nothing happens.
- [Destructuring assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
  - `[a, b, ...rest] = [10, 20, 30, 40] => rest becomes [30, 40]`
  - `var foo = ['one', 'two']; var [one, two] = foo; one becomes 'one' and two becomes 'two'`
  - Default values: `var a, b; [a=5, b=7] = [1]`
- `window.location.pathname`
- `Route(...): Nothing was returned from render`: Just check return statements. This isn't Ruby where there is a implicit return boys.
- [Weird syntax in JSX commenting.](http://wesbos.com/react-jsx-comments/)
- [Browser history.](https://developer.mozilla.org/en-US/docs/Web/API/History_API) `history.back()`, `history.forward()`, `window.history.go(-1)`, and `history.pushState()`
- "Does not match the corresponding path on disk": Possibly just wrong file name/casing.
- `children` is a special prop: this is a reference to everything inside that we're turning into a link.
- I now know the difference between functional vs class components.
  - Functional components: Just JS functions. They take in an optional input (props).
  - ES6 (arrow functions) for defining components.
  - `const Hello = ({ name }) => (<div>Hello, {name}!</div>);`
  - Disadvantage: No state. No lifecycle methods.
- Container components vs Presentational components
  - Presentational: Just how the view or how things look. Reusable and should stay decoupled from the behavioral layer.
  - Use functional components first, unless a state is required. If a presentational component requires a state, it should only be concerned with the UI state, and not actual data.
  - Container components
    - Tells the presentational component what should be rendered using props.
- `PureComponent`
  - A component is pure if it is guaranteed to return the same result given the same props and state. Ex: functional component.
  - When the lifecycle method `shouldComponentUpdate` is called, instead of updating a component, it performs a shallow comparison, just the immediate contents are compared.
  - Used for performance.
- Read up on React project structure.
