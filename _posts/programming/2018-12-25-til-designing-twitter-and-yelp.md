---
layout: post
title:  "TIL, 2018-12-25, Designing Twitter and Yelp"
date:   2018-12-25 17:12:51 +0800
categories: programming
summary: "Domain stuff"
---

# Musings

- Ingress and egress traffic:
  - Ingress is composed of all the data communications and network traffic originating from external networks and destined for a node in the host network.

# Designing Twitter
[Reference](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5741031244955648)

- Functional requirements: tweeting, following, favorites, timeline, tweets can contain photos and videos.
- Non-functional requirements: available, 200ms for timeline generation, consistency.
- Extended requirements: searching, replying, trending topics, tagging, tweet notification, who to follow, moments.
- Capacity estimation: Dimensional analysis on x daily active users, x million new tweets every day, storage estimates, medial estimates based.
- What a tweet looks like:
  - API key, data, location, user location, media ids, maximum results.
- Huge read database. 325K read requests per second. Traffic will be distributed unevenly.
- Schema: `Tweet`, `User`, `UserFollow`, `Favorite`.
- Sharding: Need to base on user id.
- Caching:
  - Store entire tweet objects for hot users. Cache replacement policy: least recently used.
  - We can try 20-80 rule. Cache 20% of daily read volume from each shard.
  - We can also cache latest data. Like cache servers for tweets from users for the past three days.
- Replication/fault tolerance: multiple secondary database servers.
- Load balance at:
  - Client to application servers and application servers to database replication servers. Simplest: Round Robin approach.
  - Monitoring: New tweets per day/second...?
  - Timeline delivery stats.
  - Average latency seen by user to refresh timeline.
- Trending topics:
  - Cache frequently occurring hashtags or searched queries and keep updating them after every M seconds. Rank trending topics based on frequency of tweets/search queries/re-tweets or likes.
  - Suggestions: First few signals = common followers, common location, common interests, recently increased followship.
  - Moments: Get top news for different websites, figure out related tweets, prioritize them, categorize them using ML.
  - Search: indexing, ranking, retrieval.

# Designing Yelp
[Reference](https://www.educative.io/collection/page/5668639101419520/5649050225344512/5639274879778816)

- Requirements:
  - User should be able to CRUD places.
  - Given a location, find all nearby places.
  - Add feedback/review about a place.
  - Real-time search with minimum latency.
  - Heave search load, more search requests than adding a place.
- Database:
  - Places (location, name, latitude, longitude, description, category).
  - Reviews: location id, review, review text, rating.
- System APIs: Searching.
- Places don't really change that often. So no need to worry about frequent update of the data.
- Solutions:
  - SQL: Index via latitude and longitude.
  - Grids: Divide the map into smaller grids, then make them equal to the distance we would like to query.
  - Dynamic size grids: Let's say we have 500 places in a grid. Whenever a grid reaches the limit, break it down into four grids of equal size and distribute places.
  - Search workflow: find the node that contains the user's location, and if that node has enough desired places, we can return them to the user.
  - Inserting a new place: Insert into the database and the quad tree.
- Sharding:
  - Shard based on regions, such that all places will be stored on a fixed node. Problem: some regions become hot.
  - Shard based on location id?
- Caching: for hot places.
- Ranking: There should be some script that periodically updates what's popular.
