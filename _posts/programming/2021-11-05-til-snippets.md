---
layout: post
title:  "TIL, 2021-11-05-some-small-snippets"
date:   2021-11-05 20:45:04 +0800
categories: programming
summary: "Some small snippets"
---

## Coding

- Jest module name mapper?
- List of files that were changed: `git diff --names-only`.
- Don't include files that were deleted: `--diff-filter=d`.
- `git whatchanged`
- `git show --stat <commit-hash>` - shows name and changes number of lines.
- `git diff-tree --no-commit-id --name-only -r commit-hash` - plumbing command.
- Bash stuff
  - Check if bash variable is empty/return if bash variable is unset of the empty string: `if [ -z "$var" ];`
  - `[ -z "$var" ] && echo "Empty"`
- Filter git diff based on file extensions - [Reference](How to filter git diff based on file extensions?)
  - `git diff master --name-only --relative -- "**/*.ts" "**/*.tsx" "**/*.js" "**/*.jsx" "**/*.vue"`

```
prettier_files_changed="$(git diff --diff-filter=d --name-only --cached -- '***.html' '***.ts' '***.scss')"

if [[ ! -z $prettier_files_changed ]]
then
  echo "🎨 Organising imports, running prettier"
  npx lint-staged
fi
```

- `tsc` CLI options - [Reference](https://www.typescriptlang.org/docs/handbook/compiler-options.html#compiler-options)
- Elegant pipes solution: [Reference](https://medium.com/emoteev-blog/call-functions-in-angular-templates-the-good-way-f025f65b0e55)

## Angular 13 is now Available
[Reference](https://blog.angular.io/angular-v13-is-now-available-cce66f7bc296)

- Potential icon component optimisations - [Reference](https://material.angular.io/components/icon/api)
