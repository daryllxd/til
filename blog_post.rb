require 'thor'
require 'tzinfo'
require './new_blog_post_generator'

class BlogPost < Thor
  PROGRAMMING_BLOG_POSTS_DIR = './_posts/programming/'

  map 'n' => :new
  map 'o' => :open

  desc 'new', 'create new blog post'

  def new
    categories = ['programming', 'fitness']
    categories.each do |category|
      text_to_insert = NewBlogPostGenerator.new(category: category).generate_string
      file_path = "#{directory_for(category)}#{DateTime.now.strftime("%Y-%m-%d")}-til.md"
      new_file_name = File.open(file_path, 'w').puts(text_to_insert)
      puts "Created file #{file_path}"
    end
  end

  desc 'open', 'opens last blog post'

  def open
    last_file_created_path = Dir
      .glob(File.join(PROGRAMMING_BLOG_POSTS_DIR, '*.*'))
      .max { |a,b| File.ctime(a) <=> File.ctime(b) }

    exec("vim -O2 #{last_file_created_path}")
  end

  private

  def directory_for(category)
    "./_posts/#{category}/"
  end
end
