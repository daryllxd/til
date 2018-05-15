---
layout: post
title:  "TIL, 2018-05-14, `light-service` and `dry-validation` Galore"
date:   2018-05-14 18:17:18 +0800
categories: programming
summary: "Also: trying out some front-end tools such as DayJS, styled-components, Redux is nearly there.."
---

# Musings, JS

- `dayjs` is almost like moment!
- Tried out `styled-components` and `prop-types` today.

``` js
Destructuring in React for non-SFC:
const {pomodoro} = this.props;
return (
  <div>
    <h1>{pomodoro.description} {pomodoro.duration}</h1>
  </div>
```

# Musings

- When you `git commit` without the `-m` flag, you don't have to escape the backticks. You only escape backticks when you have the `-m` flag.

# Trying out dry-validation

- I am liking this so far over `strong_params`. This is what my validation looked like:

``` ruby
PomodoroSchema = Dry::Validation.Schema do
  required(:pomodoro).schema do
    required(:description).filled.str?
    required(:duration).filled(gt?: 0).int?
    required(:started_at).filled.date_time?
  end

  required(:activity_tags).each do
    schema do
      required(:id).filled.int?
      required(:description).filled.str?
    end
  end
end
```

# Trying out light-service

- I don't really like the class method thing but whatever.
- You need an organizer to make test `fail_with_rollback!`.
- This is actually nice but I think I have to namespace.
- Appraisals gem (seen in light-service)
