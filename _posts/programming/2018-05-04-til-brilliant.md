---
layout: post
title:  "TIL, 2018-05-04, Security Things."
date:   2018-05-04 15:17:57 +0800
categories: programming
summary: "History of JS, Ruby Encoding, `delegate_missing_to`"
---

# Musings, Security

- Answering some problems on Brilliant re: algorithms.
- [Intermediate value theorem:](https://brilliant.org/wiki/intermediate-value-theorem/)
- [Is it more secure to program a client-server system in a language other than English?](https://security.stackexchange.com/questions/184905/is-it-more-secure-to-program-a-client-server-system-in-a-language-other-than-eng)
  - Technically, yes, but it is security by obscurity, which is a bad idea.
  - Google Translate.
  - It makes things harder.
  - All of the built-in functions are in English.
  - People can reverse engineer code from machine code!
  - TL;DR: produce readable code. For the people that should deal with it. In case of doubt, you should prefer the one most people know about.
- [Kerckhoffs's principle](https://en.wikipedia.org/wiki/Kerckhoffs%27s_principle)
  - A cryptosystem should be secure even if everything about the system, except the key, is public knowledge.

- [Security through obscurity](https://en.wikipedia.org/wiki/Security_through_obscurity)
  - A system or component relying on obscurity may have theoretical or actual security vulnerabilities, but its owners or designers believe that if the flaws are not known, that will be sufficient to prevent a successful attack. Security experts have rejected this view as far back as 1851, and advise that obscurity should never be the only security mechanism.

# Musings, JS

- [ECMAScript](https://codeburst.io/javascript-wtf-is-es6-es8-es-2017-ecmascript-dca859e4821c)
  - JS was named JS in the hopes of capitalizing on the success of Java.
  - *ECMAScript is a standard, and JS is the most popular implementation of that standard.* Other implementations: `ActionScript`, V8.
  - Expect an update annually.
- [ES8](https://hackernoon.com/es8-was-released-and-here-are-its-main-new-features-ee9c394adf66)
  - String padding: `'es8'.padStart(5, 'w') // 'wwes8'`, `'es8.padEnd(6, 'w')'`
  - `Object.values` and `Object.entries`.
  - `Object.getOwnPropertyDescriptors`: defined directly on the object, not inherited from the object's prototype.
  - Trailing commas in functional parameter lists and calls.
  - `async function`: declares that it will not block the flow of things.

# Musings, Back-end

- [Link vs URL:](https://www.quora.com/What-is-the-difference-between-Link-Hyperlink-and-URL) URL is the location of the resource, link is the HTML control.
- Thesauruses (Thesauri?) are good for searching things re: similar words.
- Postgres has array data type.  `add_column :users, :emails, :string, array: true, default: '{}'`
  - [Use case: If multiple, but not relation.](https://stackoverflow.com/questions/6843912/what-are-the-proper-use-cases-for-the-postgresql-array-datatype?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
- JSON in DB:
  - Avoid complicated joins, like in Trello.
  - Maintain data that comes from an external service in the same structure and format (as JSON) that arrived to you as.
  - Avoid transforming data before returning it via JSON API.
  - You can index on a key in the JSON hash.
- JSONB vs JSONB: The JSON column will store the JSON string as is, and JSONB will parse it for indexing sake.
- [Encoding in Ruby:](https://www.justinweiss.com/articles/3-steps-to-fix-encoding-problems-in-ruby/).
  - Encoding: a series of bytes. A string's encoding defines the mapping between chars and bytes.
  - To fix encoding things: figure out what encoding your string is in (`string.encoding`).
  - Re-encode with `string.encode('UTF-8', 'Windows-1252')`. (THE ARGUMENTS ARE REVERSED.)
  - Available encodings: `Encoding.name_list.sort`
- [Rails 5.1 has `delegate_missing_to`?](https://www.justinweiss.com/articles/a-decorator-vs-a-subclass/)
  - Subclasses can access private methods, and decorators can only access public methods. This makes it easier for subclasses to break.
  - *Decorators can be especially useful when you’re breaking apart large classes. With decorators, it’s easier to follow the Single-Responsibility Principle – each decorator can do one thing and do it well, and you can combine decorators to get more complex behavior.*
  - Able to set up a test with decorators rather than subclassing (you can test the decorators without having to load heavy weight dependencies, like an ORM).

