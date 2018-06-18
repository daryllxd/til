---
layout: post
title:  "TIL, 2018-06-17, Resting/Reading about Tech"
date:   2018-06-17 21:06:45 +0800
categories: programming
summary: "Fear of tech, GPS at Uber."
---

# Why are so many people afraid of technology? Is this fear a good thing?
[Reference](https://www.quora.com/Why-are-so-many-people-afraid-of-technology-Is-this-fear-a-good-thing)

- The uninformed or the uneducated can run from the whirlwinds of technology.
- Tech is superior to people. Ex: calculating change in a McDonalds when the power is out.
- Fearing progress, automation. They are also scared that the things can be broken. Insecurity.
- Each tech advance brings both blessings and curses.

# Musings

- [Rethinking GPS: Engineering Next-Gen Location at Uber](https://eng.uber.com/rethinking-gps/)
  - GPS is inaccurate (50m or more) in densely populated and highly built-up urban areas.
  - GPS: a network of more than 30 satellites operated by the US government.
  - GLONASS: Russian satellites.
  - Why this sucks in urban environments: buildings often block the lines of sight to satellites, so the receiver processes signals corresponding to strong reflections off of other buildings.
  - We use a likelihood surface/heat map from probabilistic shadow matching to figure out information from satellite SNR measurements.
