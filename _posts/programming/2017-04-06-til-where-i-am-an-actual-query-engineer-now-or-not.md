---
layout: post
title:  "TIL, 2017-04-06"
date:   2017-04-06 12:53:22 +0800
categories: programming
summary: "Where I am an actual query engineer now (or not?)."
---

- Multiple queries vs. 1 query--sometimes you think that the multiple query ones are slower, they are sometimes actually faster because joins are expensive. Sure the logs might look dirtier but the overall speed is faster. This is where tests are important. You cannot test speeding up the query until you have tests around that query's main endpoint or specifically that query.
- `receive_message_chain`:?
- Test n+1 query--how exactly? Guess we can do the expect to receive `.includes&hellip receive ` but that sorta sucks.
- Just try to separate all methods that might be reused into their own classes. Then dependency injection them. Ex: the logic for reversing match scores.
