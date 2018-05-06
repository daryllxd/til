---
layout: post
title:  "TIL, 2018-05-05, Trust the (Ruby) Processes"
date:   2018-05-05 04:52:39 +0800
categories: programming
summary: "Slack `goSDSL`, Speech as Computer UI."
---

# Musings, Ruby Processes

- `graphql` gem has a `max_depth` setting to avoid circular stuff, also it has a global timeout thing.
- GraphQL and performance in Rails:
  -  Avoiding n+1: use gem called `graphql-batch`, and preload with: `graphql-preload`.

# Musings, Reading

- [Moving Fast and Securing Things](https://slack.engineering/moving-fast-and-securing-things-540e6c5ae58a)
  - Security Development Life Cycle.
  - Slack's `goSDL`: a tool that enables developers to produce secure features at high output with low friction.
  - Risk assessment questionnaire, which creates check boxes for the team to complete (Jira items).
  - There is a way for you to see the SDL getting completed: sort of a checklist thing.
- [A Data Scientist's Guide to Happiness](https://medium.freecodecamp.org/a-data-scientists-guide-to-happiness-findings-from-the-happy-experiences-of-10-000-humans-fc02b5c8cbc1)
  - Family, getting paid, food, sleeping, games/competition, achievement/education, celebrating/birthdays, mental balance/introspection, spending, weekend trips, reading and music, decisions.
- [Speech Is the Ultimate Invisible Computer Interface](https://www.quora.com/Is-Amazon-Echo-and-or-Siri-and-other-voice-assistants-actually-useful-or-is-it-just-a-novelty-Are-usage-and-retention-of-these-products-growing/answer/Brian-Roemmele?srid=Pi3&share=531ff6d3)
  - Speech Requires Less Mechanical Load And Cognitive Load
  - ***The mechanical load and cognitive load on the human is far lower when we can utter a phrase like “Alexa, what does my commute look like?” as compared to the 30+ cognitive and mechanical steps using the best smartphone and best apps.***
  - Advantages over current systems:
    - Ambient vs intentional (visual activity requires singular focused attention while speech allows us to do something else).
    - Descriptive vs referential (we describe objects in terms of their roles and attributes, and our interactions with computers are referential).
    - Requires more modest physical resources.
  - Amazon could be the next largest payments opportunity in this epoch.
  - Speech-based interfaces allow you to multitask and do other things.
