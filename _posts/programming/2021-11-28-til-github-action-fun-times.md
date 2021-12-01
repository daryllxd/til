---
layout: post
title:  "TIL, 2021-11-28, Github actions fun times"
date:   2021-11-28 18:48:35 +0800
categories: programming
summary: "Github actions fun times"
---

## Github actions

- Literally just done with creating a YAML file `.github/workflows/ANY_NAME.yml`.
- Events: [Reference](https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows#webhook-events)
- Things to think about:
  - Cache `npm install`.
  - No way for us to easily access private repos unless we use a PAT/personal access token. [Reference](https://github.community/t/github-token-cannot-access-private-packages/16621/31) [Reference](https://github.com/actions/setup-node/issues/49)
  - Much of this is syntax. Some usages: [Reference](https://github.com/search?q=actions%2Fsetup-node&type=code)
  - Persist credentials? [Reference](https://stackoverflow.com/questions/62407913/how-to-install-npm-pckage-from-private-git-repoistory-using-a-token-in-github-ac)
- Workflow: [Reference](https://betterprogramming.pub/save-time-in-daily-code-review-using-danger-336654fe0d24)

```
name: Run dangefile
on: [push]
jobs:
  danger:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v1
        with:
          registry-url: 'https://npm.pkg.github.com'
      - run: npm install yarn
        env:
          NODE_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      - run: DANGER_TEST_PR='2743' npm run danger ci
        env:
          DANGER_FAKE_CI: YEP
          DANGER_TEST_REPO: kaligo/e2e-rewards-dashboard
          DANGER_GITHUB_API_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
