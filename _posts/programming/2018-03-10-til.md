---
layout: post
title:  "TIL, 2018-03-10"
date:   2018-03-10 21:51:28 +0800
categories: programming
summary: "Reading Full-Stack React."
---

## Musings

- Vim plugins:
  - `Plugin 'mxw/vim-jsx'`: Need this
  - `:set ft?` and `:set ft=markdown`.
  - I need emmet! I don't really want to write another closing HTML tag again in my life!
- `key` is not a prop.
- `sort()` mutates the original array it was called on.
- `this.props` → Can't see the contents of props, you have to `this.props.SOMETHING`.
- [Declaring variables in ES6.](http://exploringjs.com/es6/ch_variables.html)

## Full Stack React, Chapter 1

```
class ProductList extends React.Component {
  // Defining an
  handleProductUp(productId, productName) {
    // There's no such thing as
    // stuff = [productId]
    // You have to do const stuff or var stuff
    var stuff = [productId, productName, 'was voted'];

    console.log(stuff.join(' '));
  }

  render() {
    // Sorting: This actually mutates the array
    const sortedProducts = Seed.products.sort((a, b) => ( b.votes - a.votes ));

    const productComponents =  sortedProducts.map(
      (product) => (
        // You need to pass in the 'key' just for React to internally know which Product is which
        // There is also no method called this.props.key inside the Product
        <Product
          key={'product' + product.id }
          id={product.id }
          title={product.title}
          description={product.description}
          url={product.url}
          votes={product.votes}
          submittedAvatarUrl={product.submittedAvatarUrl}
          productImageUrl={product.productImageUrl}
          onVote={this.handleProductUp}
        />
      )
    );

    // Remember, put everything before the return
    return (
      <div className='ui unstackable items'>
        {productComponents}
      </div>
    );
  }
}

class Product extends React.Component {
  // JS special constructor method.
  constructor(props) {
    super(props);

    // Remember your best friend, the JS "this"? It's back.
    // For the React lifecycle methods like `render`, `this` is automatically bound to the component that we are using.
    // For created methods like `handleUp`, we have to explicitly set the `this` to be the handler.
    // Why this type of syntax? I have no idea. F JS.
    this.handleUp = this.handleUp.bind(this);
  }

  // Defined own method, that calls the method above it, to update things below?
  handleUp() {
    this.props.onVote(this.props.id, "pants");
  }

  // You always need a return from the render function.
  // If you want to render nothing, then render null;
  render()  {
    return (
      <div className='item'>
        <div className='image'>
          <img src={ this.props.productImageUrl }/>
          <p></p>
        </div>
        <div className='middle aligned content'>
          <div className='header'>
            <a onClick={this.handleUp}>
              <i className='large caret up icon'/>
            </a>
          </div>
          <div className='description'>
            <a>{ this.props.title }</a>
            <p>{ this.props.description }</p>
            <a>{ this.props.votes }</a>
          </div>
          <div className='extra'>
            <span>Submitted by:</span>
            <img
              className='ui avatar image'
              src='images/avatars/daniel.jpg'
            />
            <p>
              Hello
            </p>
            props
          </div>
        </div>
      </div>
    );
  }
}


ReactDOM.render(
  <ProductList />,
  document.getElementById('content')
);
```
