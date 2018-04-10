---
layout: post
title:  "TIL, 2018-04-09, Google Maps is Back!"
date:   2018-04-09 21:39:33 +0800
categories: programming
summary: "React-DOM, react-google-maps, react-bootstrap."
---

# Musings, React

- There are 2 Blueprint.CSS repos, and 1 Blueprint.js (by Palantir). I still chose to go with `react-bootstrap` since it's usually a good idea to support the most popular front-end framework because of its ubiquity.
- React-DOM is a thing?
- With the new update, all the DOM stuff you do should be done with ReactDOM instead of React. It's a separate module.
- The most popular Google Maps library for React is [Reference](https://tomchentw.github.io/react-google-maps/).
- Google Maps API will work for local environments, but you need a key for production, or else you'll get a `MissingKeyMapError`.
