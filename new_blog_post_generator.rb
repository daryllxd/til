class NewBlogPostGenerator
  def initialize
  end


  def generate_string

    <<-HEREDOC
---
layout: post
title:  "TIL, 2017-03-25, Fixing this Freaking Blog"
date:   2017-03-25 08:21:19 +0800
categories: programming
---
HEREDOC
  end
end
