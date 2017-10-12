---
layout: post
title:  "TIL, 2017-10-10 Studying tj/pomo"
date:   2017-10-10 21:35:06 +0800
categories: programming
---

## Studying `tj/pomo`:

- `RbConfig::CONFIG` to see compile time properties of the current Ruby implementation.
- In my Mac, `RbConfig::CONFIG['host_os']` is `darwin15.5.0`.
- `(/mac|darwin/ =~ RbConfig::CONFIG['host_os'])` returns 0, since this is the index where the first match was found. If nothing was found, return `nil`.
- `/usr/bin/sw_vers -productVersion` to see what Mac OS version you have. `sw_vers` works too.
- `terminal_notifier` I think is better than `growl`.
- Creating a YAML file from a variable: `File.open('yamlfile.yml', 'w') do |file| file.write({'haha' => [1, 2, 3] }.to_yaml) end` (the 'w' file)
- Ruby Marshaling: Just a way to serialize and reconstruct a Ruby object.
