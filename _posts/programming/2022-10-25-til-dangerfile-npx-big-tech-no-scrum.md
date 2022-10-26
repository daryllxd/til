---
layout: post
title:  "TIL, 2022-10-25, Dangerfile digging, npx vs npm, Big tech and scrum"
date:   2022-10-25 17:39:53 +0800
categories: programming
summary: "Dangerfile digging, npx vs npm, Big tech and scrum"
---

# Dangerfile improvements:

- Can add a `devDependency` so can use it in local `npx` or `npm`.
- `exec` has `stderr` and `stdout` which helps
- [Reference](https://github.com/tj/commander.js) - Commander for CLI apps.
- [Reference](https://github.com/sindresorhus/ora) - Elegant terminal spinner.
- [Reference](https://github.com/lukeed/kleur) - Formats terminal text with ANSI colors.

# Difference between npx and npm?
[Reference](https://stackoverflow.com/questions/50605219/difference-between-npx-and-npm)

- npx is a package executor. Why NPX? No need to edit the `package.json` with node modules path, and directly execute the tool from the command line.
- `npx` runs the command of a package without installing it explicitly.
  - If you want to test some commands., or you just want to execute a script without installing these packages as project's dependencies.

# 10 Tips for Building Resilient Payment Systems
[Reference](https://shopify.engineering/building-resilient-payment-systems?utm_source=newsletter&utm_medium=email&utm_campaign=pragmaticengineer&utm_content=newsletter.pragmaticengineer.com)

- Lower timeouts - Ruby built-in `Net::HTTP` client has 60 seconds to open a connection to a server, 60 seconds to write data, and 60 seconds to wait for a response.
  - MySQL has `MAX_EXECUTION_TIME` optimizer int for setting a per-SELECT query timeout in ms.
  - Investigate and set low timeouts whenever you can - can be 1 second for a write and read or 5 seconds for a query.
- Circuit breaker: Raise an exception when we detect a service being down.
- Understand capacity: The average number of customers in a system (over an interval) is equal to their average arrival rate, multiplied by their average time in the system.
- Monitoring and alerting: Latency, traffic, errors, saturation.
- Structured logging: Correlation ID: Controller and background job are connected in the API parameters and SQL query comments.
- Idempotency keys - needs to be unique to be retry-able.
- Reconciliation - we make sure that our records are  consistent with those of the financial partners.
- Load testing.
- Incident management, incident retrospective.

# How Big Tech Runs Tech Projects and the Curious Absence of Scrum
[Reference](https://newsletter.pragmaticengineer.com/p/project-management-in-tech)

- Skype: Used Scrum. Whatsapp: Don't care, out-executed Skype.
- How companies manage projects? "It depends."
  - YOLO, "plan build ship".
  - Scrum: Large, non-tech companies.
  - Kanban.
-  Teams with dedicated project managers typically recorded lower satisfaction ratings at public/venture-funded tech companies. At non-venture companies, several respondents happy with project management.
- Teams being allowed to choose their own way of working were more common at public tech companies.
- Team autonomy is correlated with high satisfaction.
- Teams struggling have little to do with the methodologies.
- JIRA satisfaction is bad.
- What didn't work well?
  - Engineers not involved in estimations.
  - Requirements changing.
  - Those with no autonomy to change a failing project management approach.
- Big tech: None, but most are quick plan -> build -> iterate/ship.
  - Engineers lead most projects.
  - Teams are free to choose the PM style.
  - No dedicated PMs for team-level projects.
  - First-class developer tooling: CI, quick feedback from CI/CD systems, can share functionality they are working on with other team members.
- Organizational structure:
  - Autonomy for software engineers and teams.
  - Curious problem solvers, not mindless resources. A motivated engineer easily makes multiple times the impact of a "factory worker" who only does what they're told.
  - Internal data, code, and docs transparency.
  - Exposed to the business and to business metrics.
  - Engineer-engineer comms.
  - Investigating in a less frustrating developer experience - platform and program split.
- ***Empowered and autonomous teams are the building blocks of all these companies.***
- Teams with clear vision.
- Product vs Project manager:
  - The role of a product manager is to figure out what game we're playing and how we're going to play it.
  - The team, not the product manager, is responsible for making this happen.
- Dropping scrum:
  - Scrum got in the way of shipping on a daily basis.
  - Infrastructure and developer tooling removed the need for many scrum rituals.
  - Much of Big Tech has recognized how first-class infrastructure and developer tooling make a big difference to the productivity for engineering teams. This is why 30-40% of engineering often works on platform teams and is why Uber invested heavily in platform teams.
- Beyond scrum:
  - ***Competent, autonomous people need less structure to produce reliable, high-quality output. Big Tech is able to attract, afford and hire these people.***
  - Leveraging competent teams comes through giving them freedom to choose how to operate. This is true for most types of engineering, and there’s good reason why the Skunk Works model of autonomy with reduced bureaucracy, is what many high-performing teams with high-caliber people end up following.
- Scaling an engineering organization: goes well beyond team-level processes.
  - Developer productivity: How can engineers spend more time writing code that moves the needles for the goals of the team, instead of being bogged down by issues?
  - Repay tech/architecture debt.
- In defense of scrum:
  - Needed to rein in stakeholders on software development processes.
  - Forming and storming stages of new teams.
- How to run teams:
  - Directing, mentoring and coaching all have their uses. Directing – telling people exactly how to do something – is micromanaging when they can do it themselves. However, it’s a supportive activity when they can’t. Choose your approaches depending on whether you direct, mentor or coach and give space to people or teams, based on their capabilities as well. Over time, you should be doing little to no directing. But you might need to start with this.
  - The fewer people you need to make decisions, the faster you can make them. If an engineer only needs to talk to an engineer to decide, that decision will be faster than if the engineer needs to talk to their project manager, who talks to another project manager, who talks to an engineer, who talks to… you get it.
  - Some of the best engineers would rather quit than be micromanaged, especially when the job market is hot, and it’s so easy to switch jobs. A relevant quote from a response to my survey: “Recently, C-level executives have started to mandate the ways of working for all teams (everyone needs to follow the same methodology). It resulted in a lot of engineers leaving."

# What Silicon Valley "Gets" about Software Engineers that Traditional Companies Do Not
[Reference](https://blog.pragmaticengineer.com/what-silicon-valley-gets-right-on-software-engineers/)

- ***Autonomy for software engineers.***
  - For the most part, engineers are expected to figure out "the how" of the work, including making larger decisions.
  - Engineers taking initiative is something SV-like companies celebrate.
  - *The expectation from developers at traditional companies is to complete assigned work. At SV-like companies, it's to solve problems that the business has. This is a huge difference. It impacts the day-to-day life of any engineer.*
  - Traditional companies: execs and PM make decisions. SV: Team + organization + company goals.
- ***Curious problem solvers, not mindless resources.***
  - They can bring the highest leverage through coding and problem solving.
  - "I did a bit of digging, and though we could do X, if we can reduce the scope by this feature that won't make a difference for the business impact, we could ship this without any code changes, just changing a few config files."
  - "I am concerned if we could ship the project, and think we should put a pause on it. I checked what our competitors are doing, and one of them launched a similar feature, but reversed it, after they got investigated by the regulator. Have we checked with the legal team if we could ship this at all?"
- ***Exposure to the business and to business metrics***
  - SV engineers are encouraged to interact with the rest of the business and build relationships outside just fellow engineers.

# The Platform and Program Split at Uber
[Reference](https://newsletter.pragmaticengineer.com/p/program-platform-split-uber)

## Program teams

- Long-lived, formed around a mission.
- Cross-functional.
- External customers to the tech org - works with customers, operations.
- Focused on a business mission.

## Platform  teams

- Focused on a technical mission.
- Specialized and rarely cross-functional.
- Customers are engineering teams and are internal, usually.
- Consumed by programs/platforms verticals.

## Shared characteristics

- Single manager for all engineers.
- You build it, you own it.
- The same quality bar.
- No permission required to build.
- Program teams splitting into programs/platform teams.

## My Brief Take on Platform Teams

- Platforms teams are non-intuitive to put in place. "Why would I have 20 to 40% of my engineers doing things that customers will never see?"
- Improve organizational efficiency: easier with platform teams in place.
- Must-have when scaling up and scaling fast.
