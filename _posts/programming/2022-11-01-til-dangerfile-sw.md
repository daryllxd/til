---
layout: post
title:  "TIL, 2022-11-01, Dangerfile and Service workers"
date:   2022-11-01 14:49:32 +0800
categories: programming
summary: "Dangerfile CI learnings, Service workers"
---

# Dangerfile CI learnings

- Passing info from Node script to Jenkins - need to exit code + try catch. No idea if there's a better way.
- Then, keep on try catch until you're able to get to Jenkins, and do conditionals based on that error message.

# What Are Service Workers and How to Use Them?
[Reference](https://rajat-m.medium.com/what-are-service-workers-and-how-to-use-them-e993c1f497e6)

- Web application can - cache content so that it's accessed offline, push notifications, and can provide periodic background sync for data backup.
- SW is a JS file that can be used to cache certain assets of your application.
  - Control how network requests are handled in the app.
- Steps:
  - Installing/registering a service worker. Can see it on Cache Storage in Application tab in dev tools.
  - Activating service worker: Mostly for deleting.
  - Fetching the required content from cache: Responsible for fetching cached assets, in order to allow an app to function offline.
- Registering an SW: In the index.html tag.
