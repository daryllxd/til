---
layout: post
title:  "TIL, 2018-04-27, Reading on Event Sourcing and Kafka"
date:   2018-04-27 16:20:11 +0800
categories: programming
summary: "Plus the Rope data structure, filtering items, and Facebook Ads/Pixel."
---

# Reading articles

- [Rope (data structure)][https://en.wikipedia.org/wiki/Rope_(data_structure)]
  - A data structure composed of smaller strings to store and manipulate a very long string.
- [Design Pattern for Filtering a Collection of Items?](https://stackoverflow.com/questions/1622474/design-pattern-for-filtering-a-collection-of-items)
  - Using views: Lazy programming, where you create an object which can access the original collection, and knows the filter, but will not make a computation as long as nothing is required.
  - Collections: iterators + strategy.
  - You have a bunch of filters, then use a strategy to get the filters to apply.
  - You may have to cache the thing?
  - Composite: You can build the total filter block by block using a Composite.

# Understanding Apache Kafka
[Reference](https://www.youtube.com/watch?v=k-7lz6Ex354)

- Moving your data into your cluster: processing historical data, processing done in real time as it comes in.
- General publish/subscribe messaging system: they store messages from publishers, publish them to a stream of data (topic), and consumers subscribe to one or more topics, and receive data as it's published. Because it has different consumers, each consumer can pick up when it needs to.
- Ex of producers: apps that generate data/stuff that pushes data into your Kafka cluster.
- Ex of consumers: need to be able to read the data that is coming into the cluster.
- Database can also send stuff to Kafka when a row changes, or it can accept stuff from the cluster.
- Stream processors: transform data as it comes in, ex: raw log lines go in, extract that, and republish this into Kafka.
- This is a hard problem!
- How it scales: Multiple servers with multiple processes, and consumers can have messages distributed amongst them.

# Musings, Back-end, Ruby

- [Event Sourcing:](https://kickstarter.engineering/event-sourcing-made-simple-4a2625113224) Events, aggregates, calculators, reactors.
- Inheritance: obsoleted by contain + delegate, tagging.
- Encapsulation: Problem is pass by reference vs pass by value.
- [Do you put `robots.txt`, `humans.txt`, `sitemap.xml`, or any extra files on your websites?](https://www.reddit.com/r/webdev/comments/8f2p5z/do_you_put_robotstxt_humanstxt_sitemapxml_or_any/)
  - On `robots.txt`, `sitemap.xml` and `favicon.ico`: Always have them just so your server doesn't get flooded.
  - Tracking stack: Google Analytics, Hubspot Script, FB Pixel, `PureChat` script, FB og tags, Twitter card markup, `PureChat` widget, Sumo for heatmapping.
  - Off-page: Google Search console.
  - Google crawlers for e-commerce.
  - `manifest.json` for progressive web apps.
- You can format markdown with brackets!

# Facebook Ads/Facebook Pixel
[Reference]((https://www.shopify.com/blog/72787269-relax-advertising-on-facebook-just-got-a-lot-easier)

- Pixels: Used to drop a cookie that will track visitors on your website so you can advertise to them later (retargeting).
- ***Tracking custom audiences from your website.***
  - It tracks the movements of any visitors on your website who are simultaneously logged into Facebook, recording which pages on your site they visit, which pages they don't visit, and when they visit.
  - You can't share to a specific website visitor, but you can advertise to groups of users based on shared behavior.
  - People who have visited your website in the past 24 hours, people who've visited a specific page on your website, people who have visited your website in the past 180 days but have not been back in 30 days, and people who have visited a specific page but not another specific page.
- Google Search Console
- Google Tag Manager
