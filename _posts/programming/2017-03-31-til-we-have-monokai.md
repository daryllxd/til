---
layout: post
title:  "TIL, 2017-03-31, We Have Monokai"
date:   2017-03-31 04:43:04 +0800
categories: programming
summary: "Where it took longer to change the color of the damn links than to make this blog post."
---

- http://craftingruby.com/posts/2015/06/29/query-objects-through-scopes.html
- Delegate call to new instance of the object
- http://batsov.com/articles/2014/02/17/the-elements-of-style-in-ruby-number-13-length-vs-size-vs-count/
- `Array.fill` is destructive (why not just have `Array.fill!` again?).
- `Array.take` returns an empty array if the array is empty. `Array.first` returns nil if the array is empty. [Reference](http://stackoverflow.com/questions/16555206/arrays-in-ruby-take-vs-limit-vs-first)
- I think I can use `Array.transpose`, `Array.sample`, and `Array.permutation`. (I must have reimplemented them at some point when I could just have looked at the source.) [Reference](http://callahan.io/blog/2014/07/17/five-useful-ruby-array-methods/)
- Breaking up longs strings to multiple lines. [Reference](http://stackoverflow.com/questions/10522414/breaking-up-long-strings-on-multiple-lines-in-ruby-without-stripping-newlines)

``` ruby
string = "line #1"\
         "line #2"\
         "line #3"

p string # => "line #1line #2line #3"
```

- Just to clarify: `a ||= b means a = b when a == false (falsey).`
- `Nokogiri` apparently needs other things like `libxml2`.
- To remove the 'You have activated rake 0.9.0, but your Gemfile requires rake 0.8.7' types of errors, you have to coerce the Gemfile version to the version that all of the gems want. [Reference](http://stackoverflow.com/questions/6080040/you-have-already-activated-rake-0-9-0-but-your-gemfile-requires-rake-0-8-7)
- Meta TIL: To add rouge actual CSS to this freaking blog, I followed the instructions [here](https://github.com/jneen/rouge/issues/343). We have Monokai now!
- Another meta TIL: You can't add plugins to Github pages. I'm seriously thinking about just building the page first then pushing after. But then again I won't be able to have a blog for a few days so yeah.


