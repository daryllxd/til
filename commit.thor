class Commit < Thor
  desc 'new', 'create new blog post'

  def new
    commit_format = DateTime.now.strftime("%Y-%m-%d")
    system("git commit -m #{commit_format}")
  end
end
