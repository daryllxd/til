require 'rb-readline'
require 'pry-byebug'
require 'thor'
require 'tzinfo'
require './new_blog_post_generator'

class BlogPost < Thor
  BLOG_POST_DEFAULT_CATEGORIES = ['programming']

  map 'n' => :new
  map 'o' => :open

  desc 'new', 'create new blog post'
  method_option :yesterday,
    aliases: '-y',
    desc: 'Create blog_post with yesterday\'s date.',
    default: 0,
    type: :numeric,
    lazy_default: true

  def new
    BLOG_POST_DEFAULT_CATEGORIES.each do |category|
      offset = if options[:yesterday].class == TrueClass
                 1
               else
                 options[:yesterday].to_i
               end

      date_of_blog_post = (DateTime.current - offset)

      text_to_insert = NewBlogPostGenerator.new(category: category, date: date_of_blog_post).generate_string
      file_path = "#{directory_for(category)}#{date_of_blog_post.strftime("%Y-%m-%d")}-til.md"
      new_file_name = File.open(file_path, 'w').puts(text_to_insert)
      puts "Created file #{file_path}"
    end
  end

  desc 'open', 'opens last blog post'

  def open
    last_files_created_for = BLOG_POST_DEFAULT_CATEGORIES.map { |x| last_file_created_for(x) }.join(' ')

    exec("vim -O #{last_files_created_for}")
  end

  private

  def last_file_created_for(category)
    Dir.glob(File.join(directory_for(category), '*.*')).sort_by(&File.method(:ctime)).last
  end

  def directory_for(category)
    "./_posts/#{category}/"
  end
end
