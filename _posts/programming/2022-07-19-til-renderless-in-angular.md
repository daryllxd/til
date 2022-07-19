---
layout: post
title:  "TIL, 2022-07-19, Renderless in Angular"
date:   2022-07-19 11:40:16 +0800
categories: programming
summary: "Renderless in Angular"
---

# Going Renderless in Angular: All of the Functionality, None of the Render
[Reference](https://netbasal.com/going-renderless-in-angular-all-of-the-functionality-none-of-the-render-1b105e001c8a)

- 2 ways to provide API for rendering a view - via structural directives or via `exportAs` with a Component/Directive that is purely `ng-content`.
- Structural directive - used like this:

```
type Toggle = {
  giftCards: boolean;
  setOn: Function;
  setOff: Function;
  toggle: Function;
}

@Directive({ selector: '[giftCardListing]' })
export class ToggleDirective implements OnInit {
  on = true;

  @Input('toggleOn') initialState = true;

  constructor(private tpl: TemplateRef<{ $implicit: GiftCardFacade }>,
              private vcr: ViewContainerRef) {
  }

  ngOnInit() {
    this.on = this.initialState;

    this.vcr.createEmbeddedView(this.tpl, {
      $implicit: {
        on: this.on,
        setOn: this.setOn,
        setOff: this.setOff,
        toggle: this.toggle,
      }
    });
  }

  setOn() { this.on = true }

  setOff() { this.on = false }

  toggle() { this.on = !this.on }
}
```

```
<div *toggle="let controller; on: false">
 <button (click)="controller.setOn()">Blue pill</button>
 <button (click)="controller.setOff()">Red pill</button>

 <div>
   <span *ngIf="controller.on">...</span>
   <span *ngIf="!controller.on">...</span>
 </div>
</div>
```

- Using `exportAs`:
  - Sharing state behavior that one component encapsulates with other components that need that same state.
  - The `children` render prop is a function that exposes the component's state to any consumer.
- In angular:

```
@Component({
  selector: 'mouse',
  exportAs: 'mouse',
  template: `
    <div (mousemove)="handleMouseMove($event)">
      <ng-content></ng-content>
    </div>
  `
})
export class MouseComponent {
  private _state = { x: 0, y: 0 };
  get state() {
    return this._state;
  };

  handleMouseMove(event) {
    this._state = {
      x: event.clientX,
      y: event.clientY
    };
  }

}

```

- Mouse is not concerned with the component, it exposes its API by using the `exportAs` property, which tells Angular that we can use this component API in the template.
- We can use the `exportAs` technique to create the toggle component.

# Debugging Memory Leaks in Angular
[Reference](https://blog.bitsrc.io/debugging-memory-leaks-in-angular-4bc7b3eab569)

- Memory leaks debugging: Switch the app pages a bunch of times and check the performance monitor in Chrome's dev tools.
- Record memory snapshots using Dev tools and check the stack trace.
- Check subscriptions and ensure that you unsubscribe.
- In `shareReplay`, if you don't put `refCount: true`, it will not unsubscribe.
- Same with DOM events that are never unregistered.
- `this.renderer.listen` is not unsubscribed.
- Same with Websocket connections.



``` ts
@Input() rdAriaPhoneNumber: string;


@HostBinding('attr.aria-label')
get ariaLabel(): string {
  // Convert 123456789 to 1 2 3 4 5 6 7 8 9
  const phoneNumber = this.rdAriaPhoneNumber.split('').join(' ');
  return this.translateService.instant('accessibility.shared.phone_number', {
    phoneNumber,
  });
}
```
