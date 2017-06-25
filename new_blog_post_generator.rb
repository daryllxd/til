require 'active_support'
require 'active_support/core_ext'

class NewBlogPostGenerator
  attr_reader :title, :category

  def initialize(title: nil, category: 'programming')
    @title = title
    @category = category
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
    DateTime.current.strftime("%Y-%m-%d")
  end

  def date_and_time_format
    DateTime.current.strftime("%Y-%m-%d %T %z")
  end
end
