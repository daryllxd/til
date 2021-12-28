---
layout: post
title:  "TIL, 2021-12-25, Component vs Module"
date:   2021-12-25 16:15:28 +0800
categories: programming
summary: "Component vs Module"
---

# Ultimate Vim TypeScript Setup
[Reference](https://medium.com/swlh/ultimate-vim-typescript-setup-35b5ac5c8c4e)

- `vim-graphql`
- `coc.nvim` - Conquer of Completion.`Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }`

# What's the difference between an Angular component and module
[Reference](https://stackoverflow.com/questions/40073941/whats-the-difference-between-an-angular-component-and-module)

- Module is a big container containing one or many small containers called `Component`, `Service`, and `Pipe`.
  - HTML template, code, service (reusable code shared by components so that rewriting of code is not required).
  - Pipe - takes in data as input and transforms it to the desired output.
- Component is the template (view) + a class containing some logic for the view + metadata (to tell Angular from what data it needs to display the template).
- Modules do not control any HTML. Modules declare which components can be used by components belonging to other modules, which classes will be injected by their DI, and which component gets bootstrapped.
