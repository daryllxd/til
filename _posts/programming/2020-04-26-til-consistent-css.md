---
layout: post
title:  "TIL, 2020-04-26"
date:   2020-04-26 11:38:16 +0800
categories: programming
summary: "Consistent CSS, How Tech Can Build"
---

# Principles of writing consistent, idiomatic CSS
[Reference](https://github.com/necolas/idiomatic-css)

- General principles: Write your code for maximum clarity, not your personal preference or how to get clever within the spec.
  - Don't try to prematurely optimise your code, keep it readable and understandable.
  - All code in any code-base should look like a single person typed it, even when many people are contributing to it.
  - Strictly enforce the agreed-upon style.
- Format.
  - Use one discrete selector per line in multi-selector rulesets.
  - Include a single space before the opening brace of a ruleset.
  - Include one declaration per line in a declaration block.
  - Lowercase/shorthand hex values?
  - Use single or double quotes consistently. Preference is for double quotes.
  - Quote attribute values in selectors: `input[type="checkbox"]`.
  - Where allowed, avoid specifying units for zero-values.
  - Include a space after each comma in comma-separated property or function values.
  - Include a semi-colon at the end of the last declaration in the end of a declaration block.
  - Separate each ruleset by a blank line.
  - Can do this for long, comma-separated property values:

```
.selector {
    background-image:
        linear-gradient(#fff, #ccc),
        linear-gradient(#f3c, #4ec);
    box-shadow:
        1px 1px 1px #000,
        2px 2px 1px 1px #ccc inset;
}
```

- Preprocessor format considerations:
  - Limit nesting to 1 level deep, reassess any nesting more than 2 levels deep.
  - Avoid large numbers of nested rules, break them up when readability starts to be affected, preferred to avoid nesting that spreads over more than 20 lines.
  - Always place `@extend` lines on the first lines of a declaration block. Same with `@include` statements.
  - Consider prefixing custom functions with a namespace.

# How Tech Can Build
[Reference](https://stratechery.com/2020/how-tech-can-build/)

- "The first problem of being a society of talk, not action, is the inability to even consider hard work as a solution; the second is a blindness to the real trade-offs at play. The third: if talk is all that matters, then policing talk becomes an end to itself.
- Action: Is to bend the world to our will, and not to just accept our fate.
- Ninety-six percent of people who grew up in the Midwest just stay there, but the ones who leave become intensely interested in the future.
- For me, the Internet was a way out, first to learn, and then to live abroad, and now, a way to make a living.
- Software is suited to venture capital. It has significant capital costs, and mostly zero marginal costs, which means there is a big need for upfront investment combined with unlimited people.
- Airbnb: What makes Airbnb function is its software engine, which matches customers to properties, sets prices, flags potential problems. It's a tech company, where if the developers all quit tomorrow, you'd have to shut the company down.
- Has tech (software-centric tech especially) been the primary source of American innovation because it represented the future, or has it been the future because it was the only space where innovation was possible, because of things like inertia and regulatory capture in the real world?
- Tech's seeming exclusivity on innovation has also been about the online space being the one place without the inertia and regulatory capture he decries. IF you're talented and ambitious, what better place to be?
