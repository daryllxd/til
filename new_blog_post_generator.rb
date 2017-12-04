require 'active_support'
require 'active_support/core_ext'

class NewBlogPostGenerator
  attr_reader :title, :category, :date

  def initialize(title: nil, category: 'programming', date: DateTime.current)
    @title = title
    @category = category
    @date = date
  end

  def generate_string
    <<-HEREDOC
---
layout: post
title:  "TIL, #{date_format}#{title ? ", #{title}" : ''}"
date:   #{date_and_time_format}
categories: #{category}
---
    HEREDOC
  end

  def date_format
    date.strftime("%Y-%m-%d")
  end

  def date_and_time_format
    date.strftime("%Y-%m-%d %T %z")
  end
end
