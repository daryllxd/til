---
layout: post
title:  "TIL, 2018-05-15, Hacking around with Redux"
date:   2018-05-15 17:47:11 +0800
categories: programming
summary: "Finally used Redux. Let's hack away boys."
---

# JS/Redux

- 1 store per app. Put `createStore` in `index.js`.
- You can do an `import rootReducer`.
- Seriously a lot of hacking on getting Redux to work with React.

- [On the Redux store:](https://stackoverflow.com/questions/35300419/redux-do-i-have-to-import-store-in-all-my-containers-if-i-want-to-have-access-t)
  - In general, you want to only make top-level container components ones that have access to the store.
  - Smart components = know about the Redux store/state, dumb components just get passed to them and have no idea about the bigger application state.
  - Provider component: you wrap your whole app with it.
- `action_creators`:

``` js
import createStore from '../store';

const store = createStore()

class App extends Component {

  render() {
    return (
      <Provider store={store}>
        <MainAppContainer />
      </Provider>
    )
  }
}
```

# Ruby

- [Reference](https://stackoverflow.com/questions/43551676/unable-to-convert-unpermitted-parameters-to-hash-ruby-on-rails-app-error?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)

Removing strong parameters if using dry-validation anyway.

- We already have `HashWithIndifferentAccess` anyways already, might as well use it instead of the regular hash.
