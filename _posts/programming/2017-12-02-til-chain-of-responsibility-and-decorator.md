---
layout: post
title:  "TIL, 2017-12-02, Chain of Responsibility and Decorator"
date:   2017-12-02 02:45:52 +0800
categories: programming
---

- `chain_of_responsibility` pattern?
- Use Chain of Responsibility when you can conceptualize your program as a chain made up of links, where each link can either handle a request or pass it up the chain.
- Decorator: adds new behavior that in effect widens the original interface. COR modifies an existing behavior which is similar to overriding an existing method using inheritance. You can choose to call `super.xxx()` to continue up the chain or handle the message yourself.
- I'd say that a Chain of Responsibility is a particular form of Decorator.
- Decorator cons: it can fail code review if it overcomplicates things. Pros: it separates logic such as emails from saving an object. **You can save an object, without an email, and you can send an email without sending an object.**
- Always rescue from `StandardError`, not `Exception`.
- Bulma, `pg_search` gems.
- Remember: `zsh` has `cdpath` to do `cd ...` autocomplete.
