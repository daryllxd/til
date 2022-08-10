---
layout: post
title:  "TIL, 2022-08-09, `keyof`, maintaining code quality"
date:   2022-08-09 07:42:02 +0800
categories: programming
summary: "`keyof`, maintaining code quality"
---

# How to use the `keyof` operator in TypeScript
[Reference](https://blog.logrocket.com/how-to-use-keyof-operator-typescript/)

- Take an object and produce a string/numeric literal union of its keys.

```
type Staff {
  name: string;
  salary: number;
}
type staffKeys = keyof Staff; // "name" | "salary"
```

```
function getProperty<t, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}
```

- K means any key of the object.
- `extends` means "is accessible" instead of "inherits" K.

```
type OptionsFlags<T> = {
 [Property in keyof T]: boolean;
};
// use the OptionsFlags
type FeatureFlags = {
  darkMode: () => void;
  newUserProfile: () => void;
};

type FeatureOptions = OptionsFlags<FeatureFlags>;
```

- `[Property in keyof T]` denotes the iteration of all property names of type T, and the square bracket is the index signature syntax.

- Conditional type mapping: We only map the non-function properties here to boolean types.

```
type OptionsFlags<T> = {
  [Property in keyof T]: T[Property] extends Function ? T[Property] : boolean };

type Features = {
  darkMode: () => void;
  newUserProfile: () => void;
  userManagement: string;
  resetPassword: string
 };


 type FeatureOptions = OptionsFlags<Features>;
 /**
  * type FeatureOptions = {
    darkMode: () => void;
    newUserProfile: () => void;
    userManagement: boolean;
    resetPassword: boolean;
} */
```

- `keyof` with template string literals

```
type HorizontalPosition = { left: number; right: number };
type VerticalPosition = { up: number; down: number };
type TransportMode = {walk: boolean, run: boolean};

type MovePosition = `${keyof TransportMode}: ${keyof VerticalPosition}-${keyof HorizontalPosition}`;
/* result
type MovePosition = "walk: up-left" | "walk: up-right" | "walk: down-left" | "walk: down-right" | "run: up-left" | "run: up-right" | "run: down-left" | "run: down-right"
*/
```

# 5 recommendations on how to maintain the code quality and keep your self-development, when nobody cares
[Reference](https://mkdev.me/posts/5-recommendations-on-how-to-maintain-the-code-quality-and-keep-your-self-development-when-nobody-cares)

- The programmer who has to compromise on code quality on multiple occasions, after a while will start to write dirty code by default due to the same reason.
- An idea like ‘to write a quality code for myself and only finish the tasks at work’ leads to the same situation. The bad behavioral pattern will begin to form, as the amount of work time exceeds the amount of personal time anyway.
- When I estimate the time for completing the task at hand, I also provide some time for testing. I just don’t say that this time also includes testing time.
- Here’s no comprehensible mentorship. When I solve small problems, I learn to put the patches and work by analogy. *This issue might be solved on the level of the company. For instance, you can raise the question to your employer or find a job where the professional development of the workers is more important.* But none of it has happened yet for me, so I solve everything on my own.
- I made a decision: I need a mentor, so I can improve my work efficiency. The thing is that my colleagues are usually so busy with their own tasks that they don’t have time for me. Furthermore, a mentor can undertake strategic missions of your self-development, while co-workers give you the tips on how to create something that will work.
- If the company does not pay attention to code quality, then the developers who chose their work with the utmost seriousness will eventually leave. The ones who are more concerned about the stability or the specific company, will stay, but work with careless attitude. This way efficiency will stay low no matter how much people they employ.

## HN Comments
[Reference](https://news.ycombinator.com/item?id=16365394)

- Maybe it's possible when you're a senior dev that has control over a project, but as a mid level developer I've never been successful at enforcing any standard - people usually don't care because it would mean additional work and effort on their part and they still get paid the same regardless of the quality of the code.
- My experiences and the conversations I've had with others lead me to the conclusion that: almost all of us have deadlines that we didn't really help set, that we're always struggling to meet those deadlines, and that there is a stupid amount of money on the line that drives these decisions. And, so it goes, "get it done and ship it yesterday" is the commonality that I see.
- Any team striving for a perfect architecture rather than building something that works and then seeing where the bottlenecks are isn't focused on "code quality": they are ignoring best practice in favor of intellectual satisfaction. The best software architecture is any architecture that solves the problem.
- But this is unlikely if you stop to think about how humans behave. Who in an organisation has an incentive to find such an optimum? Shareholders and the board maybe; but they can only drive things by rewarding and punishing middle-level individuals. And they can only reward impact that they can see. *Thus the incentives are to create visible impact which can be spun as a net gain. If that creates technical debt, then that is somebody else's problem.*
- I'm in a similar situation right now: The company thinks that any `feature-wanter` who's loud enough is automatically "one of the product owners" (always plural, always ambiguous) with the ability to tap an outsourced development house for "additional capacity."
- *Quality code is it's own reward. Yes, clean code is more fun to write and work with. But, just think of it as a different kind of optimization problem. If the investment is not going to pay off in the future, then it's not worth doing in the first place.*
- Additionally, I place a premium on “skills learned or perfected” over “bugs closed or features implemented.” If xx is better implemented via an approach I haven’t used before - well, here’s my chance to learn how to do that. Sure, it’ll delay the process. But that’s where technical debt comes from. I may only end up writing ten lines of code that took me 17 hours to figure out and understand, but if those are the right ten lines of code then whatever else I could have or would have written or accomplished in those 17 hours doesn't matter.
- Code quality in organisations where the code was terrible:
  - These organizations reward fires that are put out. They do not reward fires that were prevented from happening in the first place. Those "senior" developers will frequently be rewarded for putting out fires they caused.
  - If you do a lot of work that prevents fires and that means you weren't working on features or bugfixes, you are going to get punished, not rewarded because to the people above you it looked like you were doing nothing.
- In a business setting with hourly pay, deadlines, and co-workers chosen for you, not by you, it makes less sense. People tend to wait until the last minute to give or request feedback which leads to a lot of thrown-away work. Unfortunately, willingness to throw away work becomes a mark of pride at some places.

# Nobody optimizes happiness
[Reference](https://dynomight.net/happiness/)

- Don't worry, I won't tell you to abandon your goals and detach yourself from desire. I'm just observing that even if you achieved your goals, you'd need to make a huge number of decisions to convert them into a “life” and then (hopefully) happiness. And people don't seem to think much about those decisions.
- The typical advice the FIRE community gives these people is to become more intentional about how you structure your life—to the point of having spreadsheets and weekly status reports. Nobody is just “automatically” happy after retirement, you have to build a life.
- To reap the rewards of running, you need to suffer a fairly large short-term decrease. This seems to be true of lots of things, like eating better, taking better care of your appearance, keeping your home well-decorated and orderly, and even maintaining relationships. So maybe happiness improvement is possible, but we don’t have the willpower to leave our leaving local optima.
- Maybe it’s not the achieving stuff that makes us happy, but rather the act of chasing after achievements.

## HN Comments
[Reference](https://news.ycombinator.com/item?id=32266897)

- Having enough money that you don't have to work is never a bad thing, IMO. I have a chunk of money right now from selling some stock, not enough to retire (with my lifestyle), but enough for now. Boredom is a lot easier to solve than not having enough money. (I have kids, and lots of code I want to write; I'll always be busy, and if I'm bored it's because the things I'm busy doing are boring.) I'm sure it's fair to say that retiring takes some adjustment.
- The reason most people don’t prioritise their happiness is because they can’t afford to. Many people on this forum (myself, and by the sounds of things, you too) are massively financially privileged. Many of my friends are too, but many are also very much not. One of my best friends is staying in a relationship she’s unhappy in, because she can’t afford rent otherwise. It’s a shocking reminder for me how lucky I am.
- Mostly I found that it is not so much about earning more money, but about earning enough money to be able to live a normal, healthy life, that contributes to overall happiness. Anything after that may not actually lead to a happier life, because of the effects of hedonistic adaptation mentioned in the article.
- Retirement is a big life transition. Big transitions suck, even if they end up pointing in the direction you'd like.
- I optimized for early financial independence. I did lucrative things and made money (with skills I enjoyed using). Then I used the opportunity to do less lucrative, even more interesting/enjoyable things.
