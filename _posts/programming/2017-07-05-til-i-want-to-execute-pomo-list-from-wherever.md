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

"I sometimes struggle to understand how little I'm accomplishing today with all the bandwidth I can leverage.

- *Discussing:* Usenet mailing lists. You can subscribe to a lot of different newsgroups, without needing to sign up for each of them.
  - Single application with a consistent interface, and topics were widely enforced.
- *Chatting:* IRC (Internet Relay Chat) and mIRC. Other instant messengers appeared, but Pidgin let the users just pick one client with multiple connections.
  - Easy way to get a consistent interface in a single application to chat on IRC, Google Chat, Facebook Chat.
- *Getting notified about updates.* RSS and Atom. Google Reader. "Update Sources", and all updates poured in.

### What Happened

- *Focus is lost.* Everything went around topics. Nowadays, we have people instead of topics. I'd like to hear what a great software architect has to say about software, not about other shits.
- *There are multiple platforms lacking an API.* Slack, Discord, Skype, whatever messenger app is going to be popular tomorrow. No way to integrate Facebook/Twitter into a single app.
- *Can't mark things as read.* You cannot mark a tweet or post as read, it could resurface at any time.

### Where we want to go

- *Topics.* We won't discuss about so many totally unrelated fields.
- *APIs.* Need a common API for Instant Messaging and forum-like software, so that people can use their favorite tools to organize their data sources.


