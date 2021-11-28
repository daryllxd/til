---
layout: post
title:  "TIL, 2021-11-27, Node scripting"
date:   2021-11-27 22:07:39 +0800
categories: programming
summary: "Node scripting"
---

## Hacking around scripts

- Multiple Dangerfile: `yarn danger --help`
- `yarn` vs `npm` - am sorta preferring `yarn` now due to executing.
- How to store env variables in a repo? Should we store env variables in a repo?
- `exec` to run shell commands from `node`.
- `const args = require('yargs').argv` then `args._[0]` to access the argument.
- `require('fs')` to use file system.

- Exit in Node: [Reference](https://stackoverflow.com/questions/5266152/how-to-exit-in-node-js) is `process.exit(1)`.
- `console.log can be in two arguments to add a color.`
- Reading files in Node: [Reference](https://nodejs.dev/learn/reading-files-with-nodejs)
- Environment variables? [Reference](https://itnext.io/how-to-use-environment-variables-in-node-js-cb2ef0e9574a)
  - Can set it manually via `process.env`.
- Appending to a file: [Reference](https://stackoverflow.com/questions/3459476/how-to-append-to-a-file-in-node)

```
const { exec } = require('child_process');
const args = require('yargs').argv;
const fs = require('fs');

const tenant = args._[0];

const getTenants = function () {
  return new Promise((resolve, reject) => {
    exec(
      `ls  ./projects | xargs`,
      (error, stdout, stderr) => {
        console.log('haha');
        resolve(stdout.trim());
      },
    );
  });
};
```
