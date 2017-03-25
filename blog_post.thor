require './new_blog_post_generator'

class BlogPost < Thor
  desc 'new', 'create new blog post'

  def new
    text_to_insert = NewBlogPostGenerator.new.generate_string
    file_path = "#{DateTime.now.strftime("%Y-%m-%d")}-til.md"
    new_file_name = File.open(file_path, 'w').puts(text_to_insert)
    puts "Created file #{file_path}"
  end
end
