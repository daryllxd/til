---
layout: post
title:  "TIL, 2018-01-02, Back to Elixir"
date:   2018-01-02 14:42:43 +0800
categories: programming
---

- Shell scripts, you can put the commands into their own lines.
- I'm revisiting
- Ruby contracts: [Reference](http://adit.io/posts/2013-03-04-How-I-Made-My-Ruby-Project-10x-Faster.html#8-seconds)
- Removing "\n": You need to use "\n" not '\n' in your `gsub`. The different quote marks behave differently. [Reference](https://stackoverflow.com/questions/4190797/how-can-i-remove-the-string-n-from-within-a-ruby-string)


## Ruby class vs Elixir module
[Reference](http://rmosolgo.github.io/blog/2016/05/01/ruby-class-meet-elixir-module/)

- Ruby class. Data: instance of the class hold state in instance variables, and behavior: methods on the class alter state.
- Elixir modules. Data: an immutable data structure, and behavior: the module's functions define state transformations, often taking the struct as input.
- Problem: if you change something, and call a method on it, it can break.
  - In Elixir, there is no need to keep track of state because you just create a new object for this.
  - Same with behavior. If you are "modifying something", in Elixir, you are forced to create a new object with that "modified something".

## Erlang/Parallelism?
[Reference](https://stackoverflow.com/questions/1308527/when-does-erlangs-parallelism-overcome-its-weaknesses-in-numeric-computing)

- Erlang is strong in parallelism but not so much in number crunching power.
- The GPU is good at getting loaded up with data and crunching it all at once. Bad when you have to go to disk, network, I/O channel for data.
- If you program requires heavy use of I/O channels, a better machine would be a cluster. Communication and control systems are ideal applications of Erlang because each individual processing task takes little CPU and only occasionally needs to communicate with other processing nodes.
- Erlang makes parallelism easier to work with for developers.
