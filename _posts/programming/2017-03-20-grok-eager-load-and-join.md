---
layout: post
title:  "TIL, 2017-03-20, Grok eager_load and join"
date:   2017-03-20 08:21:19 +0800
categories: programming
---

- Ruby Heredoc syntax: `<<-HEREDOC stuff HEREDOC`.
- Squiggly Heredoc (to remove leading whitespace): `<~HEREDOC`.
- Postgres has a `levenshtein` distance command.
- More practice on query builders. `sanitize_sql_array`.
- AR `eager_load` vs. `joins`. If I understand it correctly, `eager_load` create temp tables, while `joins` actually does an `INNER JOIN`.
- Tmux: Loading a Tmux window won't terminate the processes running outside at the time the Tmux window started.
- Value object: Always include the damn id!
- Adapter patterns work, be ruthless in trying to be as DRY as possible.
- Functional core, imperative shell, then adapter all AR stuff into the functional core app.
