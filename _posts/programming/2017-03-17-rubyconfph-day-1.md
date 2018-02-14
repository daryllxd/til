---
layout: post
title:  "TIL, 2017-03-17, RubyconfPH Day 1"
date:   2017-03-17 08:21:18 +0800
categories: programming
---

# RubyConfPH 2017 First Day

## Bobbilee Hartman/Dylan Wolff: Fostering Jr. Dev Talk

- Culture:
  - Whole team needs to be on board.
  - Making mistakes is okay.
  - Senior are proactive about checking in. They (junior) might be embarrassed about asking. You (senior) have to show that they (junior) are worth their time.
  - Share other interests, not just all work, all the time.
  - Open and honest communication. Speaker said that she was having a hard time figuring out ember, and when she opened up the other devs said they had a hard time too.
  - Ownership of a discrete feature: Giving them a responsibility/own a feature (while reinforcing that its okay to ask sr. what to do.)
  - Jrs. leading standup/meetings. When they have that kind of responsibility, they feel like they deserve to be ther.
  - Jrs. representing their company at meetups.
- Support
  - Pairing: Not always, but it can work, switch people up so they are not always paired with the same person always.
  - Don’t let them isolate themselves. Sometimes they are overwhelmed, don’t allow that to happen.
  - Training/conference budget.
  - Learning lab. 2 meetings, one with product manager and one with engineer and ask whatever.
  - Keep them focused on their own growth. They should not compare themselves with others, especially when they are learning with people more senior than them.
  - Regularly scheduled one-on-ones (about once a month)—super helpful, get feedback on how they are doing.
  - Code reviews—consistently review code.
  - Encourage juniors to “timebox” any problems.
  - “How difficult is this question?” If they have a question, it has a number (1-10 1 easy 10 hard). If they ask a question, sr. can say “ah yeah that is a 10, it’s a hard problem, I’ll think of a solution later then chat with you about it” or “that’s a 2 or 3, you can solve that if you google it a bit”

## Netto Farah - Challenges with API

- Multiple clients with different access patterns - iOS wants to download a lot at once jic no connection, web app assumes you have a decent net connection
- API must be granular—more endpoints, or heavier response/json on the endpoints
- Soundcloud blog/microservices— 30 api calls to render a track one (not really productive)
- Documentation/conventions—Documentation is seen as “duplication” and you need to be disciplined to keep it updated with the code
- GraphQL - A language specification for defining APIs
  - Describe your data in types:
  - Problem GraphQL API as an integration layer for multiple (not so micro) services and front-ends

``` ruby
type Rubygem {
  name: String
  downloads: Int
  versions: [ Int ]
}
```

## Konstantin Hasse - Magenta is a Lie

- **Anything that is in the world when you’re born is normal and ordinary and is just a natural part of the way the world works.**
- Anything that's invented between when you’re fifteen and thirty-five is new and exciting and revolutionary and you can probably get a career in it.
- Anything invented after you're thirty-five is against the natural order of things.
- Abstractions occur only in your mind. Abstraction is the basis of Computer Science. Without abstractions, every software development talk would start with explaining with flowing electrons.
- Colors of the Rainbow - "as many as you can see".
- Good rules make good programs.
- "Don’t abstract things too early. Duplication is far easier to deal with the wrong abstraction."
- Strong external abstractions allow weak internal abstractions
- Things we invent that exist in our mind: types, inheritance, composition, type hierarchies, mixins...
- Most attacks rely on switching up and down abstraction levels. Ex: heartbleed, it worked on the assumption that users use the same password for different sites.
- Business logic - Only exists in our minds. OOP—none of this actually exist, they are just concepts in our mind. They are not inherent to how we perceive the world.
- UI elements only exist in our minds, we are just relying on the fact that people will understand what these things look like alone or in combination.

## Lightning Talkz (with a Z)

- CodeCuriosity
- 1 + 2 + 3 + 4 solution.
- Always search for a gem with the word gem
- Repeat what the guy is saying in you head and look at their forehead if you don't want to look at their eyes.
