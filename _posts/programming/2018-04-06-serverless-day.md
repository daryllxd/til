---
layout: post
title:  "TIL, 2018-04-06, Serverless Day"
date:   2018-04-06 16:23:58 +0800
categories: programming
summary: "I read a bunch of stuff around serverless architecture."
---

# Musings, AWS/A Cloud Guru.

- `$ service httpd start` to start Apache.

```
#!/bin/bash
yum install httpd -y
yum update -y
aws s3 cp s3://YOURBUCKETNAMEHERE/index.html /var/www/html/
service httpd start
chkconfig httpd on
```

- The autoscaler will create a new instance by itself (he terminated the instance and another one came up).
- Delete the auto-scaling group deletes all instances created by the scaler.
- EC2 Placement Groups [Reference](https://awsinsider.net/articles/2017/06/12/ec2-placement-groups.aspx) [Reference](https://community.teradata.com/t5/Teradata-Database-on-AWS/What-is-a-Placement-Group/td-p/14827)
  - Placement group members are able to communicate with one another in a way that provides low latency and high throughput.
  - When you create a placement group, what you're really doing is creating a capacity reservation for EC2 instances within an availability zone.
  - Low-latency, high-throughput communications between placement group members can only occur across the private interfaces, using the private IP addresses.
  - Limitations:
    - Not all instances can be launched into a placement group.
    - You can't merge placement groups, and you can't move an instance into a placement groups.
- EFS [Reference](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html)

- This is simple, scalable file storage for use with Amazon EC2. Storage capacity is elastic.
- Amazon Elastic File System (Amazon EFS) is a file storage service for EC2 instances. EFS is easy to use and provides a simple interface that allows you to create and configure file systems quickly and easily.
- With EFS, storage capacity is elastic, growing and shrinking automatically as you add and remove files, so your applications have the storage they need, when they need it.
- Features
  - Only pay for the storage you use (can reach petabytes).
  - Can support thousands of concurrent NFS (Network File System) connections.
  - Stored across multiple AZ's within a region.
  - Block-based storage, not object-based storage.

## AWS Lambda

- "AWS Lambda is a compute service where you can upload your code and create a Lambda function. AWS Lambda takes care of provisioning and managing the servers that you use to run the code."
- Languages supported: Node, Python, C#, and Java.
- Lambda costs: First 1 million requests are free, $0.2 per 1 million of requests.
- Duration: From the time your code begins executing until it returns or otherwise terminates. Max threshold: 5 minutes, so break up those functions.
- Advantages: No servers, continuously scaling, super cheap.
- Amazon Echo: This is literally a Lambda function speaking back to you.
- You can actually use this to back up S3 to other buckets.

# Musings, Ruby

- DAS 73, Collapsing Services into Values: Seems like it's easier to have values for things like policies. How about for persistence?
- `Stringex` library? [Reference](https://github.com/rsl/stringex)
- URL helper to create the screencast catalog path.
- `ag` for Ruby files only?
-  `vi `
- Ruby `/\bdef\b/`: Regex for word boundary.
- `\A` : True beginning of strings, not including whitespace.
- DAS 101: Parts of a compiler: Tokenizer, Parser, Generator, another application of recursion is compiling (for parsing and generating code).
- `dot` command in Unix.
- [You can use `*` to check array membership in a `case` expression.](https://stackoverflow.com/a/41325331/848915)

``` ruby
case element
when *array
  ...
else
  ...
end
```

- Use `Set` when calling it an `include?` on an equivalent Array.

# Musings, React

- [Reddit thread for React beginners.](https://www.reddit.com/r/reactjs/comments/89fag9/beginners_thread_easy_questions_april_2018/)
  - Blog: Gatsby. The source of data could be firebase, Wordpress, Markdown, JSON.
  - Formik is faster because redux-forms fires all your reducers on each key stroke (that's actually very important).
  - Storing keys: `localStorage`.
  - Looks good for tables: [Reference](http://allenfang.github.io/react-bootstrap-table/index.html)
  - Semantic-UI?
- More on where to store state?
  - UI state: ephemeral.
  - Application state: the core of the app.
  - Routing state: The view selection state. If you create an app with Redux, embrace the single state tree. Put UI state there as well. But if it gets tedious and frustrating, don't be afraid to put state into the components.
  - Updating component state is usually more performant, just because of the diffing that needs to happen is on a smaller data set and no dispatches need to happen.
  - Local component state can be managed by Redux as well. You can create a store right in your component constructor. The local store would contain the state of this component, and handle actions related to his component.
  - UI state like activity indicator, modal open or close: `setState`?
- [Client vs Server-Side Rendering:](https://medium.freecodecamp.org/what-exactly-is-client-side-rendering-and-hows-it-different-from-server-side-rendering-bd5c786b340d)
  - Server-side rendering is great for SEO. Your content is present before you get it, so search engines are able to index it and crawl it just fine. Something not so with client-side rendering.
  - Client-side: you get a bare-bones HTML document with a JS file that will render the rest of the site using the browser.
  - Server-side pros: SEO, initial page load is faster, great for static sites.
  - Server-side cons: Frequent server requests, full page reloads.
  - Client-side pros: Rich site interactions, fast website rendering.
  - Client-side cons: Low SEO, initial load requires more time, most require an external library.

- [Creating a `routes.js` in React?](https://www.netlify.com/blog/2017/09/26/how-to-build-a-serverless-seo-friendly-react-blog/):

``` js
import React from 'react';
import { Router, IndexRoute, Route } from 'react-router';

import App from './App';
import BlogHome from './BlogHome';
import BlogPost from './BlogPost';

const Routes = (props) => (
  <Router {...props}>
    <Route path="/" component={App}>
      <IndexRoute component={BlogHome} />
      <Route path="/p/:page" component={BlogHome} />
      <Route path="/post/:slug" component={BlogPost} />
    </Route>
  </Router>
);

export default Routes;
```

- [React Helmet:](https://github.com/nfl/react-helmet) for the head parts of the blog.
- Pre-rendering: Netlify, which allows us to keep our code serverless while making sure our blog is optimized for crawlers.
- Github pages vs Netlify? Netlify seems cool.
- [`create-react-app` has a `proxy` option and is a PWA by default.](https://www.youtube.com/watch?v=9t2GWFegnkQ)
