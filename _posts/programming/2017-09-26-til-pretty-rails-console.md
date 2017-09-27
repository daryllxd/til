---
layout: post
title:  "TIL, 2017-09-26, Pretty Rails console"
date:   2017-09-26 16:40:07 +0800
categories: programming
---

- [Reference](https://stackoverflow.com/questions/1224525/how-to-get-nice-formatting-in-the-rails-console) `y ProductColor.all` to get YAML output.
- You can also do the `Object.last.attributes.to_yaml`.
- `j ProductColor.all.inspect` to output in JSON format.
- `|=` is different from `||=`.
- `bundle exec rake log:clear` to delete logs.
- Always do `match_array` when checking arrays.
- Ruby `File.ctime`: change time for that specific file. `atime`: last access time. `mtime`: modification time.
- `AppSignal` is just $19 a month after a 30 day free trial.
