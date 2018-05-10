---
layout: post
title:  "TIL, 2018-05-09, Think about Higher-Ordered Components in React"
date:   2018-05-09 19:33:10 +0800
categories: programming
summary: "Absolute import paths, watching Ruby tapas on Youtube, `react-boilerplate`?"
---

# Musings JS

- [ReactCasts Episode 1: Higher Order Components.](https://www.youtube.com/watch?v=LTunyI2Oyzw) Higher order components in React Casts
- [Cheat sheet for Axios.](https://kapeli.com/cheat_sheets/Axios.docset/Contents/Resources/Documents/index)
- [Absolute import path for `create-react-app`](https://medium.com/@ktruong008/absolute-imports-with-create-react-app-4338fbca7e3d)
- Folder structure solution: [`react-boilerplate`](https://github.com/react-boilerplate/react-boilerplate)

``` js
// package.json

"scripts": {
  "start": "NODE_PATH=src/ react-scripts start",
  "build": "NODE_PATH=src/ react-scripts build",
  "test": "NODE_PATH=src/ react-scripts test — env=jsdom",
  "eject": "NODE_PATH=src/ react-scripts eject"
}
```

# Musings, Ruby

- RubyTapas 38: Caller-Specified Fallback Handler. Punt an error like this:

``` ruby
def get_temp(query, &fallback)
  begin
    fallback ||= DEFAULT_FALLBACK # There is a default proc that executes if something goes wrong, but the client has the option to create their own error handler
    # Do things that can lead to an error ...
  rescue => error
    fallback.call(error)
  end
end
```

- RubyTapas 160: Reduce Redux.
  - Reduce to do a `deep_fetch`?
  - Checksum using Binary XOR.
- RubyTapas 159: Using Set.
  - Union operator (`avdi_list | stacey_list`).
  - Intersection (`avdi & stacey`).
  - Difference/complement between 2 lists: (`avdi - stacey`).
  - Pipe equals operator: Preserves uniqueness. `avdi_list |= ['granola']` to add to the union.
- RubyTapas 158: Constant Lookup Scope.
  - `Planets::Jupiter` is different from `module Planets; module Jupiter; end; end`. The lookup chain is based on the lexical scope of the code, not the current module.
  - No reason to use the shorthand form of module declaration. Declare them explicitly.
