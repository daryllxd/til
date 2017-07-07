---
layout: post
title:  "TIL, 2017-07-05, I want to execute pomo list from wherever"
date:   2017-07-05 13:25:40 +0800
categories: programming
---

- `_call_function:22: _git-add: function definition file not found`: Just restart that shell session.
- `ln` creates a symbolic link.
- `$:` and `$LOAD_PATH`: Shorthand to the load path array, an array that Ruby uses to look up external files when asked to require one.
- `$LOAD_PATH` is only for `require`, not for `File.open`.
- `ln -s $PWD/bin/p /usr/local/bin # Creates a symlink from the bin PATH to the p found in the bin directory of the current directory`
- `File.readlink`, `File.symlink?`.
- `File::SEPARATOR`.
- Use `delete` instead of `gsub`.
- `cdpath` for zsh.
- To use `rack-mini-profiler` for APIs: hit the endpoint, then hit any random page after. It will show you the amount of time it takes to create that page.
- `rack-mini-profiler` logs: `tmp/miniprofiler`.

