---
layout: post
title:  "TIL, 2018-02-26, Time for Brunch"
date:   2018-02-26 19:43:32 +0800
categories: programming
summary: "Upgrading Phoenix to 1.3, Bootstrap, and Guardian. Also, why npm still, Phoenix?"
---

## Musings

- Apparently, I've been running a non up-to-date version of Phoenix. I have the rc version.
  - The newer versions have an `assets` directory, I was able to get the builds working.
  - You just `npm install bootstrap`, change the Brunch config file, and when you run `mix phx.server`, Brunch will compile everything. It will show you also the errors.
- Flash message view helper. I can't pattern match that part.
- `guardian` is the most popular Authentication framework. [Reference](https://medium.com/@tylerpachal/session-authentication-example-for-phoenix-1-3-using-guardian-1-0-beta-a228c78478e6)
- Remember the mapping in Controller → Template:
- It's hard to look for tutorials re: Guardian. I'm following this: [Reference](https://medium.com/@tylerpachal/session-authentication-example-for-phoenix-1-3-using-guardian-1-0-beta-a228c78478e6).
  - You need a lot of things: pipelines, plugs, changesets, forms. It's hard at first, because it isn't like Devise, but I think I'll be fine.
- Cloned [Reference](https://github.com/learnphoenixtv/blog.git).
- I need to get better at the mechanics/interactions between the different layers but I like what I'm doing.
- Currently stuck at missing a JWT token, but this is probably just a config file.
- Stuck at making `current_user` available for the entire application. I need a big-ass plug for this.
- Phoenix umbrellas?
- I'm honestly just so damn tired but so happy that I did a lot of things today!

## Asking, How do you get better at scaling websites/scalability?
[Reference](https://www.reddit.com/r/webdev/comments/80ceo8/how_do_you_get_better_at_scaling/)

- `mdaffin`:
  - Make it scalable across multiple servers.
  - Three parts to scale:
    - Ingestion/load balancer. `HAproxy`, then cluster them.
    - Your application
    - Data store. Master/slave setup to have multiple readers or master/master setup like `mariadb`'s `galera` cluster.
    - Cloud provider (Amazon AWS, Google Cloud) has features that can take care of scaling the load balancer/data stores for you.
  - Make your application nodes stateless so they do not hold any more info than what they need to serve one request. This allows you to add/remove nodes without worrying about syncing state on each node. Long term -> external data store.
  - Temporary request state: on the node, you can either move that to a central cache or route clients back to the same node.
  - The tooling: `terraform` and `ansible` to make automating things much easier.
  - Docker for microservice style architecture. Kubernetes for Docker clustering, nomad and consul.
  - On getting better:
    - Sign up for Amazon AWS, free tier for 12 months.
    - Spinning up VMs, provisioning them manually, exposing them via load balancers, and trying out auto-scaling instances.
    - `terraform` to provision things.
    - `ansible`/`chef`/`puppet` to provision servers.
    - Service discovery with `consul`.
    - `Docker` and `Kubernetes`, learning how to create containers locally and how to deploy them to production.
- `djvirgen`:
  - Horizontal scalability.
    - App is stateless.
    - Deploy multiple instances.
    - Place a load balancer in front.
    - Make sure persistence writes to a shared location.
    - Cache anything that is slow, using a shared cache if possible.
- `DusmaN21`: set performance budgets.
- `_poq`: Trial and error. Indexes are your best friend.
- `the_goose_says`: 95% of the problems are database-related.
- `never_safe_for_life`: [Reference](https://github.com/donnemartin/system-design-primer). Working for companies that force you to work with bottlenecks.

## Ask HN: Whats the difference between 5/10/15 years of exp?
[Reference](https://news.ycombinator.com/item?id=16464528)

- `matt_s`: More time spent reading code now than I used to. Times to craft wonderful code and times to just get shit done.
- `Juliat`: Communities get fragmented, although they use the same technology. The more you learn/practice/experiment/play/discuss about/grasp the history, the wider your world view grows.
- `apohn`: When you get better, you get faster at recognizing when a project will fail for non-technical reasons. You also develop a desire to deal with non-technical aspects of the project, because there is a realization that a good solution to the business problem will not occur if you don't take some ownership in the decision making process.
- `psyc`:
  - What gets better: breadth and depth of knowledge, problem-solving ability, intuition/heuristics, general level or complexity of the technical things I"m able to accomplish successfully.
  - Career-related things: no consistency at all. Salaries, roles, natures of jobs.
  - Much happier when I had ownership of an obscure product, rather than the maintenance duties of huge products.
- The more you learn, the more you realize how little you know.
