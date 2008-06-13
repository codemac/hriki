#########################################
# omg let's render some pages!

require 'find'
require 'hriki/page'
require 'hriki/config'

module Hriki
  class Render
    # The right order?
    # Read meta data, fill in stuff.
    # plug markdown into haml
    # markdown.to_html
    def self.all
      Find.find(File.expand_path(Config.srcdir)) do |path|
        if File.extname(path).downcase != Config.srcext
          puts "Skipping incorrect extenion: #{path}"
        else
          np = Page.new(path)
          puts "Rendered #{np}"
        end
      end
    end
  end
end
