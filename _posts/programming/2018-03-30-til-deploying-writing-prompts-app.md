---
layout: post
title:  "TIL, 2018-03-30, deploying Writing Prompts app."
date:   2018-03-30 17:32:19 +0800
categories: programming
summary: "Practical react-router, deploying create-react-app, Redis lists."
---

## Musings, Dev env:

- Vim: `zm` to open cold fold, `zr` to close.
- [Only add the files that were added before (useful for re-adding files after Rubocop does its thing.)](https://stackoverflow.com/questions/39477305/how-to-readd-added-files-update-staged-files-only-in-git)

``` bash
function gada {
  git diff --name-only --cached | xargs git add
}
```

## Musings, React

- React router tutorial:
  - The router is split between `react-router-dom` and `react-router-native`.
  - The router doesn't care if the URL is correct, it just changes the URL.
- Deploying via [react-github-pages.](https://github.com/gitname/react-gh-pages)
- [Issue with CNAME.](https://github.com/facebook/create-react-app/issues/654)
- Chat with Aaron : `next.js` is a thing?

## Musings, Ruby

- I like this, though if this was Elixir, it would just be a pattern match.
- A `proc { self }` to return everything re: Enumerable.

``` ruby
def duration_for(tag_name = nil)
  block = if tag_name
            proc { select { |p| p.contains_tag?(tag_name) } }
          else
            proc { self }
          end

  block
    .call
    .sum(&:duration)
end
```

- Anonymous functions in Ruby!
- [`Integer.instance_methods(false)` to just show the methods defined in `Integer`.](https://www.ruby-forum.com/topic/193625)
