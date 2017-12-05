require 'thor'
require 'tzinfo'
require 'rb-readline'
require 'pry-byebug'

class Commit < Thor
  desc 'new', 'Create commit with the file format'
  method_option :yesterday,
    aliases: '-y',
    desc: 'Create commit with yesterday\'s date.',
    default: 1,
    type: :numeric,
    lazy_default: true

  def new
    commit_format = if options[:yesterday].class == TrueClass || options[:yesterday].to_i
                      offset = if options[:yesterday].class == TrueClass
                                 1
                               else
                                 options[:yesterday].to_i
                               end

                      format_date(DateTime.now - offset)
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
