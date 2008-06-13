####################################################################
# Hriki -- The happily ruby wiki compiler
#
# Thanks to all the past and current work by the ikiwiki developers,
# but I dislike perl.
##

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'hriki/config'
require 'hriki/render'

module Hriki
  # hriki version
  VERSION = 0.1

  class Opts
    def self.parse(args)
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: #{$0} [options]"

        opts.separator ""
        opts.separator "Specific options:"
        
#        opts.on("-s", "--setup SETUP", "Hriki configuration setup file") do |s|
#          Config.setup = s
#        end
        
#        opts.on("--wikiname WIKINAME", "Name the wiki") do |w|
#          Config.wikiname = w
#        end
        
#        opts.on("-v", "--[no-]verbose", "Turn on verbose output") do |v|
#          Config.verbose = v
#        end

#        opts.on("--[no-]syslog", "Logging with syslog") do |s|
#          Config.syslog = s
#        end
        
#        opts.on("--rebuild", "Rebuild all pages, changed or not") do |r|
#          Config.rebuild = r
#        end

#         opts.on("--refresh", "Refresh changed pages") do |r|
#           Config.refresh = r
#         end

#         opts.on("--post-commit", "Run in post-commit mode") do |p|
#           Config.post_commit = p
#         end
        
#         opts.on("--render FILE", "Render a single file") do |r|
#           Config.render = r
#         end
        
#         opts.on("--[no-]usedirs", "Toggle output with diretories or pages") do |u|
#           Config.usedirs = u
#         end

#         opts.on("--[no-]prefix-directives", "Toggle using the [[! prefix") do |p|
#           Config.prefix_directives = p
#         end

#         opts.on("--getctime", "Get the ctime from the RCS instead of the filesystem") do |c|
#           Config.getctime = c
#         end
        
#         opts.on("--numbacklinks NUM", "Set the number of backlinks at the bottom of the page") do |b|
#           Config.numbacklinks = b
#         end
        
         opts.on("--srcdir SRCDIR", "The directory to draw from!") do |s|
           Config.srcdir = s
         end

         opts.on("--destdir DESTDIR", "The destination!") do |d|
           Config.destdir = d
         end

#         opts.on("--rcs RCS", [:git, :svn, :hg], "Set the RCS type to pull the wiki from") do |r|
#           Config.rcs = r
#         end

#         opts.on("--no-rcs", "Only draw from the file system") do |nr|
#           Config.rcs = nr
#         end
 
#         opts.on("--url URL", "Base url") do |u|
#           Config.url = u
#         end

#         opts.on("--historyurl URL", "RCS history url") do |u|
#           Config.historyurl = u
#         end

#         opts.on("--diffurl URL", "RCS diff url") do |d|
#           Config.diffurl = d
#         end

#         opts.on("--adminemail EMAIL", "Email of the wiki administrator") do |a|
#           Config.adminemail = a
#         end

#         opts.on("--timeformat TIME", "Format the time displays") do |t|
#           Config.timeformat = t
#         end

#         opts.on("--sslcookie", "Only send cookies over an ssl connection") do |s|
#           Config.sslcookie = s
#         end

#         opts.on("--httpauth", "Use http for authentication") do |h|
#           Config.httpauth = h
#         end

#         opts.on("--userdir", "Allows links to go to a subpage, good for users") do |ud|
#           Config.userdir = ud
#         end

         opts.on("--htmlext EXT", "Change the default generated extension") do |e|
           Config.htmlext = e
         end
        
         opts.on("--srcext EXT", "Change the default source file extension") do |e|
           Config.srcext = e
         end
        
#         opts.on("--libdir DIR", "Add a directory to search for libraries") do |l|
#           Config.libdir = l
#         end

#         opts.on("--exclude REGEX", "Exclude the regex of source files") do |e|
#           Config.exclude = e
#         end

#         opts.on("--adminuser USER", "Set the administrative user") do |au|
#           Config.adminuser = au
#         end

#         opts.on("--templatedir DIR", "Directory of templates") do |t|
#           Config.templatedir = t
#         end

#         opts.on("--underlaydir DIR", "Directory for the underlay wiki") do |u|
#           Config.underlaydir = u
#         end

#         opts.on("--plugin x,y,z", Array, "List of plugins to use") do |p|
#           Config.plugin = p
#         end

#         opts.on("--disable-plugin x,y,z", Array, "List of plugns to not use") do |d|
#           Config.disable_plugin = d
#         end

#         opts.on("--pingurl URL", "URL to ping when wiki is updated") do |p|
#           Config.pingurl = p
#         end
        
         opts.separator ""
         opts.separator "Common options:"

         opts.on_tail("-h", "--help", "Show this message") do
           puts opts
           exit
         end

         opts.on_tail("--version", "Show version") do
           puts Hriki::VERSION
           exit
         end
      end
      opts.parse!(args)
    end
  end

  def self.run
    Opts.parse(ARGV)
    Config.srcdir = "~/code/test/hriki/src"
    Config.destdir = "~/code/test/hriki/dest"
    Config.htmlext = ".html"
    Config.srcext = ".mdwn"
    puts "Oh, this wont go well..."
    Render.all
  end
end




Hriki::run if $0 == __FILE__
