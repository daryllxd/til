---
layout: post
title:  "TIL, 2018-12-07, Homebrew and Going"
date:   2018-12-07 16:37:18 +0800
categories: programming
summary: "Going home"
---

# Reading Homebrew Source

- `brew update --force` to well, force the update. Lol.
- [Quiet `cd`](https://github.com/Homebrew/brew/blob/master/bin/brew#L10): `cd "$@" >/dev/null || return`. This basically outputs the
- Shell: `if, else, fi` to end.
- [`source`](https://superuser.com/questions/46139/what-does-source-do)
  - `source FILE` loads a file and executes whatever was inside it. Only works for shell, not for stuff with Ruby inside.
  - `> type source` to figure out what it does. When a command is a shell builtin, do `man bash`.
- [`df`](https://en.wikipedia.org/wiki/Df_(Unix)) is the Unix command used to display the amount of available disk space for file systems on which the invoking user has appropriate read access.
- [`du`] is DISK USAGE.

# Starting with Go

- Installing: Don't do homebrew, just download the package online.
- `go run ./FILE.go`
- `go get -u github.com/derekparker/delve/cmd/dlv`
