---
layout: post
title:  "TIL, 2018-04-01, Reading about hash tables, adding Lit.css, ES6 reading."
date:   2018-04-01 22:49:17 +0800
categories: programming
summary: "CS Hash table, Lit, yarn eject, fetch vs Axios, JS exports."
---

# Musings, React and CSS

- `yarn eject` to split out everything from `create-react-app`.
- `create-react-app` image in CSS: plop them in `src/`, then do a `background-image: url("./aperture-vintage-346923-unsplash.jpg");`.
- `create-react-app` importing CSS that were packaged:
  - `import '@ajusa/lit/dist/lit.css';` and `import '@ajusa/lit/dist/util.css';`. Check out the `node-modules` directory (you have access to that directory, just figure out what to include afterwards).
- The [Lit](https://github.com/ajusa/lit) library is super small, it's also cool for small apps like what I'm doing re: writing prompts.
- `fetch` vs `Axios`.js.
  - Used to make HTTP requests from Node.js and XML HttpRequests from the browser.
  - Supports the Promise API.
  - Also performs automatic transforms of JSON data.
- JS exports: [A simple intro to Javascript imports and exports](https://medium.com/@thejasonfile/a-simple-intro-to-javascript-imports-and-exports-389dd53c3fac) and [Reference](https://stackoverflow.com/questions/21117160/what-is-export-default-in-javascript)
  - A "module" in JS can be thought of as a container that holds related code which can then be exported to another file.
  - `export default` is used to export a single class, function, or primitive from a script file.

``` js
ES 5:

var React = require('react');        // Require 'react' using the 'require' statement
var Component = React.Component;     // Set 'Component' to equal to the Component module of the React library.
require('./App.css');                // Include the css file which doesn't need to be set to a variable.

module.exports = App;                // You careate this component and export it.

module.exports = {                   // Exporting a module object with two components
  Color: Color,
  Animal: Animal
}

var { Color } = require('./Shapes'); // Importing
var { Animal } = require('./Shapes');

ES 6:

import { Color, Animal }, from './Shapes';
export class Color extends Component { ... }
```

# Musings, Computer Science: Hash table.
[Reference](https://en.wikipedia.org/wiki/Hash_table)

- Hash Table: uses a hash function to compute an index into an array of buckets or slots.
  - When a key is put into a hash function, it returns an index. You use the index for lookups.
  - Basic requirement: the function should provide a uniform distribution of hash values. Non-uniform means higher chance of collisions.
  - Choosing a hash function: If one uses dynamic resizing with exact doubling/halving of the table size, then the hash function needs to be uniform only when the size is a power of two. Other hashing algorithms prefer to have the size be a prime number.
  - Separate chaining:
    - So for the array that was created to store the results of the hash function, each member of the array would be either a linked list or a head cell.
    - If linked list, the key is the actual key that was initially used. what happens is:
      - Look for the hash result of the key. This would result in the linked list.
      - Traverse over the linked list, using the actual key as the key to find the values.
      - Cost: depends on the average keys per bucket. It's actually bad if you have one bucket with so many keys inside.
      - Load factor: Stored keys/number of slots. If you have 1K slots and 10K stored keys (load factor 10), this will be slower than a 10K slot table, but still 1K times faster than a plain sequential list.
      - Problems: when storing small keys and values, the space overhead of the `next` pointer in each entry record can be significant. Also, traversing a linked list has poor cache performance, making the processor cache ineffective.
    - List head cells.
      - They store the first record of each chain in the slot itself, to decrease the pointer traversals by one. Disadvantage: an exmpty bucket takes the same space as a bucket with one entry.
  - Open addressing: To be continued!
