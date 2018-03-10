---
layout: post
title:  "TIL, 2018-03-09"
date:   2018-03-09 01:05:31 +0800
categories: programming
summary: "Starting the AWS Certified Solutions Architect Course"
---

## Musings

- I think I have to get better at testing like the implementation details of.
- When I'm sort of not motivated yet, I can do simple things first like read a book, browse Programming, Ruby, or Elixir subreddits, Hacker News, Indie Hackers.
- Wasn't able to get to the React part of the day, but I'll do it tomorrow.
- Hashicorp: Created Vagrant (that's why it sounds familiar!), Vault, Terraform.
- I just moved lifelong-learning to a private repo, because of the copyright work commits.

## A Cloud Guru

- New exam:
  - Design resilient architectures.
  - Define performant architectures.
  - Specify secure applications and architectures.
  - Design cost-optimized architectures.
  - Define operationally-excellent architectures.
  - 80 questions, results within 3 months, $75, valid for 2 years.
- Focus: AWS white papers.

### History of AWS

- 2003: Paper on what Amazon's internal infrastructure should look like,
- 2004: SQS.
- 2006: AWS.
- 2007: 180K developers on the platform.
- 2010: All of amazon moved over.
- 2013: Certification launched.
- 2015: Revenue: $6B USD.
- 2017: AI/VR services.

### AWS: The 10K Foot Overview.

- AWS Global Infrastructure
  - 16 regions, 44 availability zones. 6 more regions/17 more AZ's for 2018.
  - You will never be tested on numbers, etc. No rote learning.
  - Region: geographical area.
  - Availability zone: data center. They can survive natural disasters. At least 2 per region.
  - NA: US E (N Virginia), US W (Oregon)...
  - Edge locations: endpoints for AWS which are used to caching content. Typically, this consists of CloudFront. These are cached from physical locations close to the request.
- Compute:
  - EC2: Virtual machines in the AWS platform.
  - EC2 container services: where you manage Docker containers at scale.
  - Elastic Beanstalk: These provisions scalers, load balancers, etc, so focus just on the code.
  - Lambda: You upload and you wait for it to execute. Nothing to manage. All you worry about is your code.
  - Lightsail: Amazon's VPS service. Provision you a server, a fixed IP address you can log in the server from, and it will give you SSH access/admin panel.
  - Batch: Batch computing in the cloud.
- Storage:
  - S3: Simple Storage Service, object-based, you have buckets, upload these in the cloud.
  - EFS: Elastic File System, network attached storage. We can put files in EFS and mount them onto virtual machines.
  - Glacier: Data archival.
  - Snowball: a way to bring a large amount of data into the data center. Like literally a physical box.
  - Storage gateway: Virtual machines that can replicate themselves onto the AWS cloud.
  - RDS: Relational database service. Anything.
  - DynamoDB: Non-relational database.
  - Elasticache: Stuff like "top 10 products".
  - Red Shift: Data warehousing/business intelligence. Complex queries.
