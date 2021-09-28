---
layout: post
title:  "TIL, 2021-09-27 - Pipes, Interfaces, `ApplicationRef`"
date:   2021-09-27 13:10:52 +0800
categories: programming
summary: "Creating 2 Pipes, delegate?"
---

- Interfaces: There is no easy way to unit test an interface or if an object implements an interface cleanly. [Reference](https://stackoverflow.com/questions/49907035/how-to-unit-test-model-interfaces-in-typescript)
  - Interfaces only exist at compile-time. They don't exist at runtime.
- `console.log(Object.getOwnPropertyNames(Pipe.prototype));` => This will show all the methods of a class. [Reference](https://stackoverflow.com/a/31055009/848915)
- Dynamically access methods of a class: [Reference](https://stackoverflow.com/questions/38100029/dynamically-access-methods-of-class-typescript)

- You can't push error message

```
  You can't push to git://github.com/daryllxd/dotfiles.git
  Use https://github.com/daryllxd/dotfiles.git

url = git@github.com:daryllxd/dotfiles.git => url = git@github.com:daryllxd/dotfiles.git
```

- Can call a method post-pipe transform lol.
- `keyvalue` pipe?
- `dayjs` has to match the right `name`.
- `ApplicationRef` - used to trigger change detection in a Service.
