---
layout: post
title:  "TIL, 2018-06-04, Index Order Deep Dive"
date:   2018-06-04 12:19:33 +0800
categories: programming
summary: "Article about Fab/Yik Yak, Strongbox, PATCH or PUT?"
---

- [Deep dive into index order.](https://stackoverflow.com/questions/2292662/how-important-is-the-order-of-columns-in-indexes)
  - The order of columns is critical, but it depends on how you query it.
  - Exact seek: when values for a ll columns in the index are specified and the query lands exactly on the row. Order = irrelevant.
  - Range scan: when some columns are specified. But if the inner columns are less relevant, placing low selectivity columns makes them nothing but noise for a seek, and so it makes sense to move them out of the intermediate pages and keep them on the leaf pages.
  - The index on Least-Second Most-Most Selective: can be used to aggregate results on low selectivity columns. (Used for OLAP).

- [Crash and Burn](https://medium.com/s/story/crash-and-burn-how-yik-yak-fab-com-and-vine-failed-to-keep-the-momentum-going-a0f694b17053)
  - Due to bullying and security threats, Yik Yak was faced with external pressure to de-anonymize the app. It was also de-listed on the Android app store top apps.
  - Fab.com pursued growth that they were not ready for. Too fast expansion.
  - Vine: Purchased by Twitter, but Instagram and Snapchat created stories. Lack of unity/leadership on a vision, it didn't ship anything of consequence for a year.
  - While they were able to amass a huge userbase (because of their uniqueness), they did not get product-market fit.
- Fab
  - Celebrate innovation failure, not execution failure.
  - We did not have a highly scalable operating plan and playbook that could be replicated from market to market. Highly people, inventory, and warehouse intensive. Better to probably just make it profitable in the US before expanding overseas.

# Musings

- [Strongbox: Public key encryption for AR.](https://github.com/spikex/strongbox)
- [Patch or PUT?](https://stackoverflow.com/questions/24241893/rest-api-patch-or-put)
  - PATCH: If you're updating an existing resource.
  - PUT: If you're replacing a resource in its entirety. Replacing the resources without side-effects.
