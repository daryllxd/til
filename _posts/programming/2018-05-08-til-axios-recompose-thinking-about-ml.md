---
layout: post
title:  "TIL, 2018-05-08. Axios, recompose, thinking about ML."
date:   2018-05-08 17:23:17 +0800
categories: programming
summary: "Search is GET. Don't overthink, just do things if you know you can edit them later."
---

# Musings, JS

- [GET: Don't send data.](https://github.com/axios/axios/issues/787) You send things via the parameters. Search usually uses GET.
- [How often do you update dependencies?](https://www.reddit.com/r/webdev/comments/8hxh27/how_often_do_you_upgrade_dependencies/) Not really sure lol.
- Don't overthink things. Just go with Bootstrap for now.
- React recompose `spinner` (`withBranch`) and for lifecycle hooks.
- Does this thing have to exist on every damn form? Lol.

``` js
handleSubmit = (e) => {
  e.preventDefault()
}
```

# Musings, Ruby

- `Array#bsearch` is really faster than `find`, but the array must be sorted first. (Like for 50M numbers, find takes 3 seconds, and bsearch takes like 0 lol.
- There was a Ruby Enterprise Edition before? (2012.)
- Basic Auth
- Admin panel: [Administrate](https://github.com/thoughtbot/administrate).

# Musings, CS

- [Learning Machine Learning:](https://www.youtube.com/watch?v=MOdlp1d0PNA)
  - Studying about it and tinkering around with random data sets.
  - A lot of the time, your code would not look nice. The key is, does it work?
  - On math: "Let's figure this out!"
  - So you basically need linear algebra, statistics, probability, and calculus.
  - Python vs R: Both are good, pick and learn one, and learn the language as a language, not as an ML language. "Data Science from Scratch", "Machine Learning with R".
  - ML Learning Pipeline: Find data (scrape, APIs, CSVs).
  - Machine Learning Mastery website.
  - Visualize results. If you can't communicate your result, you might as well not have done it.
  - `scikit` and algorithm things.
  - The plan:
    - Learn the math (2-3 months).
    - Learn the programming language (1 month).
    - Machine learning tutorials and test projects (1-2 months).
    - Short-term passion projects (1 month).
  - You're going to fail a lot.
  - Your models may not be predictive.
  - Track your projects on Github and write up your results.

