---
layout: post
title:  "TIL, 2019-09-11, Sass, One vs Two-Way Binds"
date:   2019-09-11 10:12:42 +0800
categories: programming
summary: "Sass is a language?"
---

# Mini tidbits

- Angular `HttpParams` returns a new `HttpParams` each time. Also things are different when you `append` and you `set`.
- Can create mock `ng-select` to make things really easier for testing. Hard to implement testing an event emitter up.
- Jest - `DebugElement.componentInstance` to get the input values for the inner component.
- Docker - can be installed from the website itself.
- Combine two AR:Relations: Uh, don't bother lol.

# Advanced Sass list functions
[Reference](https://hugogiraudel.com/2013/08/08/advanced-sass-list-functions/)

- Selecting values from a list

```
$list: a, b, c, d, e, f;
$first: first($list); // a
$last: last($list); // f
```

- Adding values to a list: `prepend()` and `append()`.

```
$list: b, c, d, e, f;
$new-list: prepend($list, a); // a, b, c, d, e, f
$new-list: prepend(
  $list,
  now i know my a
); // now, i, know, my, a, b, c, d, e, f
```

- Feature to merge two lists: `join()`.

# Managing dynamic z-index in component-based UI architecture
[Reference](https://www.huy.dev/z-index-management-2019-04/)

- z-index only takes effect siblings within the same stacking context. The implication is that if you are working on the area A, ***you must ensure that all sibling elements (B and C) that might visually intersect with A be included in the same stacking context.*** This requires all sibling elements be relatively positioned and have their own z-index value.
- Regardless of how large the z-index value of A's tooltip is, if the `z-index` of A is less than that of B, A's tooltip will be obstructed by B or B's descendants.

# Sass Maps
[Reference](https://sass-lang.com/documentation/values/maps)

- Maps in Sass hold pairs of keys and values, and make it easy to look up a value by its corresponding key.
- Keys must be unique, values can be duplicated.
- Use quotes for map keys, because some values may look like unquoted strings, but actually be other types.
- Look up a value:

```
$font-weights: ("regular": 400, "medium": 500, "bold": 700);

@debug map-get($font-weights, "medium"); // 500
@debug map-get($font-weights, "extra-bold"); // null
```

- Adding to a map: `map-merge`.

```
$light-weights: ("lightest": 100, "light": 300);
$heavy-weights: ("medium": 500, "bold": 700);

@debug map-merge($light-weights, $heavy-weights);
// (
//   "lightest": 100,
//   "light": 300,
//   "medium": 500,
//   "bold": 700
// )
```

- You can also use this with an inline map to add a single key/value pair.
- `@debug map-merge($font-weights, ("extra-bold": 900));`
- If both maps have the same keys, the second map's values are returned in the map that gets returned.
- Maps in Sass are immutable.

# Sass @function

```
@function pow($base, $exponent) {
  $result: 1;
  @for $_ from 1 through $exponent {
    $result: $result * $base;
  }
  @return $result;
}

.sidebar {
  float: left;
  margin-left: pow(4, 3) * 1px;
}
```

- Function names treat hyphens and underscores as identical.
- It's suggested to use mixins for side-effects, and use functions just to compute values.
- Sass has: keyword arguments, optional arguments, arbitrary arguments, arbitrary keyword arguments.

# One-way and Two-way Data Binding in Angular
[Reference](https://blog.thoughtram.io/angular/2016/10/13/two-way-data-binding-in-angular-2.html)

- Quick way to two-way bind:

```
<input [value]="username" (input)="username = $event.target.value">
<p>Hello {{username}}!</p>
```

- `(input)="expression"`: Binds the expression to the input element's `input` event.
- `username= $event.target.value`: The expression that gets executed when the `input` event is fired.
- `[value]="username"`: Binds the expression `username` to the input element's `value` property.
- What `ngModel` really looks like, but without using the shorthand syntax:

```
<input [ngModel]="username" (ngModelChange)="username = $event">
<p>Hello {{username}}!</p>
```

- Handler expression uses `$event`, because `ngModelChange` takes care of extracting the `target.value` from the inner `$event` payload, and simply emits that.

# Component events with `EventEmitter` and @Output in Angular
[Reference](https://ultimatecourses.com/blog/component-events-event-emitter-output-angular-2)
