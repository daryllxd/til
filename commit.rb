require 'thor'
require 'tzinfo'
require 'rb-readline'

class Commit < Thor
  desc 'new', 'Create commit with the file format'
  method_option :yesterday,
    aliases: '-y',
    desc: 'Create commit with yesterday\'s date.',
    lazy_default: true

  def new
    commit_format = if options[:yesterday]
                      format_date(DateTime.now - 1)
                    else
                      format_date(DateTime.now)
                    end
    system("git commit -m #{commit_format}")
  end

  no_commands do
    def format_date(date)
      commit_format = "#{date.strftime("%Y%m%d")}."
    end
  end
end
