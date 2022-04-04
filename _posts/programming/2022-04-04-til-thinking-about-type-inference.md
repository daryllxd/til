---
layout: post
title:  "TIL, 2022-04-04, Thinking about Type Inference"
date:   2022-04-04 01:10:10 +0800
categories: programming
summary: "Thinking about Type Inference"
---

# The 3 Skills That Helped Me Become a Better Software Engineer, Continued
[Reference](https://blog.nrwl.io/the-3-skills-that-helped-me-become-a-better-software-engineer-8b06a37becf3)

- Developing good mental models:
  - Programming language.
  - A program.
  - A compiler.
  - Type systems.
  - Functional programming, imperative programming, logical programming.
  - VMs.
- Front-end oriented mental models:
  - Bundling
  - Tree-shaking
  - Change detection
  - Observable objects
  - Virtual DOM
  - CQRS/event sourcing/Redux.
- Developing mental models
  - Functional programming? Elm
  - Build it yourself.

# Taming Dynamic Data in TypeScript
[Reference](https://www.pluralsight.com/tech-blog/taming-dynamic-data-in-typescript/)

- `JSON.parse` type is `any`.
- Use `unknown`, a type-safe counterpart to `any`.
- TS doesn't do validation at *runtime* to make sure your assertion is correct.
- How do other languages handle this? Rust can automatically generate decoders for a given struct at build-time. Elm has a library to manually construct these decoders.
- Manual decoding:
  - `io-ts` and `runtypes`.
- `runtypes`

```
import { Record, String, Number, Static } from 'runtypes'

const UserRuntype = Record({
    name: String,
    age: Number
})

type User = Static<typeof UserRuntype>
```

# Designing the perfect Typescript schema validation library
[Reference](https://colinhacks.com/essays/zod)

- Joi - doesn't support static type inference.
- Yup - supports type inference, but the typings are wrong.
- `io-ts` - super functional/obscure, but good library.
- Zod
  - Use TS generic interface to statically infer the types of your schemas.
  - Eliminate the need to keep static types and runtime validators in sync by hand.
  - Tricks
    - Fields are required unless explicitly marked as optional.
    - Schemas are immutable.
    - Parse, don't validate!
  - Extract TS of any schema with `z.TypeOf<>`.

