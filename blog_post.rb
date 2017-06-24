require 'thor'
require 'tzinfo'
require './new_blog_post_generator'

class BlogPost < Thor
  BLOG_POST_DEFAULT_CATEGORIES = ['programming', 'fitness']

  map 'n' => :new
  map 'o' => :open

  desc 'new', 'create new blog post'

  def new
    BLOG_POST_DEFAULT_CATEGORIES.each do |category|
      text_to_insert = NewBlogPostGenerator.new(category: category).generate_string
      file_path = "#{directory_for(category)}#{DateTime.now.strftime("%Y-%m-%d")}-til.md"
      new_file_name = File.open(file_path, 'w').puts(text_to_insert)
      puts "Created file #{file_path}"
    end
  end

  desc 'open', 'opens last blog post'

  def open
    last_files_created_for = BLOG_POST_DEFAULT_CATEGORIES.map { |x| last_file_created_for(x) }.join(' ')

    exec("vim -O2 #{last_files_created_for}")
  end

  private

  def last_file_created_for(category)
    last_file_created_path2 = Dir
      .glob(File.join(directory_for(category), '*.*'))
      .max { |a,b| File.ctime(a) <=> File.ctime(b) }
  end

  def directory_for(category)
    "./_posts/#{category}/"
  end
end
