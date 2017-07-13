---
layout: post
title:  "TIL, 2017-07-12, LEFT JOIN"
date:   2017-07-12 15:27:09 +0800
categories: programming
---

- RSpec: Think through `when_first_matching_example_defined`.
- Remember: `resource` has no `index`--routes for Rails.
- `ActiveRecord::Base.clear_all_connections!` and `ActiveRecord::Base.connection.query_cache.clear` to clear AR cache.
- Problem with putting changes in `rake db:migrate`--future developers might run `rake db:schema:load` or `rake db:reset`, thus not running the insert scripts. Better to just make a tasks for data migration. [Reference](https://robots.thoughtbot.com/data-migrations-in-rails)
- Some cool things: `print "."` when running the migration scripts. Then `puts "All done"` when migration scripts are done.

- Big ass SQL join:

``` ruby
User
  .select('users.*, buddy_relationships.buddy_id AS is_buddy,
      contact_relationships.receiver_user_id AS is_contact')
  .joins('LEFT JOIN buddy_relationships ON buddy_relationships.buddy_id = users.id')
  .joins('LEFT JOIN contact_relationships ON contact_relationships.receiver_user_id = users.id')
  .where("buddy_relationships.user_id = #{user.id} OR contact_relationships.sender_user_id = #{user.id}")
```

### Time Zones

``` ruby
Time.now: Time on my machine
Time.zone = 'Fiji': Set Time.zone to Fiji.
Time.now: Will still get the system time.
Time.zone.now: Get the current time in that zone.
Time.current: Same.
Time.now.in_time_zone: Same
Date.today: System date
Time.zone.today: Application zone.
Time.zone.tomorrow: Correct tomorrow.
1.day.from_now: Correct tomorrow.
```

### Don't Use

``` ruby
Time.now
Date.today
Date.today.to_time
Time.parse(...)
Time.strptime(...)
```

#### Use

``` ruby
Time.current
2.hours.ago
Time.zone.today
Date.current
1.day.from_now
Time.zone.parse...
Time.striptime(...).in_time_zone
```

