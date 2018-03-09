---
layout: post
title:  "TIL, 2018-03-08"
date:   2018-03-08 15:57:54 +0800
categories: programming
summary: "Where I..."
---

## Musings

- I have a better strategy now re: learning React for reals. I put money in it by spending money on a book (`fullstackreact`). Now, I'm pretty much forced to read it. Plus I really want to make a front-end for daryllxd anyway.
- [Can I put database versions in git?](https://stackoverflow.com/questions/846659/how-can-i-put-a-database-under-git-version-control)
  - Just make copies of the database if I'm introducing schema changes. Dev databases should be small.
  - Take a database dump, and version control that instead. That way it is a flat text file.
  - Keep both a data dump and a schema dump?
- [Where to store SQLite Database file?](https://softwareengineering.stackexchange.com/questions/319707/where-to-store-sqlite-database-file)
  - Store the words using a text format, and build a database during the build. Instead of storing the information in binary format and storing the binary file in the version control, keep the pairs in a CSV file. This allows you to easily change it, commit the changes, and later diff the changes with ease.
- Removing stuff on Github: I don't think there's an easy way to do this.
- Browsed Some Game of Life things. Wow those are like really awesome.

## ReactJS Musings

- Read an article on this.
- Event lifecycle.
