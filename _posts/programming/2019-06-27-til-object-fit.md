---
layout: post
title:  "TIL, 2019-06-27, object-fit"
date:   2019-06-27 10:09:26 +0800
categories: programming
summary: "Observable from data, background-size allowance, SCSS interpolating variables"
---

# Object-fit
[Reference](https://css-tricks.com/almanac/properties/o/object-fit/)

- How an element responds to the height and width of its content box.
- Values:
  - `fill`: Stretch the image to fit the content box, regardless of aspect ratio.
  - `contain`: Increase or decrease the size of the image to fill the box whilst preserving its aspect-ratio.
  - `cover`: Fill the height and width of the box to maintain the aspect-ratio, often cropping the image in the process.
  - `none`: Ignore height/width of parent and retain its original size.
  - `scale-down`: Compare the difference between `none` and `contain` in order to find the smallest concrete object size.
- Not supported in IE though!

# Musings

- Creating an observable from data:

``` js
export class MockTransactionService {
  getTransactions(params: HttpParams = new HttpParams()): Observable<Transaction[]> {
    return of(mockTransactions);
  }
}
```

- `background-size: auto 97%` is sort of like `background-cover`, but you'll have an allowance on the right side
- For interpolating variables in `calc`, you can do this: `width: calc(#{$variable-a} - #{$variable-b} - 50px);`
-

