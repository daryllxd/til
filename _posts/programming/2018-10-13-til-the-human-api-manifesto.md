---
layout: post
title:  "TIL, 2018-10-13"
date:   2018-10-13 16:13:01 +0800
categories: programming
summary: "Jeff Bezos' API Manifesto."
---

# The Human API Manifesto
[Reference](http://calnewport.com/blog/2018/09/18/the-human-api-manifesto/)

- Bezos's mandate in 2002:
  - All themes will henceforth expose their data and functionality through service interfaces.
  - Teams must communicate with each other through these interfaces.
  - There will be no other form of interprocess communication allowed: no direct linking, no direct reads of another team's data model, no shared-memory model, no back-doors whatsoever. The only communication allowed is via service calls over the network.
  - Doesn't matter what tech they use.
  - All service interfaces, without exception, must be designed from the ground up to be externalizable. The team must plan and design to be able to expose the interface to developers in the outside world, no exceptions.
- This is expensive in the short term (need to develop, + the time that could have been dedicated to create projects producing immediate revenue). But because of this, the company was able to operate its systems much more efficiently.
- Could this apply to people?
  - ***Attention capital theory: the most valuable capital resource in a knowledge work organization is the brains of its employees. To be more specific, the capacity of those brains to focus on information, process it through neurons, and then output more valuable information.***
  - Success in knowledge work is about getting the best possible return on this attention capital, much as success in the industrial sector is about getting the best possible return from physical capital.
  - Most knowledge work: not that good, since the workflow depends on constant, unstructured communication.
  - Structured nature of communication eliminates the requirement to constantly monitor general-purpose communication channels which help minimize attention residue.
  - Well-documented human APIs make it easier to integrate new hires or seamlessly hand off responsibilities when someone is sick or away on vacation, enabling a much more flexible deployment of an organization's attention capital.

# What is the purpose of Node.js module.exports and how do you use it?
[Reference](https://stackoverflow.com/questions/5311334/what-is-the-purpose-of-node-js-module-exports-and-how-do-you-use-it)

- `module.exports` is the object that's actually returned as the result of a `require` call. `exports` variable is set to that same object so in the module code, you do this:

``` js
var myFunc1 = function() { ... };
var myFunc2 = function() { ... };
exports.myFunc1 = myFunc1;
exports.myFunc2 = myFunc2;

And in the calling code you do this:

var m = require('./mymodule');
m.myFunc1();

You can also alias the name:

// Exporter
var myVeryLongInternalName = function() { ... };
exports.shortName = myVeryLongInternalName;
// add other objects, functions, as required

// Caller
var m = require('./mymodule');
m.shortName(); // invokes module.myVeryLongInternalName
```

- NodeJS uses the CommonJS module system which works like this:
  - If a file wants to export something, it has to declare it using `module.export` syntax.
  - If a file wants to import something, it has to declare it through `require('file')` syntax.
- Modules get cached.
- Modules are loaded in synchronous.
