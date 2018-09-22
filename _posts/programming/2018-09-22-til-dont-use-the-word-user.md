---
layout: post
title:  "TIL, 2018-09-22, Don't Use the Word 'User'"
date:   2018-09-22 17:55:25 +0800
categories: programming
summary: "Also something about transactions."
---

- [Reference](Never use the word "User" in your code)
  - Airline system "users": Are different based on the context (traveler, purchaser, travel agent, check-in agents).
  - Unix "users": Humans who log in, system services, admin accounts who are SSHing into the server, and `root`.
  - SaaS: Almost always, there is a person who is paying for the service, and one or more people from that organization who actually use the service.
  - If you combine them from the start, then you can't model teams, payment for multiple people at once, and now you need to change it later.
- Rails locking:
  - `Product.transaction do ... end` is the same as `Product.find(1).transaction do ... end`.
