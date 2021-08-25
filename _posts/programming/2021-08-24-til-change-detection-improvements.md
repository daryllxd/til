---
layout: post
title:  "TIL, 2021-08-24, Change Detection Improvements"
date:   2021-08-24 12:50:16 +0800
categories: programming
summary: "Change detection, detach"
---

# How in-depth knowledge of change detection in Angular helped me improve application's performance
[Reference](https://indepth.dev/posts/1039/how-far-are-you-willing-to-go-to-improve-angular-performance)

- Performance Analyzer in Chrome Developer Tools.
- `ChangeDetectionStrategy.onPush` means that the components will be checked only if its Input references are changed, also if there is an Event which originates from component or its children.
- Caching `getRowClass`.

```
 ngOnChanges() {
    this.rows.forEach((row) => {
      if (!this._rows[row.id] || this._rows[row.id].version !== row.version) {
        this._rows[row.id] = row;
        this.setRowClasses(row);
      }
    });
  }

  private setRowClasses(row) {
    this.rowClasses[row.id] = {
      'active': this.trService.isActive(row),
      'rejected': this.trService.isRejected(row),
      'accepted': this.trService.isAccepted(row)
    };
  }

  public getRowClasses(row: Transaction) {
    return this.rowClasses[row.id];
  }
```

- Making sure that a change on one row will not make its sibling do Change Detection - we can disable the change detection for the component once it becomes inactive via `this.changeDetectorRef.detach`.
- `ngFor` - we should not run a `Differ` on a list with items which never change.

- To sum up, here is the list of changes I've applied:
  - updated change detection strategy to `onPush` for both parent and child components;
  - cached the most expensive methods for child components so we don’t recalculate the unchanged output every change detection run;
  - disabled change detection for the elements which don’t change anymore;
  - moved all completed elements to another collection so that `ngFor` internally runs faster.
