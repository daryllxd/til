---
layout: post
title:  "TIL, 2019-05-12, Vue, Storybook, Sbin"
date:   2019-05-12 20:56:00 +0800
categories: programming
summary: "Long time since I posted"
---

- [How to Import a Sass File into Every Vue Component in an App](https://css-tricks.com/how-to-import-a-sass-file-into-every-vue-component-in-an-app/)
  - Good design is by nature, successful when it's cohesive.
  - Restart server.
  - No need to underscore name, it's a Sass naming convention.
  - Components you import need the `lang="scss"` in the SFC.

```
module.exports = {
  css: {
    loaderOptions: {
      sass: {
        data: `@import "@/styles/_variables.scss";`
      }
    }
  }
};

<style lang="scss">
#app {
  color: $primary;
}
</style>
```

- [Storybook](https://storybook.js.org/): Something to think about if we're building multiple front-ends now.
- [`can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException) during bundle install with gem`](https://stackoverflow.com/questions/54087856/cant-find-gem-bundler-0-a-with-executable-bundle-gemgemnotfoundexceptio)
  - Bundler version 2 introduced a new feature to automatically use the version of Bundler specified in the Gemfile.lock of your project. Delete the line at the bottom `BUNDLED WITH 1.17.3` and then `bundle install` again.
- [`/usr/local/sbin is not writable.`](https://stackoverflow.com/questions/46778133/brew-link-php71-could-not-symlink-sbin-php-fpm?noredirect=1)
  - `cd /usr/local; sudo mkdir sbin`, then add permissions or whatever to that directory, then `brew link`.
