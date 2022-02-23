---
layout: post
title:  "TIL, 2022-02-23, ESLint, Nx"
date:   2022-02-23 09:11:26 +0800
categories: programming
summary: "ESLint, Intro to Nx"
---

# Trying out ESLint

- [Reference](https://github.com/sweepline/eslint-plugin-unused-imports) - automatically fixes unused imports if need.
- [Reference](https://github.com/import-js/eslint-plugin-import) - automatically fixes duplicate imports.
- `ESlint` has plugins and `extends` - have to differentiate between the two.

# Intro to Nx
[Reference](https://nx.dev/getting-started/intro)

 - Using Nx Core Without Plugins: Nx plugins, though very useful for many projects, are completely optional.
 - What does Nx Core provide?
  - Nx understands how your workspace is structured - `nx graph`.
  - Nx knows what is affected (`nx affected`) to know which projects are affected by the current PR.
  - Nx caches and distributes tasks - `nx run-many --target=build --all` will cache the file artifacts and the terminal output, so if you run again, the command will execute instantly because the results will be retrieved from the cache.
  - Using `Nx Cloud` will cache between you, your teammates, and the CI agents.

## Mental Model

- Nx is a VSCode of build tools, with a powerful core, driven by metadata, and extensible through plugins.
- Project graph - reflects the source code in the repository and all the external dependencies.
- Metadata-driven: Everything comes with metadata to enable tooling.

## Nx and Angular

- Angular CLI has some limitations, and Nx addresses them.
  - Nx supports using `angular.json` to configure projects and their targets, but it comes with a few limitations (thousand lines for large workspaces).
  - Splitting `angular.json` into multiple `project.json` files - this means changing the version number in `angular.json` to 2, running `nx format`, and run `nx generate @nrwl/workspace:convert-to-nx-project --all=true`.
- Note that even though the configuration is split, everything works the same way. All migrations and schematics that expect a single `angular.json` file, will receive a single file. Nx is smart, so it merges all the files in memory to make those migrations and schematics work.
- `ng update` and `nx migrate`.

# Five Things You Notice When You Quit the News
[Reference](https://www.raptitude.com/2016/12/five-things-you-notice-when-you-quit-the-news/)

- Feeling better. News exploit our negativity bias. We've evolved to pay more attention to what's scary and infuriating, but that doesn't mean every instance of fear or anger is useful. You notice that an aim of news is to agitate and dismay the viewer.
- You were never actually accomplishing anything by watching the news.
- Most current-events-related conversations are just people talking out of their asses.
- There are better ways to "be informed". Read three books on a topic and you know more about it than 99% of the world.
- "Being concerned" makes us feel like we're doing something, when we're really not.
- Same with sports news.

# The hard things about front-end development
[Reference](https://mailchi.mp/7b8203f03193/the-hard-things-about-front-end-development)

- No control over the environment - supporting different browsers, devices and optimising for bad connection speed is an exclusive burden for people working on UI.
- Tooling - Linters, test runners, bundlers, Typescript.
- No best practices & design patterns. "How to structure a codebase".
- Programming/design - implementations that can be extended and maintained.








# Observables vs Subjects vs Behavior Subjects
[Reference](https://javascript.plainenglish.io/eli5-observables-vs-subjects-vs-behavior-subjects-f2494f14813d)


E
