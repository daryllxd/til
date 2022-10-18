---
layout: post
title:  "TIL, 2022-10-17, Software Quality"
date:   2022-10-17 14:18:51 +0800
categories: programming
summary: "Software Quality"
---

# Are there companies that prioritize software quality?
[Reference](https://www.reddit.com/r/ExperiencedDevs/comments/y4wm2m/are_there_companies_that_prioritize_software/)

- Are there customers that prioritize software quality?
- No, but customers care about features. You can deliver features faster and more consistently when you have higher quality code. Developers onboard faster, and the code allows for cleaner code. It'll also be cheaper to maintain those code bases for the company.
- The only things I've ever had resonate with execs is feature development speed and product stability. The key, in my experience at least, is to focus on demonstrable improvements. Build infrastructure that makes the upcoming features faster and show the "before" and "after". Learn to speak their language.
- There's the famous Space Shuttle control computers, one of the most reliable software systems ever. The people who did that were smart, but they also thought really hard about what they were doing and every problem found was tracked back to a root cause and procedures put in place to avoid it in the future.
- **You're in private industry. It's profit motive and software engineers really need to get over the idea that anyone cares about anything they do besides an unprecedented ability to exponentially scale profit. My favorite fallback is they'd cut you for a guy with a spreadsheet if it was more profitable.**
- The disconnect is almost always upper management and CEOs that can’t comprehend tech debt. They want to sell, sell, sell for the money they can feel and touch. I finally just settled for a place where I enjoy my co workers and the pay is nice.
- You'll need to communicate and change things both upwards and downwards. What are the top concerns for the success of your companies product? Time to market? User churn (maybe because of unreliable service)? Developer retention? If you want to change something so big, you need a strong and clear motivation and must be able to tell stories around it.
- No. All companies prioritize business goals that support the bottom line. In some cases a focus on software quality supports this. This is not just a thing with software, but basically every business in every industry. Accept this and try to find a way to work happily within the system.
- **At some point you are going to have to come to terms with the fact that you don't get paid to make pretty code, you get paid to make money.**
- I think the argument against quality is often coming from people who lack the confidence in their own ability OR people who lack confidence in their team's ability. Both are justified in most cases.
  - There is a huge skill gap between the best and worst devs on any team. The solution cannot be to enforce unrealistic standards on the entire team.
  - IMO the solution is to have your best people write the most code. (Just like superstar athletes score the most goals). The rest of the team is there to assist.
  - A lot of people hate this though. Managers don't like superstars who can demand huge salaries. Engineers don't like feeling inferior to their peers. So the way most shops run is to let everyone make a big mess of things and the talented people get frustrated and leave.

# Measuring Software Engineering Productivity
[Reference](https://newsletter.pragmaticengineer.com/p/engineering-productivity)

- What is productivity? **Performance and productivity are often used interchangeably.**
- Example of output, but not good outcome: Putting a ton of effort to make the sign in flow better, but sign-ups don't increase. From a business perspective, the project is not a success and the team has not been productive.
- Some teams: Productivity is the activity in a codebase, not bound to business results.
- How to measure productivity?
  - KPIs.
  - Identify and debug inefficiencies in team workflows.
  - Get an organization-wide overview of engineering health.
  - Measure team performance.
- DORA metrics:
  - Deployment frequency.
  - Mean time to recovery.
  - Change failure rate - of all releases, how many contain a defect?
  - How long does it take for a commit to get to production?
- Developer productivity tool?
  - During this time, the most useful insights into our development workflows – and specifically, what we could do to reduce friction and ship more code – came from 1-1s and retrospectives. My team knew where the pain was; they experienced it every day.
- **By learning about SPACE, I began to shift my focus from developer productivity to developer effectiveness.**
  - A team which is highly motivated, satisfied, works with tooling which enables them to ship quickly, and consistently delivers quality software is a highly effective team.
  - The flow from code to cloud is fairly frictionless. Developer tooling is an important aspect of this environment, but it’s not the only one. Project management processes, interpersonal relationships, company policies, and work environments add a fair amount of weight.

# Real-World Engineering Challenges #1
[Reference](https://newsletter.pragmaticengineer.com/p/real-world-eng-1)

- [Making Shopify’s Flagship App 20% Faster in 6 Weeks Using a Novel Caching Solution](https://shopify.engineering/shop-app-custom-caching-solution?utm_source=newsletter&utm_medium=email&utm_campaign=pragmatiengineer_newsletter) - Rather than querying the database every time a user requests the home feed, we now cache a copy of their home feed in a fast, distributed, horizontally-scaled caching system (we chose Memcached). *Then we serve from the cache rather than the database at request time provided certain conditions are met.*
  - How to store the data in Memcached and handle concurrent updates?
  - Naive approach: Store a key for each user, and then invalidate the cache, write to database, then write the new value - no support for concurrent writes.
  - To support: Store an additional key/value pair that tracks the validity of the cache, and when about to write to the database, we increment the number of pending writes. We know the cache is valid if the pending writes is 0.
  - If the machine makes an update and wasn't able to decrement the pending writes? Create a key that expires quickly and then if this key doesn't exist while the pending writes is greater than 0, then we know there's not active writes going to come, so rewarm the cache.
  - Use AR concerns to make sure the API stayed the same.
- [Separating User Data with Multi-tenancy To Improve User Management](https://doordash.engineering/2021/09/14/separating-user-data-with-multi-tenancy-to-improve-user-management)
  - Can't persist duplicate users but have to make customers not type in their payment and address information again and again.
  - Multi-tenancy added to improve customer user experience.
  - Use phone number with the goal of a password-less authentication process. Then use the `tenant_id` as a header or param to know which tenant was being checked out.
- [Designing for Productivity in a Large-Scale iOS Application](https://medium.com/airbnb-engineering/designing-for-productivity-in-a-large-scale-ios-application-9376a430a0bf)
  - No hierarchy/categorization of code so hard for engineers to find existing implementations of general-purpose capabilities.
  - Long build times/slow iteration loops - change build systems.
  - Semantically meaningful groups - module types.
  - Dev apps: Minimizing your IDE scope to only the files that you are editing tightens the development loop. Container application that contains just that feature.
