---
layout: post
title:  "TIL, 2023-01-20, CSS modules"
date:   2023-01-20 12:57:10 +0800
categories: programming
summary: "CSS modules"
---

# A deep dive into CSS Module
[Reference](https://blog.logrocket.com/a-deep-dive-into-css-modules/)

- Common CSS issues:
  - Name collision
  - What's the dead codes?
  - Dependency management - position absolute and relative.
- Advantage of CSS module
  - The markup is written in a JS file like `index.js` and it generate unique class names for the component.
  - `composes` - can combine stuff.

# CSS Modules vs CSS-in-JS. Who wins?
[Reference](https://dev.to/alexsergey/css-modules-vs-css-in-js-who-wins-3n25)

- CSS modules - transform style names using a hash based on the filename, path, style name.

```
.title {
 padding: 20px;
 background-color: #222;
 text-align: center;
 color: white;
 font-size: 1.5em;
}

import React, { Component } from 'react';
import styles from './App.module.css';

class App extends Component {
 render() {
   return (
     <div className={styles.title}>
       React application title
     </div>
   );
 }
}
```

- Styled components
  - Cons
    - Browser won't interpret the styles until styled-components has parsed them and added them to the DOM.
    - Cannot cache separate CSS.
    - Most libraries don't support.
    - Can't use SCSS, etc.
- Pros
  - Can use JS logic
  - Looks semantically `Title` rather than `h1 classname={style.title}`.
  - Hot-reloading is instant.

- CSS modules
  - Cons
    - Global styles has a different syntax
    - Need typings for CSS modules
  - Pros
    - Regular CSS
    - No styles in the code
    - Almost 100% standardised except for global

```
import React, { Component } from 'react';
import styles from 'styled-components';

const Title = styles.h1`
 padding: 20px;
 background-color: #222;
 text-align: center;
 color: white;
 font-size: 1.5em;
`;

class App extends Component {
 render() {
   return (
     <Title>
       React application title
     </Title>
   );
 }
}
```

# How to use Props in React
[Reference](https://www.robinwieruch.de/react-pass-props-to-component/)

- While props pass information, state changes over time.
- You can't pass props from child to parent, but you can pass functions from parent to child, and the child components call these functions to change the parent state above.
- Default props:
  - `const Welcome = ({ title = 'Earth', description }) => (`
- Children prop - just the stuff between the tags.
- Passing multiple props - slot pattern in React.
- Render props:

```
import { useState } from 'react';

export const Amount = ({ toCurrency = (amount: any) => <p>Hello amount{amount}</p> }) => {
  const [amount, setAmount] = useState(0);

  const handleIncrement = () => setAmount(amount + 1);
  const handleDecrement = () => setAmount(amount - 1);

  return (
    <div>
      <button type="button" onClick={handleIncrement}>
        +
      </button>
      <button type="button" onClick={handleDecrement}>
        -
      </button>

      <p>US Dollar: {amount}</p>
      {toCurrency(amount)}
    </div>
  );
};
```

- Usage:

```
<Amount />
<Amount toCurrency={(amount: any) => <Hoho amount={amount} />} />
```

- How to set props to state?

```
const User = ({ user, onUpdateName }) => {
  // derive initial state from props
  const [name, setName] = React.useState(user.name);

  function handleNameChange(event) {
    setName(event.target.value);
  }

  return (
    <li>
      {user.name}
      <input type="text" value={name} onChange={handleNameChange} />
      <button type="button" onClick={() => onUpdateName(user, name)}>
        Update
      </button>
    </li>
  );
}
```

- Pitfalls
  - Not being passed - usually because it doesn't get destructured.

# Building a design system with Radix
[Reference](https://blog.logrocket.com/building-design-system-radix/#building-a-range-input-component-with-radix)

- Radix: Primitives, colors, icons.
- Design system: Style guide, pattern library, component library.
