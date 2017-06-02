RSpec.describe NewBlogPostGenerator do
  it 'generates strings' do
    Timecop.freeze(Time.local(2008, 9, 1, 12, 0, 0)) do
      generated_string = NewBlogPostGenerator.new(category: 'fitness').generate_string

      expected_generated_string =
        <<-HEREDOC
---
layout: post
title:  "TIL, 2008-09-01"
date:   2008-09-01 12:00:00 +0800
categories: fitness
---
      HEREDOC

      expect(generated_string).to eq expected_generated_string
    end
  end
end
