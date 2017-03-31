---
layout: post
title:  "TIL, 2017-03-30, Query Objects Yo"
date:   2017-03-30 23:33:40 +0800
categories: programming
---

- 50km on the bike today.
- Finally did some query objects. The great this is they join

``` ruby
      def initialize(relation: resource_class.all)
        @relation = relation
      end

      def query
        relation
          .joins(:submatch_participants)
          .group(Arel::Table.new(:submatches)[:id])
          .having(Submatch.arel_table[:id].count.eq(2))
      end

      private

      def resource_class
        Submatch
      end
```

- Updated Alfred shortcuts to include some common links that I open: CircleCI, CodeClimate, and Next 24.

[![https://gyazo.com/11acc447155c40fbf0381c104197bd52](https://i.gyazo.com/11acc447155c40fbf0381c104197bd52.png)](https://gyazo.com/11acc447155c40fbf0381c104197bd52)

- Screenshots should be taken with Gyazo so I can transfer them directly to markdown.
