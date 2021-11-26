---
layout: post
title:  "TIL, 2021-11-25, Dangerfile"
date:   2021-11-25 14:00:27 +0800
categories: programming
summary: "Dangerfile"
---

## Tutorials:

- [https://danger.systems/js/guides/the_dangerfile.html](https://danger.systems/js/guides/the_dangerfile.html)
- Some use cases - [https://danger.systems/reference.html](https://danger.systems/reference.html)
- [https://medium.com/@ivan.ha/integrate-danger-js-in-5-minutes-55515bc5355d](https://medium.com/@ivan.ha/integrate-danger-js-in-5-minutes-55515bc5355d)

- FAIL = CI will fail

## Theoretically, what can it do?

- Check PR title IF not `WIP` status.
    - Must have Jira ticket
- If got SVG in PR, check if did SVG optimisation
- If got PNG or JPG in PR, check if did Squoosh optimisation
- If package.json is modified, add a "can pls test other browsers"?
- Check if `console.log` is in the PR
- Check if there is a change in translations.json in a non-translations PR
- Can choose to ignore everything if there is a `do not run dangerfile` label.
- Add `[SKIP-RELEASE]` if a PR does not even need to be listed in the Weekly Release.

``` ts
import { danger, message, warn } from 'danger';

const { git, github } = danger;

const RD_LABELS = {
  CI_CONFLICTS: {
    name: 'ci/conflicts',
    color: '#C62828',
    description: 'CI error or merge conflict',
  },
  DEPENDENCIES: {
    name: 'dependencies',
    color: '#ED89F4',
    description: 'Pull requests that update a dependency file',
  },
};

// Check if Ticket starts in the right format

message(
  `Jira ticket: [Ticket number]()`,
);

// Check if dependencies are being updated, and to have quick sanity test for different browsers.

const MODIFIED_FILES = danger.git.modified_files.join('- ');

if (MODIFIED_FILES.includes('package.json')) {
  warn('We changed package.json in this PR. Check other browsers too.');
  github.utils.createOrAddLabel(RD_LABELS.DEPENDENCIES);
}

// If there is no label applied, add WIP label.

if (github.issue.labels.length === 0) {
  message('No label applied. Adding WIP Label.');
  github.utils.createOrAddLabel(RD_LABELS.WIP);
```
