---
layout: post
title:  "TIL, 2021-11-21"
date:   2021-11-21 22:15:41 +0800
categories: programming
summary: "Where trying to merge to develop via Tmux in one command"
---

## Hacking away at Trying to Merge to develop via Tmux in one command

- Nice to have 2 copies of local RD, 1 is where I code, and 1 is where I merge to develop.
- Double quote when assigning variable.
- Variable assignment in bash = must not have spaces in the middle WUTFACE.
- Tmux reference [Reference](http://man.openbsd.org/OpenBSD-current/man1/tmux.1). Much better than actual `man` as now it's searchable.
- Tmux `new-window` command.
- `merge --no-edit` to not show the commit message when doing a `git-merge`.
- `tmux send-keys` really has access to other parts of the shell script.
- `git push --dry-run` to do everything except pushing it.

```
#!/usr/bin/env sh

if [ $1 ]; then
  branch_to_merge=$1
else
  branch_to_merge="$(git symbolic-ref --short HEAD)"
fi

window="merging-${branch_to_merge}"

tmux new-window -n $window -d
tmux send-keys -t $window 'echo hello' C-m
tmux send-keys -t $window 'cd ~/Documents/rails_projects/e2e-rewards-dashboard-clone' C-m

tmux send-keys -t $window "git fetch" C-m
tmux send-keys -t $window "git checkout $branch_to_merge" C-m
tmux send-keys -t $window 'git checkout develop' C-m
tmux send-keys -t $window "git merge $branch_to_merge --no-edit" C-m
tmux send-keys -t $window "git push" C-m
tmux send-keys -t $window "say Merged ${branch_to_merge}" C-m
tmux send-keys -t $window "exit" C-m
```
