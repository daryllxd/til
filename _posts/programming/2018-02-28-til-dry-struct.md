---
layout: post
title:  "TIL, 2018-02-28, Trying out dry-struct"
date:   2018-02-28 13:56:20 +0800
categories: programming
summary: "I read a bunch of Ruby architecture articles and try a value object class called dry-struct."
---

## Musings

- I think the main problem with Rails is that it's convention only works for a certain app size. You need to have some expansion options for Rails. Or at least make it easy to switch it out.
- So it's actually a good thing that I'm writing Daryllxd with the inside layer first (no Rails though it's there) so I figure out the problem with AR. It's actually not Rails, it's AR.
- On the billion monkey patches: can I just not use them? They are additions anyway.
- So it's about actions per minute on building an app. Being really fast re: adding the business logic layer (if you need to do it).
- Figuring out a value object library.
  - I think I like [`anima`](https://github.com/mbj/anima/tree/master/lib) because of the keyword arguments.
  - I'm also looking at [`dry-rb`](https://github.com/dry-rb/dry-struct).
  - I actually just went with `dry-rb` because it was well-maintained, and I like it.
- Ruby Time is different from DateTime. Convert Time to DateTime with `.to_datetime`. [Reference](https://stackoverflow.com/questions/279769/convert-to-from-datetime-and-time-in-ruby)
- WHUT, re: `Table::Load.call(file) vs Table::Load(file) vs Same as Tale.Load(file)`. Those are the same? I prefer the first thin, still.
- `gem open dry-struct` to open the actual gem source. Or you can do Vim things and open it.
- Still not sure how the hell a `gemset` gets selected in rbenv with the symlink.
- Redis global variable: before it was `$redis`, but the [new solution is](https://stackoverflow.com/questions/21075781/redis-global-variable-with-ruby-on-rails):
  - `Redis.current = Redis.new(host: ENV["REDIS_HOST], post: ENV["REDIS_PORT])`

## Piotr Solnica's posts
[Reference](http://solnic.eu/2016/05/22/my-time-with-rails-is-up.html)
[Reference](http://solnic.eu/2016/05/30/abstractions-and-the-role-of-a-framework.html)

- Big Rails codebases: big ball of complex domain logic scattered across multiple layers with complicated view templates.
- Ex: `User.create(params[:user]`
  - This must go through db-specific coercions.
  - Params must be validated.
  - Params might be changed through callbacks.
  - Invalid state results in setting error messages, which depends on the external system.
  - Valid params must be set up as an objects state, potentially setting up associated objects too.
  - A single object or an entire object graph must be stored in the database.
- Rails shouldn't be your application.

- Abstractions
  - The role of an abstraction is to hide complexity. The problem arises when that abstraction has no solid foundation, and under the hood, there are no reusable, lol-level abstractions.
  - Framework: a collection of high-level abstractions. A framework is a joyful experience in the beginning, as you're using common functionality to implement common features. Problems arise when you start to diverge from a framework's conventions.

## Ask HN: What do you look for in a remote developer?
[Reference](https://news.ycombinator.com/item?id=16482351)

- Learn everything you can about the challenges of being a remote employee.
- It's harder to work with a co-located team than with a fully distributed team.
- Strong leadership.
- Productivity, does this person get things done?
- Quality, is the work done to a satisfactory standard?
- Communication.
- Self-starter, self-motivator.
- Knows how to ask for help.
- Github activity and open source activity.
- Active blogging on knowledge or topic related to dev.
- Travel distance to the central location.
- How is status communicated? Are there core hours of availability I need to keep? What are your tools for asynchronous and synchronous communication? Can we set up a regular meeting to check in about my remote work performance?
- Be proactive about communication, work, making sure your manager/lead knows what you have been doing/are doing.
- Ask a lot of questions.
- A willingness to fit in with what's there already.
- Say up front that you're open to travelling from time to time and meeting them face to face.
- Proactive, since you don't have water cooler conversations.
- Self-awareness and self-motivation. To be remote it's a fundamental requirement to have the ability to manage yourself.
