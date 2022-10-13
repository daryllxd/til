---
layout: post
title:  "TIL, 2022-10-12, Type Generics"
date:   2022-10-12 10:28:43 +0800
categories: programming
summary: "Type Generics and some Angular template"
---

# TypeScript Intermediates - Type Generics
[Reference](https://unicorn-utterances.com/posts/typescript-type-generics)

- Type generics - allow you to accept arbitrary data instead of strict typing, making it possible to broaden a type's scope.
- This function accepts strings and numbers and returns them too.

```
function returnProp(returnProp: string | number): string | number {
  return returnProp;
}

But will yield an error cause TS doesn't know if it's a string or number

// ❌ This will yield an error
// > Operator '+' cannot be applied to types '4' and 'string | number'.
const newNumber = shouldBeNumber + 4;

```

- Potential solution: function overloading, but then it only works for number and string. Any other type wouldn't work.

```
function returnProp(returnProp: number): number;
function returnProp(returnProp: string): string;
// While this seems repetitive, TS requires it.
// Otherwise, it will complain:
// This overload signature is not compatible with its implementation signature.
function returnProp(returnProp: string | number): string | number {
  return returnProp;
}
```

- Real solution: Use generic - define a type variable `T`, then tell TS both the parent and the return type should be the same type.

```
function returnSelf<T>(returnProp: T): T {
  return returnProp;
}

// This is allowed now

interface LogTheValueReturnType<originalT> {
loggedValue: string;
original: originalT;
err: Error | undefined;
}
```

- Cool solution: We want to pass in an object that we know has `{ time: Date }` in it, but not lose its type information.

```
interface TimestampReturn<T> {
isPast: boolean;
isFuture: boolean;
obj: T
}
const checkTimeStamp = <T extends {time: Date}>(obj: T): TimestampReturn<T> => {
  let returnVal: TimestampReturn<T> = {
isPast: false,
        isFuture: false,
        obj
  }

  if (obj.time < Date.now()) {
    returnVal.isPast = true;
  } else {
    returnVal.isFuture = true;
  }

  return returnVal;
}
```

# Angular Templates — From Start to Source
[Reference](https://unicorn-utterances.com/posts/angular-templates-start-to-source#view-references)

- `ViewChild` - can grab reference to `ng-template`. Or anything else in the view tree.
- It will only read the first result that Angular can find.
- `read` property to figure out what type of reference do we want - component, view container, or element.
- `ViewChildren` - returns array-like and there is an iterator interface.
- We have `changes` observable property that allows you to listen for changes to the query.
- `ContentChild` difference vs `ViewChild` is that VC only works for items defined in the template.
- Big advantage is passing through context from parent to child via `let`.
- Host views:
- Component `template` vs `ng-template`:
- Template allows Input to pass stuff into them.
- `ng-template` allows passing in via `let`.
- Template reference variables can be accessed within the view itself and child views, but not the parent views.
- Timings with `ViewChildren`.
- `DoCheck` lifecycle method - triggers every time Angular detects data changes, regardless if the data does update to update the item on-screen or not.
- Angular does not like values being updated directly within `AfterViewInit`. Angular runs change detection after an `ngDoCheck`, and does not like to re-check if there are things to update on-screen.
  - `static: true` means you can access the reference of the `ViewChild` in the `OnInit` lifecycle method. **But, the ViewChild never updates after the `DoCheck` lifecycle check.**
- Simplest example of embed views:

```
@Component({
  selector: 'my-app',
  template: `
    <ng-template #templ>
      <ul>
        <li>List Item 1</li>
        <li>List Item 2</li>
      </ul>
    </ng-template>
    <div #viewContainerRef class="testing">
    </div>
  `
})
export class AppComponent implements OnInit {
  @ViewChild('viewContainerRef', {read: ViewContainerRef, static: true}) viewContainerRef;
  @ViewChild('templ', {read: TemplateRef, static: true}) templ;
  ngOnInit() {
    this.viewContainerRef.createEmbeddedView(this.templ);
  }
}
```

- The template `#templ` is created as a *sibling*, not a child of `viewContainerRef`.
- Passing different implicit contexts, and appending 2 templates to `ViewContainerRef`.

```
import { Component, ViewContainerRef, OnInit, AfterViewInit, ContentChild, ViewChild, TemplateRef , EmbeddedViewRef} from '@angular/core';
@Component({
  selector: 'my-app',
  template: `
  <ng-template #templ let-i>
        <li>List Item {{i}}</li>
        <li>List Item {{i + 1}}</li>
    </ng-template>
    <ul>
      <div #viewContainerRef></div>
    </ul>
  `
})
export class AppComponent implements OnInit {
  @ViewChild('viewContainerRef', {read: ViewContainerRef, static: true}) viewContainerRef;
  @ViewChild('templ', {read: TemplateRef, static: true}) templ;
  ngOnInit() {
    const embeddRef3: EmbeddedViewRef<any> = this.viewContainerRef.createEmbeddedView(this.templ, {$implicit: 3});
    const embeddRef1: EmbeddedViewRef<any> = this.viewContainerRef.createEmbeddedView(this.templ, {$implicit: 1});
  }
}
```

- You can use `ng-container` with `#viewContainerRef` to act like React Fragment.
- Can move also with the `viewContainerRef.move` method.
- In a directive, you can get the `ViewContainerRef` via DI.

```
@Directive({
  selector: '[renderTheTemplate]'
})
export class RenderTheTemplateDirective implements OnInit {
  constructor (private parentViewRef: ViewContainerRef, private templToRender: TemplateRef<any>) {}
  ngOnInit(): void {
    this.parentViewRef.createEmbeddedView(this.templToRender);
  }
}
```

- Structural directives:
  - When you add `*` to the start of the directive, you're telling Angular to wrap that element in an `ng-template` and pass that directive to the newly created template.
  - This case: whenever the conditional changes, the parent view ref needs to do a change detect.

```
@Directive({
  selector: '[renderThisIf]'
})
export class RenderThisIfDirective {
  constructor (private templ: TemplateRef<any>,
              private parentViewRef: ViewContainerRef) {
  }
  private _val: TemplateRef<any>;
  @Input() set renderThisIf(val: TemplateRef<any>) {
    this._val = val;
    this.update();
  }
  update(): void {
    if (this._val) {
      this.parentViewRef.createEmbeddedView(this.templ);
    } else {
      this.parentViewRef.clear();
    }
  }
}
```
