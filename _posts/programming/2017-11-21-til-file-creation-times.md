---
layout: post
title:  "TIL, 2017-11-21, sort by file creation times/block shorthand."
date:   2017-11-21 17:14:21 +0800
categories: programming
---

- `Dir.glob("*").sort {|a,b| File.ctime(a) <=> File.ctime(b) }` to sort by file creation times.
-  But you can use `.sort_by(&File.method(:ctime))`.
- I guess you can do the `&` shorthand for block with the thing there.
- If you see weird shit (binding.pry becomes nav-tracer) when doing pry, you can `gem uninstall pry-nav`. [Reference](https://stackoverflow.com/questions/26860140/pry-nav-work-unexpectedly)
- Designing a personal site: [Reference](https://kev.inburke.com/kevin/site-redesign/)
  - Traffic sources: family/friends, Google traffic, potential clients/employers/partners, who were referred. Third group = the site plays a big role in helping them make a decision. So the redesign is targeted towards that group.
  - "Who is this person and why should I listen to him?"
  - The standard blog template (posts displayed in reverse chronological order) is only good if the writer updates frequently.
  - You want like a list of the topics that you talk about.
  - So you want to put the best content on my site in front of users.
  - Improve page load time.
  - Display 10 best posts. Then to improve page load you can do minifiers etc.
- You can do `receive.at_least(:once)` or `at_least(:twice)`.
- `let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|bower_components)|(\.(swp|ico|git|svn))$'` to make `ctrlp` faster (after you make it `ag`-based).
- Bundler, you can do the git to be the https link, not the git link. Just to make it secure.
- Sidekiq is super simple and is compatible with Resque.
- Sidekiq: need to specify queues in `sidekiq.yml`.
- Sidekiq: rate limiting is done by the Limiter class.
- Product Hunt: Post 1 minute past minute SF time as the leaderboard refreshes then.
