---
layout: post
title:  "TIL, 2018-06-08-preparing-for-product-interviews"
date:   2018-06-08 12:27:50 +0800
categories: programming
summary: "Reading 'Cracking the PM Interview', UX Your Life"
---

# How to prepare for a Product Manager interview
[Reference](https://hackernoon.com/how-to-prepare-for-a-product-manager-interview-6204b1ba5d6d)

- Word of mouth. PM meetups.
- Favorite product, alarm clock for the blind, LinkedIn sign-in flow? Interviewers are evaluating your creativity.
- Strategy/Business acumen. At least have business intuition or judgment.
- Technical skills. Spell corrector, google.com in the browser, and write an algorithm to detect meeting conflicts? Be prepared to describe key technologies including search engines, machine learning, or large scale design systems.
- Analytical/data-driven.
- Practice.

# Preparing for PM interviews: how to get there in 15–20 hours
[Reference](https://medium.com/pminsider/preparing-for-pm-interviews-how-to-get-there-in-15-20-hours-193f6fcbf606)

- Cracking the PM Interview, Decode & Conquer.
- Prepare a set of personal stories to answer behavioral questions.
- Study 6-7 different products deeply.
- Technical terms.
- Estimation questions.
- Mock interviews.

# How to Hire a Product Manager
[Reference](https://www.kennorton.com/essays/productmanager.html)

- Big company: specialization. On learning about hiring: mostly from making mistakes.
- In a PM: Raw, intellectual horsepower. *Product management is fundamentally about thinking on your feet, staying one step ahead of your competitors, and being able to project yourself into the minds of your colleagues and your customers.*
- In a PM: strong tech background. Engineering background = relating to engineers + a grasp of the tech details driving the product. Easier to convey requirements to engineers and relaying complicated details to non-technical colleagues and customers.
  - There is an adaptation period from technical → product. Moving from engineering to product management, biggest advantage and disadvantage of having a technical background, big lesson you learned when you moved from engineering to PM.
- In a PM: Product instincts and creativity.
- In a PM: Leadership that's earned.
- In a PM: Channeling multiple points-of-view. Engineering, design, and marketing.
- Give me someone who’s shipped something.

# Consulting Organizations vs. Product Organizations
[Reference](https://www.linkedin.com/pulse/consulting-organizations-vs-product-shanif-dhanani/)

- ***In consulting organizations, the employee is the product.***
  - Because of this, both employees and owners of consulting organizations are always concerned with "billability", or working on something that they can charge the client for.
  - Employees are rewarded more for finding new clients, rather than doing great work.
  - Those that can sell tend to rise up the ranks and gain more prominence.
  - Those that can't may still be respected, but end up lacking the ability to make a lot of changes and set policies.
- ***Product-focused firms, though, make money by creating and selling things that they create.***
  - They're more focused on building great products, and because of that, they don't have to worry about accounting for how their employees spend each and every hour while at work.
  - What they need to focus on is delivering high quality products that their customers actually want to buy.
  - *This means that they're more incentivized to foster employee happiness and creativity. It also means the employees of a product organization need to work in close proximity for large amounts of time.*
  - This need for creativity and the close cooperation of employees inevitably leads to a corporate culture and identity among its employees. Organizations that care about their culture are then able to drive and direct this culture to one that makes their employees happy (which, arguably, leads to employees sticking around longer and doing better work).

# Critical metrics every product manager must track
[Reference](https://productcoalition.com/critical-metrics-every-product-manager-must-track-c5f1e46e3423)

- Engagement
  - Number of sessions per user. Avoid averages and take medians over means.
  - Session duration for a cohort, over time. Compare average session duration for churned and retained users.
  - Number of key user actions per session. (Ex: clicks on the "Like" button.)
- Business
  - LTV (Customer lifetime value).
  - CAC (Customer acquisition cost).
  - ARPA (Average revenue per account).
  - MRR (Monthly recurring revenue).
  - Logo churn/revenue churn.
- Cx service
  - Number of incoming support tick

# Are your SaaS customers paying, or praying?
[Reference](https://productcoalition.com/are-your-saas-customers-paying-or-praying-e23021301c78)

- If your Product Team doesn't handle requests from praying customers correctly, it will put your startup at risk of becoming nothing but a feature factory.
- Geoffrey Moore, the absence of a market: “If two people buy the same product for the same reason but have no way they could reference each other, they are not part of the same market.”
- In SaaS, two customers belong to the same market if and only if they use your product to serve their customers in a similar way.

# UX Your Life: Applying the User-Centered Process To Your Life
[Reference](https://www.smashingmagazine.com/2018/06/ux-your-life-user-centered-process/)

- The Internet's advice on life: full of vague phrases/platitudes, implying attainable/achieved perfection, and calls for sudden/uninformed optimism.
- Your Life in Weeks
  - Really really cool!
  - This thing gives you perspective.
- Eisenhower Charts: Important and urgent! Know what your actual priorities are.
- Affinity Mapping: Write down important goals, values and activities you want to prioritize, organize the data, timebox the exercise.
- Designing a solution:
  - Wife and I want to work together, if possible, work from home, start our work day early, not check email on weekends, and make time for our priorities and passion projects.
- Prototyping Life, things that emerged:
  - Everyone has their preferred accountability method.
  - Google Friday-style passion project time.

# Musings, Ruby

- [Can anyone explain what Docker is, and how it is useful? ](https://www.reddit.com/r/webdev/comments/8pd233/can_anyone_explain_what_docker_is_and_how_it_is/)
  - Tying it into a real world as far as cloud apps go - I have a small box hosted on DO. There's a docker container within it hosting the API, another one hosting the application, another one that automates letsencrypt certificates, and a fourth one hosting the database. So within the container that is my site's official computer, I have four subcontainers that are all different responsibilities that it has.
  - I tie them all together with docker-compose, which is docker's tool to manage a group of containers. If the database shuts down, it can restart itself right away. Same with the API and the app. If any part of the app starts getting busy on a regular basis, I can separate it from the group and move it onto another DO box where it has more space to breathe. That's pretty nice too - I can scale out the app slowly and replace it bit by bit without really having to dive into the code (just docker config).
  - *The real perk of it though in day to day is that I can clone the entire thing as-is and run it all on my computer as if it were live.* So when I have to do any edits, i can do them on my machine, push the changes up through git, and then restart the live containers, which are set to build automatically when that happens.
  - So instead of perusing through lines of source code to make sure that nothing's going to break, I can have one codebase that I know will run online the same way it does on my laptop.
  - The main thing these cloud services give you is scaling. You can basically spin up more containers of your application (or parts of your application) as required.
  - The other part about cloud hosting is that you're not guaranteed this single server. You can't just put your files on it and assume you have access to that same server in the future. So by using containers, which can easily be reproduced on any server, it's not an issue.
  - So instead of needing to jump through a lot of hoops to make your dev environment as close as possible to your production environment to minimize integration bugs, you just build in a container that will eventually *be* your production environment. And as a bonus, it's portable. You can start by self-hosting a Docker container, but if your app gets huge overnight you just move it to a cloud provider and they run it for you on as much hardware as you need.
- `rails db:migrate:status` exists?
- `Model.where('column IS NULL OR column = ?', '{}')`: For finding records where the things in this array are nil or empty.
