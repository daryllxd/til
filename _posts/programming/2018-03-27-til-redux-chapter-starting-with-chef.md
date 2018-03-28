---
layout: post
title:  "TIL, 2018-03-27. Redux Chapter at Last, Trying out Chef"
date:   2018-03-27 11:52:24 +0800
categories: programming
summary: "I reach the Redux chapter in Full Stack React, edit views/flexbox in Transcripto, and re-provision/get my feet wet with Chef."
---

## Musings, Chef

- Wah I was not even using my free tier account! :(
- `$ chef gem install knife-zero`.
- [`rails-server-template` problem](https://github.com/TalkingQuickly/rails-server-template/issues/52)
- Berkshelf: The dependency manager for Chef cookbooks.
- Cookbooks are the modules that tell chef how to install a piece of software.
- `$ berks vendor` ensures we have the correct cookbooks available in the folder `berks-cookbooks`. This path is specified in `knife.rb`.
- Unable to authenticate (Chef): Add `authorized_keys`.

``` ruby
local_mode true
chef_repo_path   File.expand_path('../' , __FILE__)
cookbook_path ["cookbooks", "berks-cookbooks"]

knife[:ssh_attribute] = "knife_zero.host"
knife[:use_sudo] = true
knife[:editor] = '/usr/local/bin/vim'
knife[:before_bootstrap] = "berks vendor"
knife[:before_converge]  = "berks vendor"
```

## Musings, Ruby

- High Voltage layout has to be below the include.
- `params[:action]` to figure out what layout to render re: Bootstrap container lol.
- [Sticky footer solved by flexbox](https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/)
- Read up on gem configuration patterns-just put it in the lifelong-learning for now, when I need it.
- [The hidden costs of inheritance](https://practicingruby.com/articles/hidden-costs-of-inheritance)
  - **Inheritance-based modeling is most commonly used for behavior sharing, but what it actually provides is implementation sharing.** The greater the inheritance tree is, the chance of clashing with a variable used by an ancestor grows.
  - The lack of true private methods in Ruby complicates the system further: there isn't a way to write a method in a parent object that a child object can't clash with or override.
  - Gigantic interface (a million methods, lol).
  - Balancing reuse and customization?
- [AR tricks](https://medium.com/rubyinside/active-records-queries-tricks-2546181a98dd)
  - Join with condition on the associated table: `merge`.
  - Subqueries: `Post.where(user_id: User.created_last_month)`.
  - Booleans: Use `User.where(tall: [false, nil])` because a `.where.not` will not catch the NULL case.
- The Well-Grounded Rubyist, Chapter 6
  - Ruby initializes variables if it sees it, even if it won't get executed. ` if false; x = 1; end #=> x is nil, not unknown`
  - Capture match in conditional: `if m = /la/.match(name)`
  - `case` operator: `when` matches on `===`.
  - Blocks have access to the variables that already exist when they're created, but block variables (those between the pipes) are not the same as the ones outside.
  - Semicolon in the parameter list: Doesn't overwrite variables outside.
  - Exceptions that get raised are instances of a class, not the actual Exception class itself.
  - Pros of creating your own exception class:
    - Inherit from `StandardError` to have a meaningful exception name and refine the semantics of the rescue operation.
    - Self-documenting.
    - Able to rescue this specific exception.
- The Well-Grounded Rubyist, Chapter 7
  - Literal constructors: `String.new`, `Array.new` (you can't do `Integer.new`).
  - `inspect` is for overriding, independently of whether you override `to_s` (which is used when it's string interpolated). `inspect` is for other programmers.
  - A `display` method exists, it logs stuff out (default to `STDOUT`).
  - Star operator: Unwraps its operand into components.
  - Conversion vs typecasting: Calling methods like `to_s`, `to_i`, and `to_f` results in a new object, not like in C where you use the object as a string or an integer.
    - In a sense, all objects are typecasting themselves constantly.
  - Role-playing method
    - `to_str`
    - `to_ary`
  - Some cool shit:
    - Empty class definition = false
    - Non-empty class definition = the same value as the last value they contain
    - Method definitions are false, even if what they return is a true value

## Musings, React

- `$ ./node_modules/.bin/babel-node app.js` To execute JS, with `babel-cli` and `babel-core` in there? Lol.
- `Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: object. You likely forgot to export your component from the file it's defined in.`
  - WTF, I just powered on this part.
- Need to learn what `export` actually means. [Reference](https://stackoverflow.com/questions/36795819/when-should-i-use-curly-bpure races-for-es6-import/36796281#36796281)
- JS Spread syntax (...) [Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)
  - Can be used for concatenating arrays, constructing objects/hashes.
- [To check if undefined in `ES 2015+`:](https://stackoverflow.com/questions/34596489/es2015-2016-way-of-typeof-varname-undefined)
  - Just check `varName === undefined` or `varName !== undefined`.
- [`this.forceUpdate()` to force a re-render.](https://stackoverflow.com/questions/30626030/can-you-force-a-react-component-to-rerender-without-calling-setstate)
  - `forceUpdate` is discouraged.

``` js
// Pass argument to event handlers [Reference](https://reactjs.org/docs/handling-events.html#passing-arguments-to-event-handlers)

onChange = (name, e) => {
  // ES6 way of dynamic keys [Reference](https://stackoverflow.com/questions/11508463/javascript-set-object-key-by-variable)
  this.setState({
    [name]: e.target.value,
  })
};

<input
  onChange={(e) => this.onChange('name', e)}
  value={this.state.name}
  type='text'
/>
