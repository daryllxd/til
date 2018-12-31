---
layout: post
title:  "TIL, 2018-12-30, Reading List Smash"
date:   2018-12-30 17:02:41 +0800
categories: programming
summary: "Airbnb Microservices, Ruby Code Smells"
---

# Airbnb’s 10 Takeaways from Moving to Microservices
[Reference](https://thenewstack.io/airbnbs-10-takeaways-moving-microservices/)

- Monolith first. Microservices is a pre-optimization.
- Devops culture: Each engineer has to be prepared to support their service when deploying la.
- Ops: triage, coordinate, and communicate. Systems operation teams.
- Configuration is code. Having your configuration as code makes it easy to reason about.
- Monitoring and alerting like New Relic. Alerts are configured as code.
- Continuous delivery: every new service that's created will have the same process and functionality as a monolith.
- Automate every small thing that can be automated.
- The first services are going to be bad. Just keep on trying.
- Democratic deployment: all devs are expected to own their features from implementation to production.
- Make all config easily accessible so devs can create a service with one pull request.

# Check My Code: Tips to Keep Ruby Code Smell-Free
[Reference](https://www.codementor.io/ruby-on-rails/tutorial/check-my-code-tips-to-keep-ruby-codes-smell-free)

- Remove the `if ... return true, else return false` code by making it its own method.
- Long conditionals like a switch: You can make it a hash with a default value. This is not a good solution for space complexity!

```
puts "What is your major?"
major = gets.chomp

# Set default response
major_responses = Hash.new("That's a cool major!")

# Add other responses
major_responses["Biology"] = "Mmm the study of life itself!"
major_responses["Computer Science"] = "I'm a computer!"
major_responses["English"] = "No way! What's your favorite book?"
major_responses["Math"] = "Sweet! I'm great with numbers!"

puts major_responses[major]
```

- Classes with attributes but no methods: just use `Struct`!
- If you have to do a chain method, you have to be defensive there.
