---
layout: post
title:  "TIL, 2022-07-09, Git push to certain commits"
date:   2022-07-09 09:14:18 +0800
categories: programming
summary: "Yeah"
---

- Git push up to a certain commit [Reference](https://coderwall.com/p/hexinq/git-push-up-to-a-certain-commit)
  - `git push origin COMMIT_HASH:BRANCH_NAME` if the branch exists already.
  - `git push origin COMMIT_HASH:refs/heads/BRANCH_NAME` if the branch doesn't exist yet.
- Git diff `diff-filter AMC`.
