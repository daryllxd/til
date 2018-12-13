---
layout: post
title:  "TIL, 2018-12-12, Debugging"
date:   2018-12-12 16:52:05 +0800
categories: programming
summary: "Reading About Debugging"
---

# How to improve your ability to debug existing code
[Reference](https://softwareengineering.stackexchange.com/questions/11726/how-to-improve-your-ability-to-debug-existing-code)
# How to most effectively debug code?
[Reference](https://softwareengineering.stackexchange.com/questions/10735/how-to-most-effectively-debug-code)

- Don't assume anything.
- Testing incrementally.
- Write tests in the form "given", "when", "expect". Write tests, don't just sprinkle debugs.
- Divide and conquer: try to identify visible input/output between which the issue exists. Try putting prints at sizable chunks or significant points between them.
- What are the bugs you tend to write? It might be things like thread deadlocks.
- Just assume things about semicolons.
- Learn the nuances of your debugger and learn the hotkeys.
- Write tests - TDD done right eliminates almost all trivial, stupid bugs, but also helps a lot in debugging. Testing forces your design to be modular, which makes isolating and replicating the problem a lot easier.
- Learn the debugger. Talk to someone about your problem. Give yourself a time limit.
- Is there really a bug?
- If you have narrowed it down to two systems that collaborate, then determine which system is behaving to spec and which one is not.

# How I got better at debugging
[Reference](https://jvns.ca/blog/2015/11/22/how-i-got-better-at-debugging/)

- Bugs happen for a logical reason.
- Being confident on how this bug happens.
- `strace`/stack trace. Being able to observe directly what a program is actually doing is incredibly valuable.
- As I started being able to solve harder bugs, now when I find a thorny debugging problem, it's way more exciting to me than writing new code.

# Kafka Meetup, Confluent and Agoda
