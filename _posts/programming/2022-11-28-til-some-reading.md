---
layout: post
title:  "TIL, 2022-11-28"
date:   2022-11-28 13:29:11 +0800
categories: programming
summary: "Where I..."
---

# Chapter 1. Utilizing Cache to Offload Scale to the Frontend
[Reference](https://www.oreilly.com/library/view/intelligent-caching/9781492049067/ch01.html)

- Request:

```
GET /assets/app.js HTTP/1.1
Host: []
Connection: keep-alive
Cache-Control: max-age=0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4)
AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.84
Safari/537.36
Accept: */*
Accept-Encoding: gzip, deflate, sdch
Accept-Language: en-US,en;q=0.8
If-Modified-Since: Thu, 09 Jun 2016 02:49:35 GMT
```

# Angular’s Future Without NgModules – Part 1: Lightweight Solutions Using Standalone Components
[Reference](https://www.angulararchitects.io/aktuelles/angulars-future-without-ngmodules-lightweight-solutions-on-top-of-standalone-components/)

- Why again? Because we needed a way to group building blocks that are used together - for devs and for the Angular compiler. This is so the Angular compiler knows which things are supposed to compile.
  - Community not happy, because it becomes another module system besides ECMAScript.
  - Ivy - The compiled application works without modules at runtime.
- With standalone components, it will be possible to bootstrap a single component via `bootstrapApplication`.
  - `importProvidersFrom` - allows bridging the gap to existing `NgModules`.

# SWC
[Reference](https://swc.rs/)

- SWC takes JS/TS files and outputs valid code that is supported by all major browsers.
