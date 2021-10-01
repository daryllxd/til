---
layout: post
title:  "TIL, 2021-09-29 - Some Grokking Observables"
date:   2021-09-29 12:49:38 +0800
categories: programming
summary: "Some grokking Observables"
---


- `expect.assertions` to test that something has been asserted.
- The way to do a spec: re making sure async stuff finished:

```

component.ngOnInit();

localeFacade.selectedLocale$
  .pipe(count())
  .subscribe((numberOfLocaleChanges) => {
    expect(loadLoyaltyProgramsSpy).toHaveBeenCalledTimes(
      numberOfLocaleChanges,
    );

    done();
  });
```

- You can do something like this:

```
await expect(localeFacade.selectedLocale$.pipe(count()).toPromise()).resolves.toEqual(2);
```
