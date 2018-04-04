---
layout: post
title:  "TIL, 2018-04-03, React Forms and Pandoc is back."
date:   2018-04-03 17:51:32 +0800
categories: programming
summary: "React forms and form validation, spinners, pandoc resume building, ExpressJS, Ruby's NotImplementedError."
---

# Musings

- Pandoc man, `hfill`. Just check the resume generator lol.
- Checking out `light-table`.
- ExpressJS looks like Sinatra. This is something that I can probably look into.
- Ruby: Feel free to raise `NotImplementedError` for inheritance things.

# Musings, Front-end

- Some random crap again about CSS and widths.
- Did some media queries for the first time in 2 years? Lol.
- [Controlled components in React.](https://reactjs.org/docs/forms.html)
- [`Draftjs`](https://github.com/facebook/draft-js) is a thing!
- Validations part: Researching for libraries.
- Thinking about a form validation library for React. What to do...?

``` js
// Cool code sample from [Medium](https://medium.com/@rajaraodv/adding-a-robust-form-validation-to-react-redux-apps-616ca240c124)
/For any field errors upon submission (i.e. not instant check)
//Note: In the below function, we kinda assume that the fields are valid and try to create post and handle errors if any later on.

const validateAndCreatePost = (values, dispatch) => {

 return new Promise((resolve, reject) => {
    dispatch(createPost(values)).then((response) => {
       let data = response.payload.data;
       //error..
       if(response.payload.status != 200) {
          //let other components know by updating the redux` state
          dispatch(createPostFailure(response.payload));
          reject(data); //this is for redux-form itself
       } else {
          //let other components by updating the redux` state
          dispatch(createPostSuccess(response.payload));
          resolve();//this is for redux-form itself
       }
   });//dispatch
 });//return
};
```
