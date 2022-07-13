---
layout: post
title:  "TIL, 2022-07-07, Future Facing Front-end Architectures"
date:   2022-07-07 13:21:35 +0800
categories: programming
summary: ", Future Facing Front-end Architectures"
---

# Building future facing frontend architectures
[Reference](https://frontendmastery.com/posts/building-future-facing-frontend-architectures/#top-down-vs-bottom-up)

- Top down - starting the project - components higher in the hierarchy.
  - This is quite straightforward and is the mental model developers working on feature development tend to have when structuring components.
  - "Draw boxes around the UI - these will be come your components".
  - Example:

``` tsx
    // get list from API call somewhere up here
    // and then transform into a list we pass to our nav component
    const navItems = [
        { label: 'Home', to: '/home' },
        { label: 'Dashboards', to: '/dashboards' },
        { label: 'Settings', to: '/settings' },
    ]
    ...
    <SideNavigation items={navItems} />
```

  - This will work, but it can get problematic.
- Where it goes wrong:
  - If there is a new requirement, is it worth it to make a new abstraction, or to just add a new property aka "if statement"?
  - Lesson from Ruby: "Existing code exerts a powerful influence. Its very presence argues that it is both correct and necessary. This code represents effort expended, and we are motivated to preserve the value of this effort. The sad truth is that the more complicated the code is, the more we feel pressure to retain it.
  - ***The easy thing to do does not often lead to simplicity.***
- What happens next:
  - Add sub navigation, back button, reordering via drag and drop, and the original component become too big.
- Organic growth of these monolithic components:
  - The arise through premature abstraction.
  - They prevent code re-use across teams - everyone has their own implementation.
  - Bloating bundle sizes - big chunk components need to be loaded at once.
  - Poor runtime - reconciliation in React will take a longer time for big components.
- Bottom up:

```
    <SideNavigation>
        <Section>
            <NavItem to="/home">Home</NavItem>
            <NavItem to="/projects">Projects</NavItem>
            <Separator />
            <NavItem to="/settings">Settings</NavItem>
            <LinkItem to="/foo">Foo</NavItem>
        </Section>
        <NestedGroup>
            <NestedSection title="My projects">
                <NavItem to="/project-1">Project 1</NavItem>
                <NavItem to="/project-2">Project 2</NavItem>
                <NavItem to="/project-3">Project 3</NavItem>
                <LinkItem to="/foo.com">See documentation</LinkItem>
            </NestedSection>
        </NestedGroup>
    </SideNavigation>
```

- Pros:
  - Different teams that use the component only pay for the components they actually import and use.
  - We can also easily code split and async load elements that are not an immediate priority for the user.
  - Rendering performance is better and easier to manage because the only the sub-trees that change due to an update need to re-render.
  - We can create and optimize individual components that have a specific responsibility within the nav. It’s also more scalable from a code structure point of view, because each component can be worked on and optimized in isolation.
- Bottom-up design is initially slower, but in the long term faster, because it's more adaptable. You can more easily avoid hasty abstractions.

- Avoiding monolithic components
  - Balancing single responsibility vs DRY.
  - Inversion of control.

```
    // A "top down" approach to a simple button API
    <Button isLoading={loading} />

    // with inversion of control
    // provide a slot consumers can utilize how they see fit
    <Button before={loading ? <LoadingSpinner /> : null} />
```

    - Second example is more flexible because `LoadingSpinner` no longer needs to be a dependency inside the Button package.
    - First example: We pass down data and let the component handle it.
    - Second example: More work but more flexible and performant approach.
  - Open for extension: You want to export specialised components with a consumable API, built up from smaller primitives.
- ***Questions for resilient components:***
  - Is it accessible?
  - What does it look like when it's loading?
  - What data does it depend on?
  - How does it handle errors?
  - What happens if only partial amount of data is avail?
  - What happens if mount component multiple times?
  - How composable is it?

- Building resilient components:
  - Avoid props that contain implementation details.
  - Be cautious of configuration via props. Things like `SideNavigation navItems={items}` are hard to scale. You'll want more config options/props for forking logic.
- Breaking down monolithic components:
  - Rewrite things and incrementally migrate to the new component.
  - Break down things incrementally.
- Techniques:
  - Remove flag
  - Replace conditional with polymorphism
  - Pull up field
  - Rename variable
  - Inline function

# Inversion of Control
[Reference](https://kentcdodds.com/blog/inversion-of-control)

- Adding an argument, prop, option to the reusable code/logic for that use case to be supported. Rinse and repeat, and the "reusable" code is now a nightmare to use and maintain.
- Issues:
  - Bundle size/performance: More code because more conditionals?
  - Maintenance overhead: How to use it for a specific use case.
  - Implementation complexity: it's never just an "if" statement.
  - API complexity: New arguments/props you add to your reusable code makes it harder for end users to use.
- Inversion of control: Make your abstractions do less stuff, and make your users do that instead.
- "Contrived" example: Instead of having conditional statements for a filter function, make the comparator function a prop/something that gets passed in.
- No IOC:

``` ts
  filter([0, 1, undefined, 2, null, 3, 'four', ''])
  filter([0, 1, undefined, 2, null, 3, 'four', ''], {filterNull: false})
  filter([0, 1, undefined, 2, null, 3, 'four', ''], {filterUndefined: false})
  filter([0, 1, undefined, 2, null, 3, 'four', ''], {filterZero: true})
  filter([0, 1, undefined, 2, null, 3, 'four', ''], {filterEmptyString: true})
```

- With IOC - passing the comparator function inside - we can have much more unique use cases.

```
filter(
  [0, 1, undefined, 2, null, 3, 'four', ''],
  el => el !== null && el !== undefined,
)
filter([0, 1, undefined, 2, null, 3, 'four', ''], el => el !== undefined)
filter([0, 1, undefined, 2, null, 3, 'four', ''], el => el !== null)
filter(
  [0, 1, undefined, 2, null, 3, 'four', ''],
  el => el !== undefined && el !== null && el !== 0,
)
filter(
  [0, 1, undefined, 2, null, 3, 'four', ''],
  el => el !== undefined && el !== null && el !== '',
```

- Is it a worse API? ***You can use them to re-implement the former's API and it's pretty trivial to do so.***
  - Then they can wrap our function and do it in a higher-level way.
- Real world use case: Compound components and state reducers.

- `Next time you find yourself adding another if statement to the coreBusinessLogic function of your app, consider how you can invert control and move the logic to where it's being used (or if it's being used in multiple places, then you can build a more custom-made abstraction for that specific use case).`

# ViewChild: When to use static: true or false?
[Reference](https://stackoverflow.com/questions/56359504/how-should-i-use-the-new-static-option-for-viewchild-in-angular-8)

- Most cases: false so that query matches that depend on binding resolution (`*ngIf`, etc.) will be found.

```
@Component({
  template: `
    <div *ngIf="showMe" #viewMe>Am I here?</div> <----------- Can be missed
    <button (click)="showMe = !showMe"></button>
  `
})
export class ExampleComponent {
  @ViewChild('viewMe', { static: false })
  viewMe?: ElementRef<HTMLElement>;

  showMe = false;
}
```

- `static: true` - resolve the query once the view has been created, but before change detection runs. So changes with ngIf, ngFor wouldn't reflect in your view.
- `static: false` resolves after `ngAfterViewInit()` or `ngAfterContentInit()`. The result will be updated when there are changes to  your view.

# ContentChild and ContentChildren in Angular
[Reference](https://dev.to/this-is-angular/contentchild-and-contentchildren-in-angular-3bne)

- ***ContentChild and ContentChildren as property decorators. They are used to query or help get a reference to the projected content.***
- ContentChild - only for projected content.

```
<app-my-cards>
    <div #header ngProjectAs='header'>Card Header</div>
    <span id='card-sub-header'>Card Sub Header</span>
    <div class="card-body">
        This is a card Body!!!
    </div>
    <footer title="card-footer">
        Card Footer.
    </footer>
</app-my-cards>
```

- Things we can do: We can do something like `this.cardHeaderData.nativeElement.style.color = 'blue';`.
- Accessing projected content:
  - When accessing a projected component, we can just pass the name of the component.
  - When accessing the projected component, using the property, you can call a method present inside that projected content component.
  - When accessing a native element, we need to add a reference and pass the same reference to the `ContentChild`.
- For more than 1 instance, we need to do `ContentChildren`.

# Why is it not a good practice to write initialization logic in the constructor in angular 2
[Reference](https://stackoverflow.com/questions/58902898/why-is-it-not-a-good-practice-to-write-initialization-logic-in-the-constructor-i)

- Unhandled errors in the constructor will escape the call stack and go jump the call stack to the first error handler. Parent components being constructed will also be crashed.
- [Reference](https://coderonfleek.medium.com/constructor-vs-ngoninit-angular-2-components-b1a33db0be65) This is because the constructor is called to initialize the class and not the component. The constructor is called before `ngOnInit` , at this point the component hasn't been created yet, only the component class has being instantiated thus your dependencies are brought in, but your initialization code will not run.

# Flaw: Constructor does Real Work
[Reference](http://misko.hevery.com/code-reviewers-guide/flaw-constructor-does-real-work/)

- Logic in the constructor needs subclasses/mocks to inherit unwanted behaviour. This prevents instantiation/altering collaborators in the test.
- Warning signs:
  - `new` keyword in a constructor.
  - Static methods calls.
  - Anything more than a field assignment.
  - Object not fully initialised after the constructor finishes.
  - Control flow in the constructor.
  - Instead of a factory/builder, there are object construction there.
- Why is this a flaw?
  - Violates SRP: It suggests only one way to configure the class, closing off reuse opportunities.
  - Testing is harder, since constructor code gets executed every time the object gets instantiated.
  - Forces collaborator.
- Recognising the flaw:
  - If something in the constructor contains anything you would like to replace with a test double.
  - Static method calls.
  - Loops in the constructor will always be instantiated.
- Fixing the flaw:
  - Do not create collaborator in the constructor, but pass them in.
  - Manual DI using Builder/Factory.
