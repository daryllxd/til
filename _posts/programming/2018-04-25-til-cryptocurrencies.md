---
layout: post
title:  "TIL, 2018-04-25, Looking into cryptocurrencies."
date:   2018-04-25 17:05:21 +0800
categories: programming
summary: "Node and NoSQL, SQL when starting, Cryptocurrency, grep vs awk vs sed."
---

# Musings, Front-end

- [Reference](https://github.com/facebook/create-react-app/issues/585) On including images in `create-react-app`: Your mental model shouldn't be "I need to import files right where they will be used" (like in Image component). Your mental model should be "There should never be string literals in my code meaning absolute URLs to assets because build system won't know to include them. So every time I want to write a string literal for image URL, I should instead write an import. The result of that import will be the string I want (and can pass anywhere else)."

# Musings, Back-end

- [Node.js and NoSQL: no technical reason?](https://stackoverflow.com/questions/18376042/are-relational-databases-a-poor-fit-for-node-js)
  - Problems with Non-RDBMS + Node.js servers:
    - Joins are slower.
    - Expensive joins.
    - Manually writing joins is difficult and error-prone.
    - Some non-RDBMS like Mongo do not support transactions.
  - Node is popular with stateless APIs, this fits nicely into Node's async nature.
  - MongoDB is essentially a JSON object store, good for JS apps.
- [SQL or NoSQL When Starting? (2010)](https://news.ycombinator.com/item?id=1332113)
  - K-V data stores are useful for big things like Twitter/Facebook.
  - Advantage of NoSQL is its quicker to build with, since no schema management.
- `sort` is a thing in Unix shell.
- [Differences between grep, awk, and sed?](https://stackoverflow.com/questions/7727640/differences-among-grep-awk-and-sed?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
  - grep/ag: search for terms in a file.
  - awk: for data extraction and reporting. It's a programming language built around CSV-style files, processing the records, and printing out a result data set.
  - sed: stream editor, find and replace. Useful when you want to make changes to a file based on Regex.
  - With grep, sed, and awk, you can solve 99% of all text processing problems. Or you can use Ruby/Python.

# Musings, Cryptocurrency

- [Bitcoin Scalability Problem](https://en.wikipedia.org/wiki/Bitcoin_scalability_problem)
  - On chain transaction processing capacity of the BTC network is limited by the average block creation time of 10 minutes and the block size limit.
  - Hard fork: a rule change that splits the chain. Ex: ETH hard-fork after the DAO hack, causing the Ethereum and Ethereum Classic chains.
  - Soft fork: Change of rules that is backwards-compatible.
  - User-activated soft fork: a concept of enforcing a soft fork rule change without the majority support of miners.
- Ethereum Classic: After the DAO attack, the ETH blockchain was reverted to before that attack happened. Some people wanted to continue on with the non-reverted version of the blockchain.
- Zero-confirmation transaction: A transaction which occurs but is not yet confirmed by the miners.
