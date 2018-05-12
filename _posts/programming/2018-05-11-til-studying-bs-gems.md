---
layout: post
title:  "TIL, 2018-05-11, Studying B.S. Company's Gems"
date:   2018-05-11 17:23:11 +0800
categories: programming
summary: "Gem study, Docker on A Cloud Guru, `message_bus`."
---

# Musings, Ruby

- `bundle add <GEM_NAME>` to add a gem plus its latest version. Problem is it's added at the bottom of the file.
- [`representable`](https://github.com/trailblazer/representable): Something for APIs?
- [`bitcoiner`](https://github.com/NARKOZ/bitcoiner) gems:
  - [`typhoeus`](https://github.com/typhoeus/typhoeus): Wraps `libcurl` to make fast/reliable requests.
  - [`addressable`](https://github.com/sporkmonger/addressable): A replacement for the URI implementation in Ruby's standard library. Instead of `URI`, `Addressable::URI`.
- Electrum: A bitcoin wallet.
- [`rack-attack`](https://github.com/kickstarter/rack-attack): This can help in rate limiting.
- [Timeouts](https://github.com/ankane/the-ultimate-guide-to-ruby-timeouts)
  - Postgres has a `statement_timeout` for a database user. This thing executes even while just connecting to the database.

## Trying out `message_bus`

- It depends on Redis by default. You can use Postgres or memory to store the queue.
- You can double subscribe? Hehe. Where do you put this in Rails? I imagine it must be in some sort of initializer or in a process somewhere.
- [Evaluating Ruby pub/sub gems.](https://www.reddit.com/r/ruby/comments/49iztg/evaluating_ruby_pubsub_gems_mainly_firehouse/)
  - `message_bus`.
  - Ruby to do web sockets? The migration path from Ruby to Node is not pretty and is full of problems.
  - RabbitMQ.
  - Wisper is great for notifications, but where it falls down is it makes you put a million pieces together in an app. `message_bus`.
  - Firehose: Tied to HTTP, expects clients to be in JS and servers to be in Ruby, and something oriented around the metaphor of a path-oriented queue.
  - RabbitMQ + Bunny + Sneakers.
- [Observer vs Pub-Sub pattern:](https://hackernoon.com/observer-vs-pub-sub-pattern-50d3b27f838c)
  - Observer: knows its dependencies.
  - Publisher-Subscriber: Senders of messages, called publishers, do not program the messages to be sent directly to specific receivers, called subscribers.
  - Third component: broker or message broker or event bus, which filters all incoming messages and distributes them accordingly.
  - Pub-sub is a pattern used to communicate messages between different system components without these components knowing anything about each other’s identity.

# Musings, AWS

- Docker packages software into standardized units called Containers: containers allow you to easily package an application's code, config, and dependencies into easy to use building blocks that deliver environmental consistency, operational efficiency, developer productivity, and version control.
- Container vs virtual machines: Only contains the app and dependencies. No file system/VM.
- Container Benefits:
  - Escape from Dependency Hell
  - Consistent progression from dev → test → QA → prod.
  - Isolation between container A and B.
  - Better resource management.
  - Extreme code portability.
  - Makes it easy to microservice.
- Components:
  - Docker image: Contains only the files required to boot a container.
  - Docker container: Contains the things an app needs to run.
  - Layers/union file systems: Read-only templates for which containers are launched. They combine to a single image. When you update, you don't need to
  - Dockerfile: Images built from the base image using specific instructions: run a command, add a file, add a directory. Docker reads this Dockerfile when you need this image.
  - Docker Daemon/Engine:
  - Docker Client: The interface between you and the engine.
  - Docker Registries/Docker Hub: Holds images. Private/public image collections.
- ***ECS: Amazon EC2 Container Service (Amazon ECS) is a highly scalable, fast, container management service that makes it easy to run, stop, and manage Docker containers on a cluster of EC2 instances.***
  - Use an API call to launch/stop container-based applications.
  - Get the state of the cluster.

## What is ECS?

- Elastic Container Service
  - Able to be used in one or more AZs across a new/existing VPC to schedule the placement of containers across your cluster.
  - Eliminates the need for you to operate your own cluster management/config management.
  - Used to create a consistent deployment and build experience, manage and scale batch and ETL workloads, and build sophisticated application architectures on a microservices model.
- Docker: Just like CloudFormation, it's a way to set up your container.
- ECR: EC2 Container Registry, you can put private Docker repos there.
- ECS Task Definitions: Text files that describe one or more containers that form your application.
