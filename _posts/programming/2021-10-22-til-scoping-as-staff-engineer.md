---
layout: post
title:  "TIL, 2021-10-22, Scoping as Staff Engineer"
date:   2021-10-22 14:57:40 +0800
categories: programming
summary: "Staff Engineer things"
---

# How to expand your scope as a staff-plus engineer
[Reference](https://leaddev.com/personal-development/how-expand-your-scope-staff-plus-engineer?utm_source=ActiveCampaign&utm_medium=email&utm_content=Seven+ways+to+help+your+team+connect+when+you+re+apart&utm_campaign=Originals+-+Issue+57+%28October+21%29)

- Network: As a staff engineer, your responsibility is to understand what's going on at all levels of the organisation. You need to build relationships with other teams that you can informally lean on if you need a favor done.
- Recurring 1:1 syncs with leads on adjacent teams in your immediate group. Check the roadmaps.
- Let your ambitions be known:
  - I want to grow my scope so I can get a title and the next level, or I'd like to have a greater role on Project X.
  - Freely offer your genuine self.
- Connect the dots.
  - CI frustrations - should have better platform tooling.
  - Patterns and cycle of rework?
- Opportunities can be found in the seams where one team ends and one team begins.
  - Assess personal strengths and follow them to see if there are opportunities within the company.
  - Teacher/coach - workshops or community?
  - Technical expert - how can you get different business function (marketing, legal, or finance) understand and deepen their fluency in your expert area?
- Be wise about the projects you choose.
  - "If I take on this project, will my group move faster?"
- Collaborative style
  - Build rapport and empathy by meeting 1:1 with the tech lead and hearing about their problems.
  - Offer up a proposal: I've been hearing about this problem and I wrote a proposal that might help.
  - Frame the discussion as a mutual win - how would this benefit both teams?
- Operating at staff-plus level: Running a multi-team project that ships something complex and important for the larger group.
- Leadership for other teams.
- Scale internal product into a platform.
- Advance competency across functional areas - is there an opportunity to upskill engineers by leading workshops/starting a community of practice?
- Improve process or capability across the company.

# 9 Things I Learned Building the Same App with Angular and React
[Reference](https://www.telerik.com/blogs/9-things-i-learned-building-same-app-angular-and-react)

- React has fewer files - Angular also has a lot of dependencies.
- `Create React App` has a lot of magic.
- React hooks - powerful and concise, but esoteric.
- Angular DI (modules) are just so weird. Main difference between imports, providers, declarations, exports, and bootstrap.
  - Theoretically, services can probably just be utility functions from wherever.
- Typescript is really good.
- Angular ViewEncapsulation is actually quite good so CSS is not wild wild west.
  - CSS in JS - possible performance hit if CSS is done run-time, not build-time.
- How would React apps scale?
