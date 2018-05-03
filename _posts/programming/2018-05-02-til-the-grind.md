---
layout: post
title:  "TIL, 2018-05-02, The Grind"
date:   2018-05-02 17:16:15 +0800
categories: programming
summary: "Monoliths vs Microservices vs Serverless, Ruby/Rails patterns, AWS Fargate, Aurora."
---

# Musings, Ruby

- Service/Query/Client/Wrapper objects.
- You can create a `dry-types` or some value object in your client classes.
- [Building a hash in a conditional way: build it with conditionals and then `reject` or `compact` after.](https://stackoverflow.com/questions/7328647/building-a-hash-in-a-conditional-way?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)

``` ruby
hash = {
  :key1 => 1,
  :key2 => (2 if condition),
  :key3 => 3,
}.reject { |k, v| v.nil? }
```

- [Monolith vs Microservice vs Serverless.](https://hackernoon.com/monolith-vs-microservice-vs-serverless-the-real-winner-the-developer-8aae6042fb48) "The key things to note is that legacy systems are only legacy because they've been successful enough to last this long."

# AWS Fargate

- No need to think about the containers so you can just focus on building and operating your application.
- No need to manage a cluster of EC2 instances.
- Integrates with ECS.
- Build container image → choose orchestrator → define application → launch containers → run containers.
- [Changing the calculus of containers in the cloud:](https://www.allthingsdistributed.com/2018/04/changing-calculus-containers-cloud.html)
  - *You should be able to write your code and have it run, without having to worry about configuring complex management tools, open source or not. With Fargate, you don't need to stand up a control plane, choose the right instance type, or configure all the other components of your application stack like networking, scaling, service discovery, load balancing, security groups, permissions, or secrets management. You simply build your container image, define how and where you want it to run, and pay for the resources you need.*
  - Fargate has native integrations to Amazon VPC, Auto Scaling, Elastic Load Balancing, IAM roles, and Secrets Management. We've taken the time to make Fargate production ready with a 99.99% uptime SLA and compliance with PCI, SOC, ISO, and HIPAA.
  - I think the next area of innovation we will see after moving away from thinking about underlying infrastructure is application and service management.
  - How do you interconnect the different containers that run independent services, ensure visibility, manage traffic patterns, and security for multiple services at scale? How do independent services mutually discover one another? How do you define access to common data stores? How do you define and group services into applications?

# Weekend Reading: Amazon Aurora: Design Considerations for High Throughput Cloud-Native Relational Databases.
[Reference](https://www.allthingsdistributed.com/2017/05/amazon-aurora-design-considerations.html)

- What customers wanted when RDS came was to move to non-proprietary databases.
- They would love to migrate to an open-source style database like MySQL or PostgreSQL, if such a database could meet the enterprise-grade reliability and performance these high-scale applications required.
- [RDS vs Aurora:](https://serverfault.com/questions/721267/aws-rds-mysql-vs-aurora)
  - Lambda functions.
  - Load data from S3 or load XML from S3.
  - Aurora is 5.6 compatible.
