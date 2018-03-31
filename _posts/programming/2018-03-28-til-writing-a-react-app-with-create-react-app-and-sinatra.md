---
layout: post
title:  "TIL, 2018-03-28, Writing a React app with create-react-app and Sinatra"
date:   2018-03-28 11:58:04 +0800
categories: programming
summary: "Writing prompts front-end and back-end with create-react-app and Sinatra."
---

## Musings, Chef/Server

### `ssh-copy-id`

- To do this, you have to:
  - `brew install ssh-copy-id`.
  - SSH into the remote normally.
  - Create a user named `deploy` (`sudo useradd -d /home/deploy -m deploy`).
  - Set a password `sudo passwd deploy`.
  - Add him as a sudoer, in `sudo visudo`, paste this: `deploy ALL=(ALL:ALL) ALL`
  - On local,
    - `ssh-copy-id deploy@ec2-13-250-113-194.ap-southeast-1.compute.amazonaws.com`, take note of the username, it should be `deploy`.
    - This copies your public keys over to the SSH.
    - You can then do: `ssh 'deploy@ec2-13-250-113-194.ap-southeast-1.compute.amazonaws.com'` without supplying your keys.
- [Password changes](https://askubuntu.com/questions/423942/change-password-on-root-user-and-user-account)
  - Root password: `sudo passwd`. (This is different from the admin password). Users with admin privileges may use `sudo` to run commands as a superuser.
  - User password: `passwd`
  - Other people's password: `sudo passwd USERNAME`.
- `brew install` without updating: ` HOMEBREW_NO_AUTO_UPDATE=1 brew install`
- `export HOMEBREW_NO_AUTO_UPDATE=1` if you want no auto update for a specific session. When you get out of the session (ex: close the tmux), this will be gone. If you open other tmux shells, it's still in there. :)

## Musings, Ruby

- `require 'bundler' ; Bundler.require`: Require all, hehe.
- Tried out Sinatra again, it's okay but freaking CORS WHY DOES THIS EXIST?
- `Float::INFINITY` is a thing?

## Musings, React

- Axios: Promise-based HTTP client for the browser and `node.js`.
- Only one Store per app.
- Reducer composition.
- Sample of find via index:
- [Where to fetch data? `componentDidMount`.](https://daveceddia.com/where-fetch-data-componentwillmount-vs-componentdidmount/)
  - `componentWillMount`: an asynchronous call to fetch data will not return before the render happens. This means the component will render with empty data at least once.
  - `componentDidMount`: We make it clear that the data won't be loaded until after the initial render. This reminds you to set up initial `state` properly, so you don't end up with undefined state that causes errors.
  - On constructor vs `componentWillMount`. The constructor will be invoked even if validity checks are failed. So if something fails in the component tree, you still make the unnecessary trip to the server.
  - It's possible to have a component unmount prior to that operating getting completed.
  - Dispatch a Redux action inside `componentDidMount`, so Redux can fetch the data with a thunk.
- [Redux thunk:](https://daveceddia.com/what-is-a-thunk/)
  - Actions are objects.
  - Action creators build these objects.
  - Redux-thunk is middleware that looks at every action that passes through the system, and if it's a function, it calls that function.

```
// React passes dispatch (to dispatch new actions if you need to) and getState  (so you can access the current state)
function logOutUser() {
  return function(dispatch, getState) {
    return axios.post('/logout').then(function() {
      // pretend we declared an action creator
      // called 'userLoggedOut', and now we can dispatch it
      dispatch(userLoggedOut());
    });
  }
}
```
- Code for finder:

``` js
const threadIndex = state.findIndex(
  (t) => t.id === action.threadId
);
```

- A bunch of ES6 Stuff!
