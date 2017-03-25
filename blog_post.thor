class BlogPost < Thor
  desc 'new', 'create new blog post'

  def new
    puts 'I\'m a thor task!'
  end
end
