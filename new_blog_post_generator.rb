class NewBlogPostGenerator
  attr_reader :title

  def initialize(title: nil)
    @title = title
  end

  def generate_string
    <<-HEREDOC
---
layout: post
title:  "TIL, #{date_format}#{title ? ", #{title}" : ''}"
date:   #{date_and_time_format}
categories: programming
---
    HEREDOC
  end

  def date_format
    DateTime.now.strftime("%Y-%m-%d")
  end

  def date_and_time_format
    haha = DateTime.now.strftime("%Y-%m-%d %T %z")
  end
end
