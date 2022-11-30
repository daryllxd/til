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

# SWC
[Reference](https://swc.rs/)

- SWC takes JS/TS files and outputs valid code that is supported by all major browsers.
