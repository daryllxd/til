---
layout: post
title:  "Welcome to Jekyll!"
date:   2017-02-17 19:21:18 +0800
categories: jekyll update
---
## Programming

- Don't use backticks when committing. `gc "Use 'hello'` will try to execute hello command. (if the ' was a backtick, it's hard to parse in jekyll)."
- API design, if you are going to add contacts with a bunch of emails or something, better to just fail all rather than pass the valid ones and report the fails, that way you can't add twice. Front-end will get errors one by one.

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: http://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
