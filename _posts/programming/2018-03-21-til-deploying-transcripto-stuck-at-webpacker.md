---
layout: post
title:  "TIL, 2018-03-21, Deploying Transcripto and Practicing React change states"
date:   2018-03-21 18:23:05 +0800
categories: programming
summary: "React PropTypes and Context (used for react-router), Try Deploying Again on AWS"
---

## Musings, React:

- [Getting previous state from a React component when setting its new state.](https://gist.github.com/klikstermkd/e56e120ad9559aa44dfeaa3b13cfb25d)

``` js
class Player extends React.Component {
  constructor() {
    super()

    this.state = { score: 0 }
  }

  increaseScore() {
    // 1. Get previous state from this.state
    this.setState({ score: this.state.score + 1 })

    // 2. Get previous state from the callback function
    this.setState((prevState) => {
      return { score: prevState.score + 1 }
    })
  }
}
```

- `Warning: ChildComponent(...): childContextTypes cannot be defined on a functional component.`: I'll get back to this later.


## Musings, Deployment

- [Rails manifest file not found (deploying with Capistrano)](https://stackoverflow.com/questions/47914115/rails-manifest-file-not-found-deploying-with-capistrano)
- Finally stuck at webpacker.

Set the damn `RVM` type lol.
- `sudo apt-get install nodejs`
- `sudo apt-get install npm`
- `sudo apt-get install yarn`

``` ruby
set :rvm_type, :user
set :rvm_ruby_version, '2.4.1'
```
