---
layout: post
title:  "TIL, 2017-04-26, Database Indexing"
date:   2017-04-26 12:40:32 +0800
categories: programming
---

## Inheriting Code: Why You Should Keep Code Teardowns to Yourself

- When passing a project to new owners, initial reactions are almost always too harsh. *It's very easy to be a critic, especially of someone else's.*
- *Assume best intent and try to look at things optimistically.*
- It is overwhelmingly likely that the team or person who wrote the code did so in a different context than the one you're in today.
- We should not lose sight of leaving things in a better state than when we found them.
- Don't be intimidated by a code base that you're unfamiliar with--my recommendation is to dig in, focus on how you can test or verify what you're doing, and start making small changes.

## Database Indexing
[Reference](http://stackoverflow.com/questions/1108/how-does-database-indexing-work?rq=1)

- An index is a data structure that stores the values for a specific column in a table. It is created on a column of a table. An index on `User#name` will search for John faster because all names starting with a "J" will be right next to each other in the index.
- On average, searching a field without index will take N/2. With a sorted field, it is log 2 N. Also, since the data is sorted given a non-key field, the rest of the table doesn't need to be searched for duplicate values once a higher value is found.
- Downside: these require additional space on the disk.
