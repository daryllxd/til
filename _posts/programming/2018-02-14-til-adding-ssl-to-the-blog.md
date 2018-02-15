---
layout: post
title:  "TIL, 2018-02-14, Adding SSL to the Blog"
date:   2018-02-14 10:14:52 +0800
categories: programming
summary: "Where I should have just used CloudFlare to begin with, and ended up spending money on Namecheap SSL. Oh well I'll just add use the SSL for an app, not the blog."
---

## Musings

- SSL on the blog: [Reference](https://blog.keanulee.com/2014/10/11/setting-up-ssl-on-github-pages.html), [Reference](https://www.namecheap.com/support/knowledgebase/article.aspx/9607/2210/how-to-set-up-dns-records-for-your-domain-in-cloudflare-account), CloudFlare
- CSR: Certificate Signing Request. Nothing on Github pages + custom domain? Sad. I just used CloudFlare.
- So CloudFlare is being used as a DNS but no idea how to turn on the SSL for CF.
- Turns out I just needed to wait for a bit hehe. Also I like CF better than Namecheap's interface.
- Upgraded nokogiri gem in TIL. Should I just lock version numbers for all gems? I've had bad experiences with this in Node, but IT'S NODE.
- What's weird is that when I updated Bundler and did `bundle install` again, it didn't update the `bundled_with`. I needed to actually do something that will change `Gemfile.lock` for a re-bundle to occur.
- **Read a brilliant article on the Art of Manliness blog re: focusing. I actually practiced it while reading the Smalltalk book.**
- Comparing time [Reference](https://stackoverflow.com/questions/20403063/trouble-comparing-time-with-rspec)
  - You can do `be_within`.
  - You can compare both first with `to_s(:db)`.
  - Actually, `2.minutes` just does `2 * 60`.

## Smalltalk Best Practice Patterns

- Did Matz or Ruby/Rails core team read this? I know DHH did. Much of the principles are in Rails.
- Shortcut Constructor Method: Show how an object can be created.
- Converter Method: Defining methods on objects to convert them from one class to the other. `to_s`, `to_date`.
- Converter Constructor: Same as Converter, but static class. `Date.from_string`.
- Query methods: Predicate method. Better to use `on?` than `status` if there are only 2 statuses.
- Comparing methods: Create a method that accepts another object of the same class as the argument, and code the logic to compare the two. `Comparable` in Ruby.
- Reversing Method: Create another class that makes another method look cool.
- Method Object: If there is a method with a lot of local vars, you can create a new object with those local vars as instance vars, then pass the original object in. `Order.price` becomes `def price PriceCalculator.new(self).process`.
