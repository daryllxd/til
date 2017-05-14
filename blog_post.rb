require 'thor'
require 'tzinfo'
require './new_blog_post_generator'

class BlogPost < Thor
  PROGRAMMING_BLOG_POSTS_DIR = './_posts/programming/'

  map 'n' => :new
  map 'o' => :open

  desc 'new', 'create new blog post'

  def new
    text_to_insert = NewBlogPostGenerator.new.generate_string
    file_path = "#{PROGRAMMING_BLOG_POSTS_DIR}#{DateTime.now.strftime("%Y-%m-%d")}-til.md"
    new_file_name = File.open(file_path, 'w').puts(text_to_insert)
    puts "Created file #{file_path}"
  end

  desc 'open', 'opens last blog post'

  def open
    last_file_created_path = Dir
      .glob(File.join(PROGRAMMING_BLOG_POSTS_DIR, '*.*'))
      .max { |a,b| File.ctime(a) <=> File.ctime(b) }

    exec("vim -O2 #{last_file_created_path}")
  end
end
