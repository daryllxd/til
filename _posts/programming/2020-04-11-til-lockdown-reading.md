---
layout: post
title:  "TIL, 2020-04-11"
date:   2020-04-11 08:57:16 +0800
categories: programming
summary: "Angular Tests, Angular Universal, Subscribe"
---
# Introduction to Unit Testing in Angular
[Reference](https://alligator.io/angular/introduction-unit-testing/)

- `TestBed` is the main utility available for Angular-specific testing.
- `TestBed.configureTestingModule` is used in the `beforeEach` block and give it an object with similar values as a regular `NgModule` for `declaration`, `provider`, and `import`. Then, you can chain a call to `compileComponents` to tell Angular to compile the declared components.
- Creating a component fixture: `TestBed.createComponent`. `debugElement` gives you access to the internals of the component fixture.
- Wrapping the callback function of a test or the first argument of `beforeEach` with async allows Angular to perform asynchronous compilation and wait until the current inside of the async block to be ready before continuing.

# Angular Testing: `async` and `fakeAsync`
[Reference](https://alligator.io/angular/testing-async-fakeasync/)

- `async` tells Angular to run the code in a dedicated test zone that intercepts promises.
- `whenStable`: this allows us to wait until all promises have been resolved to run our expectations.

```
import { Component } from '@angular/core';


@Component({
  selector: 'app-root',
  template: `<h1<{{ title }}</h1>

  <button (click)="setTitle()" class="set-title">
    set title
  </button>
  `
})
export class AppComponent {
  title: string;

  setTitle() {
    new Promise(resolve => {
      resolve('One crazy app!');
    }).then((val: string) => {
      this.title = val;
    });
  }
}
```

- When the button is clicked, the title property is set using a promise. And to test the functionality using `async` and `whenStable`:

```
describe('AppComponent', () => {
  it('should display title', async(() => {
    debugElement
      .query(By.css('.set-title'))
      .triggerEventHandler('click', null);

    fixture.whenStable().then(() => {
      fixture.detectChanges();
      const value = debugElement.query(By.css('h1')).nativeElement.innerText;
      expect(value).toEqual('One crazy app!');
    });
  }));
});
```

- `fakeAsync`: this makes things faster in the tests.
- `tick` is inside a `fakeAsync` block to simulate the passage of time.
- `flush`: Simulates the passage of time until the macrotask queue is empty. `Macrotask` includes things like `setTimeouts` , `setIntervals`, and `requestAnimationFrame`.

```
  it('should increment in template after 5 seconds', fakeAsync(() => {
      debugElement
        .query(By.css('button.increment'))
        .triggerEventHandler('click', null);

      tick(2000);
      fixture.detectChanges();
      let value = debugElement.query(By.css('h1')).nativeElement.innerText;
      expect(value).toEqual('0'); // value should still be 0 after 2 seconds

      tick(3000);
      fixture.detectChanges();

      const value = debugElement.query(By.css('h1')).nativeElement.innerText;
      expect(value).toEqual('1'); // 3 seconds later, our value should now be 1
    }));
```

# Server Side Rendering with Angular Universal
[Reference](https://alligator.io/angular/angular-universal/)

- Single-page Apps (SPA) are aptly named - there is literally only on single HTML document that is served initially to a client. Any new views that are required in the app are generated solely on the client via JS.
- SSR: You lose the ability for web crawlers to traverse  your app, and there is slower performance while the app is loading.
- ***Angular Universal let's you run your Angular app on the server. This enables you to serve static HTML to the client.*** With Angular Universal, the server will pre-render pages and show your users something, while the client-side app loads in the background. Then, once everything is ready client-side, it will seamlessly switch from showing the server-rendered pages to the client-side app.
- SSR with Angular Universal requires changes in both the client application and the server stack to work. For this article, we'll assume this is a brand new Angular application.
- Just about any server technology can run a Universal app, but it has to be able to call a special function, `renderModuleFactory()`, provided by Angular Universal, which is itself a Node package, so Node makes most sense.

## Adding Universal to the App:

- `$ ng add @nguniversal/express-engine --clientProject {{ name of your project }}`

- `angular.json`: `projects.{{project-name}}.architect.build.options.outputPath` has changes to `dist/browser`, and a new `projects.{{project-name}}.architect` is added, called `server`. This lets the Angular CLI know about our server/Universal version of the Angular application.
- `package.json`: Some new scrips: `compile:server`, `server:ssr`, `build:ssr`, `build:client-and-server-bundles`.
- `server.ts`: The NodeJS Express server.
- `main.ts`: Modified so that the browser version of the app won't start bootstrapping until the Universal-rendered pages have been fully loaded.
- `main.server.ts`: `AppServerModule`, which is the entry point of the Universal version of the application.
- `tsconfig.server.json`: Where to find the entry module.
- `app.module.ts`: Modified to execute static method `withServerTransition` on the imported `BrowserModule`. This tells the browser version of the application that the client will be transitioning in from the server version at some point.
- `app.server.module.ts`: The root module for the server version only.
- Starting: `npm run build:ssr && npm run serve:ssr`

## Things to Note

- Since a Universal app runs on the server and not in a browser:
  - Check your use of `window`, `document`, or `location`. Actually, you should be using Angular abstractions `Document` or `Location` anyway.
  - If you really need to, then import functions `isPlatformBrowser` and `isPlatformServer` from `@angular/common`, injecting the `PLATFORM_ID` token into the component, and running the imported functions to use whether you're on the server or the browser.
  - Don't use `nativeElement` to manipulate attributes on the element, use `Renderer2` and use the method there.,
  - Browser event handling won't work, your app won't respond to click events - however, any link generated from a `routerLink` will work.
  - Avoid `setTimeout`.
  - Make all URLs for server requests absolute. Requests for data from relative URLs will fail when running from the server.
