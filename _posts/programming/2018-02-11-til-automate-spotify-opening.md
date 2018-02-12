---
layout: post
title:  "TIL, 2018-02-11, Automate Spotify Opening"
date:   2018-02-11 19:22:10 +0800
categories: programming
---

## Musings

- Added a script to automate starting Studying/listening to Study music. What's the fastest way to do that? Shell script alias into some Applescript I saw on StackOverflow. Hackish but it works XD

``` shell
alias study='open -a Spotify; spotify play uri spotify:user:12138319146:playlist:1QgeLNN0GpwUfb3FjYyTai; itermFront'

function itermFront {
  osascript -e 'tell application "System Events" to tell process "iTerm2"' \
            -e 'set frontmost to true' \
            -e 'end tell'
}
```

- I just checked out Sitepoint and there was a peer review thing going on. I love it.

## Cramming a React App/Bootstrap

### Steps/Gotchas

- `create-react-app hikelords`
- `yarn add jquery` `yarn add popper.js` `yarn add bootstrap`
- `import 'bootstrap/dist/css/bootstrap.min.css';` in the `App.js` file, not the CSS file?
- Apparently React JSX syntax is particular re: closing tag on `img` (`<img src="hehe.jpg" />

### References

- Popper [Reference](https://popper.js.org/): Used to manage poppers in JS.
- Yarn [Reference](https://www.sitepoint.com/yarn-vs-npm/)
  - Problem with npm: Hard to install, security concerns as npm allows packages to run code on installation.
  - `package.json`: Version numbers aren't always exact. You can have two machines with the same `package.json` file, having different versions of a package installed.
  - `npm shrinkwrap` creates an npm lock file.
  - Yarn installs packages in parallel. NPM, sequential.
  - Cleaner output.
  - `yarn add <something> [-dev]`. Download then add a dependency.
