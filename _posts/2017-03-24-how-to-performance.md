---
layout: post
title:  "TIL, 2017-03-24: How to Performance"
date:   2017-03-24 08:21:19 +0800
categories: programming
---

- Elixir: Sigils, string interpolation: `~s({ #{quotient}, #{remainder} })`
- Look at [simplecov](https://github.com/colszowka/simplecov) to see which parts of the code are redundantly tested.
- Thinking about [light-service](https://github.com/adomokos/light-service), this looks similar to what I have in mind re: service class philosophy.
- React: `const { player } = this.props` gets the `player` attribute in `props`.
- React: Passing from parent to child: props. Passing from child to parent: Define state in parent, define callback in parent, pass callback as props to child,

      # Parent
      myCallback(dataFromChild) {
        this.setState({ selectedName : dataFromChild});
      }

      render() {
        const rows = players.map(player =>
        <Player callbackFromParent={this.myCallback} player={ player}
        clicked={0}></Player>);
      }

      # Child, in a click handler
      this.props.callbackFromParent(this.props.player.name);

      # Caveat: Parent must explicity bind itself to the callback it made (this is just something in ES6)
      this.myCallback = this.myCallback.bind(this);


*Shameless steal, but this image shows how to share stuff from a child to a parent.* ![alttext](https://cdn-images-1.medium.com/max/2000/1*J5XOQh2WKIl0NFTAMvcVbQ.png)


- JS has native stuff like `['SG', 'PG'].include?(position)` which is cool.

[RubyConf 2015 - How to Performance by Eileen Uchitelle](https://www.youtube.com/watch?v=obyrJ_aJU6A)

- Check test speed not with time but with iterations/sec? Use `benchmark-ips`.
- Ruby-prof, faster than other profiles since it is a C extension.
- Stack-prof: Focused profiling. Problem to pinpoint problems in anonymous modules/dynamically created methods.
- Delegate is bad?
- Running an integration test creates constants, which is bad because it busts the Ruby method cache. It seems like caching is good for increasing performance, but if you can speed things up without a cache, why not.
- `RubyVM` script.
- Allocation Tracer: A tool to figure out how many objects are being created by Ruby and helps not allocate random objects.
- Reducing the number of strings allocated with freeze means you will reduce the time spent in GC. However you should not do this unless you are sure that the string allocation is the one that causes the problem.
