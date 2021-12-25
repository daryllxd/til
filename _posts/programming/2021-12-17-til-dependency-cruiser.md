---
layout: post
title:  "TIL, 2021-12-17, Dependency Cruiser"
date:   2021-12-17 18:40:09 +0800
categories: programming
summary: "Dependency Cruiser can work"
---

- Trying out Dependency Cruiser.
  - [Reference](https://github.com/sverweij/dependency-cruiser)
 - `npx depcruise --include-only "^projects/our-library" --output-type dot projects/our-library | dot -T svg > dependencygraph2.svg`
