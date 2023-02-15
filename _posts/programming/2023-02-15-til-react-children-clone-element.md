---
layout: post
title:  "TIL, 2023-02-15, React Children, Clone Element"
date:   2023-02-15 11:31:49 +0800
categories: programming
summary: "React Children, Clone Element"
---

- How do you deal with your brain not being “on?” [Reference](https://news.ycombinator.com/item?id=34779962)
  - I have about 3 to 4 hours a day, twice a week, of top-level cognitive bandwidth.
  - One practical thing is to write a journal with the things you speculate about. Just sentences. Write it down and continue. Write. Continue.
  - I switch to “lower intensity” tasks that could still be useful, like tweaking our Datadog dashboards and monitors, writing or editing some documentation, going through old company announcements, Googling some things, etc.
  - I'm not even suggesting you have an unhealthy lifestyle. It might sound funny, but increasing the amount of protein helped me stabilize my focus for long period of time.

- Possible to do server-side styles like this.  [Reference](https://github.com/vercel/next.js/issues/44125)
[Reference](https://github.com/vercel/next.js/issues/44125#issuecomment-1372270391)
- What is the type of the 'children' prop? [Reference](https://stackoverflow.com/questions/53688899/what-is-the-type-of-the-children-prop) `JSXElement` or `React.PropsWithChildren` or `React.ReactNode`.
- Clone Element [Reference](https://beta.reactjs.org/reference/react/cloneElement)

- Example:

```
<SelectPrimitive.Root onOpenChange={(e) => setIsOpen(e)} {...props}>
  {React.Children.map(children, (x: any) => {
    if (x.type.displayName === SelectTrigger.displayName) {
      return React.cloneElement(
        x,
        { ...x.props, isOpen },
        x.props.children
      );
    }

    return x;
  })}
</SelectPrimitive.Root>
```

- Alternative is to pass data via Context

```
export default function List({ items, renderItem }) {
  const [selectedIndex, setSelectedIndex] = useState(0);
  return (
    <div className="List">
      {items.map((item, index) => {
        const isHighlighted = index === selectedIndex;
        return (
          <HighlightContext.Provider key={item.id} value={isHighlighted}>
            {renderItem(item)}
          </HighlightContext.Provider>
        );
      })}
```


# 5 React Design Patterns You Should Know
[Reference](https://javascript.plainenglish.io/5-react-design-patterns-you-should-know-629030e2e2c7)

- HOC example for loading state:

```
import { useState, useEffect } from 'react';

function withLoading(WrappedComponent) {
  return function LoadingComponent({ isLoading, ...props }) {
    const [loading, setLoading] = useState(isLoading);

    useEffect(() => {
      setLoading(isLoading);
    }, [isLoading]);

    if (loading) {
      return <div>Loading...</div>;
    }

    return <WrappedComponent {...props} />;
  };
}
```
```
const TodoListWithLoading = withLoading(TodoList);

function App() {
  const [isLoading, setIsLoading] = useState(false);

  return (
    <>
      <button onClick={() => setIsLoading(true)}>
        Load Todos
      </button>
      <TodoListWithLoading isLoading={isLoading} />
    </>
  );
}
```

- Render props:

```
function Toggle({ children }) {
  const [isVisible, setIsVisible] = useState(false);

  function handleClick() {
    setIsVisible(!isVisible);
  }

  return children({
    isVisible,
    toggle: handleClick
  });
}

function App() {
  return (
    <Toggle>
      {({ isVisible, toggle }) => (
        <>
          <button onClick={toggle}>Toggle</button>
          {isVisible && <p>This content is visible</p>}
        </>
       )}
      </Toggle>
  );
}
```

- Hooks - the way to use state/React features in functional components.
- Context API - Passes data down to components without passing props through multiple component levels.

# React render props vs custom Hooks
[Reference](https://blog.logrocket.com/react-render-props-vs-custom-hooks/)

- A component, usually called a container component, can delegate how a UI looks to other presentation components and implement only the business logic.
  - Benefits: Code isolation/separation of concerns.
- Issues with render props:
  - Wrapper components.
  - Binding `this`.
  - Classes instead of functions, which are hard to optimize with build tools.
- Render props with pure components
  - No lifecycle methods without involving classes.

```
import React, { useState } from "react";

function EditableItem({ label, initialValue }) {
  const [value, setValue] = useState(initialValue);
  const [editorVisible, setEditorVisible] = useState(false);

  const toggleEditor = () => setEditorVisible(!editorVisible);

  return (
    <main>
      {editorVisible ? (
        <label>
          {label}
          <input
            type="text"
            value={value}
            onChange={event => setValue(event.target.value)}
          />
        </label>
      ) : (
        <span>{value}</span>
      )}
      <button onClick={toggleEditor}>{editorVisible ? "Done" : "Edit"}</button>
    </main>
  );
}
```

# Is mid level engineering as good as it gets?
[Reference](https://www.reddit.com/r/ExperiencedDevs/comments/112re6g/is_mid_level_engineering_as_good_as_it_gets/)

- Our job isn't to write code. It's to solve problems.
  - We need to understand the problem, figure out a solution, and finally implement it in code.
  - If really all you want to do the last bit, not only would that mean you're acting on a junior level (with corresponding pay), you're actually doing the job that will become less and less relevant over time.
  - Taking ambiguous requirements and turning them into valuable software is literally our job I'm afraid.
- A "senior code monkey" isn't a role that software companies find valuable, really.
  - **The true value of an experienced software developer is exactly in the ability to turn a murky and ambiguous need into something well formed that can be implemented, supported and extended over time.** With politics and all...
  - **I find that at some point or another, being a really good implementer becomes the obvious baseline, and you no longer get any credit just because of that. Because why should it? There are much younger, hungrier and cheaper people out there that can write code just as well.**

# How do you become a staff software engineer?
[Reference](https://www.reddit.com/r/ExperiencedDevs/comments/1119c29/how_do_you_become_a_staff_software_engineer/)

- In the end, some company will need to pay you $X to get you to work for them. If that $ window falls within the level of Staff Engineer, then they’ll hire you as a staff engineer.
- Staff at a small startup is not the same as Staff at a big tech firm. The latter takes longer to reach, has more complexity, and generally pays far better.
- What every hiring manager looks for: "Does this candidate have experience doing the things a [role I'm hiring for] does at my company?". Title doesn't matter - experience does. What did you accomplish? Did you have to be told to work on it - or did you propose it? How wide was your influence?
- The real answer is you find a company that will hire you on as staff or you get promoted into it. The former is arguably easier. It all depends on the company's classifications of the role, their need for staff, and their current engineering pool. I've seen staff be easy to get a small companies where it is easier to stand out and hard to get at companies which are able to put overqualified people into their roles.
- There have been multiple times where I've interacted with a person at the same level as me, where they are proposing a high-level idea that will be clearly impractical (either too difficult or just won’t work) when they try to fit it into our gigantic legacy codebase with years and years of tech debt. I think it’s important to stay close to the code and understand the reality of what will actually work.
- **The vast majority of Staff+ engineers I know are people who have a reputation for basically making good things happen wherever they go.** They write code of course, and are usually excellent and highly productive coders, but I know a lot of excellent highly productive coders who don't also have the aura that follows them around of just being the magic missing ingredient to getting a project done successfully and therefore tend to get stuck at senior level because it's simply hard to be so productive that you perform greater than a team level individually.
- Solving cross-team problems, working across groups to figure out hard problems, getting buy in on technical investment from the business, advocating change with measurable outcomes.
  - From a senior position, it looks like a dream job. I get to improve tech all day! I don't do stand ups! Nobody tells me what to do day to day! However, with that latitude comes the responsibility to set a direction that's aligned with what the biz wants to achieve long term.
- Senior is mainly experienced guy to work on any project. Staff is taking one step back from the code and have a larger view on the dependencies and how to pave a path in the software.
- It's different company to company and it comes down to being a force-multiplier. You’re an engineer who empowers other engineers. How you accomplish that totally depends on problems you’re solving. Get good at identifying large problems that have value in being solved. Learn how to drive solutions and get buy-in from all over the place.

# Staying Hands-On, as an Engineering Manager or a Tech Lead
[Reference](https://newsletter.pragmaticengineer.com/p/staying-hands-on)

WIP
