---
layout: post
title:  "TIL, 2018-05-16, Thinking about How Components can be Refactored"
date:   2018-05-16 19:39:16 +0800
categories: programming
summary: "Some reading on crypto, ES6 destructuring, SFC functions?"
---

# JS/Front-end

- `Warning: React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: undefined. You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.` => Got this from importing `Tabs` and `Tab` from `react`, not `react-bootstrap`.
- JS can't sort if there's a null. You need to make them '' if ever.
- [Destructuring a two level hash](https://medium.freecodecamp.org/the-basics-of-destructuring-props-in-react-a196696f5477)

``` js
class Listing extends Component {
  render() {
    const {
      listing: {
        location: {
          city,
          state,
          country
        }
      }
    } = this.props;

return (
      <p>Location: {city}, {state}, {country}</p>
    )
  }
}
```


- Stateless functional components: should not have functions inside lol. Bind them from outside. [Reference](https://stackoverflow.com/questions/37716629/how-do-i-define-methods-in-stateless-components)
- [Prefetching, preloading, prebrowsing](https://css-tricks.com/prefetching-preloading-prebrowsing/)
  - Pre-fetching: A way to hint to the browser about resources that are going to or might be used in the future.
  - DNS pre-fetching: Notifies the client that there are assets we'll need later from a specific URL so the browser can resolve the DNS as quickly as possible. `<link rel="dns-prefetch" href="//example.com">`

# Ruby

- `map` then `tap` is ugly but it works lol.

# Cryptocurrency

- ASIC: Application-specific integrated circuit, an IC customized for a particular use (voice recording, Bitcoin mining).
