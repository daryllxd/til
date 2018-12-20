---
layout: post
title:  "TIL, 2018-12-17, Immutability in Ruby"
date:   2018-12-17 04:46:28 +0800
categories: programming
summary: "Reading the `inch` and `deep_freeze` gems."
---

# Musings

- [`inch`](https://github.com/rrrene/inch) on recommendations for documentation. It also has CI.
- [`deep_freeze`](https://github.com/dkubb/ice_nine) freezes Ruby objects - good to look at the code on how it does that.
- Almost every gem has config commands and parsers for those config commands. Really cool to think about.

# A Review Of Immutability In Ruby
[Reference](https://www.rubypigeon.com/posts/a-review-of-immutability-in-ruby/)

- When two or more objects use the same piece of mutable data, they all have the ability to break each other in ways that can be hard to debug.
- Standard lib's `freeze`: prevents further modifications to `obj`. A `RuntimeError` will be raised if modification is attempted.
- This will work on all objects except `BasicObject`.
- Reassigning a constant variable will generate a warning, but mutating a constant value will not. You have to actually freeze the constant. Problem is, it's shallow, so the existing elements can actually still change.
- String literals are also immutable, just like numbers and symbols.
- Recursively freezing an object property?
- `values` gem
