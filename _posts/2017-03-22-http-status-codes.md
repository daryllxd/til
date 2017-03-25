---
layout: post
title:  "TIL, 2017-03-22, HTTP Status Codes"
date:   2017-03-22 08:21:19 +0800
categories: programming
---

[Source](http://www.restpatterns.org/HTTP_Status_Codes/)

- 422: Right content type, right syntax, but unable to process the instructions.
- 400: Bad syntax. Client should not repeat request.
- 401: User authentication.
- 405: Method Not Allowed, not allowed for the resource.
- Pundit is a bit heavy, just implement your own at first, then use Redis to cache if the roles are complex.
- `before_action`, you can do something like this to not have a lot of instance variables in the controller.

      def found_teebox
        @cached_found_teebox ||= Teebox.find_by(id: params[:teebox_id])
      end

- Postgres set up: `createdb`
- Dump logic: `pg_restore -d gh_dev < gh1-db-backup.tar.gz --role=daryllxd`
- `pip install flask`
