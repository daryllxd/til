---
layout: post
title:  "TIL, 2017-09-18"
date:   2017-09-18 18:58:37 +0800
categories: programming
---

- More refactoring lessons.
- `ls -R` to see all files recursively.
- `touch` on an existing file will change the access time.
- Hard link, must be same physical drive.
- Symbolic link: `cp -s file file2`, and `ln -s file file2`.
- `file myfile` determine the kind of file.
- `tail` is used to view the last 10 lines of a file.
- `head` is used to view the first 10 lines of a file.
- `ps aux` to list the currently running processes.
- `top -o cpu` to list processes by CPU.
- `pkill` to kill a process, `xkill` to kill any non-responsive window.
- Postgres has a `server.log` which can only be deleted if Postgres is not running anymore.

## React

- `yarn` is Facebook's answer to `npm`.
- `https://github.com/facebookincubator/create-react-app/` as the app template.
- Create an `.env` file in the base directory.
- `yarn add react-router` to add the react router.
- This is sad, but declaring a function in JavaScript: `aw = function() { 1 + 1 }`.

## Destroy All Software, Collapsing Services into Values and How and Why To Avoid Nil

``` ruby
class Subscription < Struct.new(:id, :type)
  attr_reader :allow_export
  alias_method :allow_export?, :allow_export

  def initialize(id, type)
    @id = id
    @type = type
    @allow_export = active? && type == 'business'
  end

  def active?
    id.present?
  end
end
```

- Resolving nils--introduce a new domain concept (Null Object?)

