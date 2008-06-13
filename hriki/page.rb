require 'lib/haml'
require 'lib/maruku'
require 'hriki/config'
require 'hriki/preprocess'

module Hriki
  class Page
    def initialize(path)
      @srcfile = File.new(File.expand_path(path))
      @destfile = File.new(File.expand_path(
                                           File.join(
                                                     Config.destdir,
                                                     File.basename(path, Config.srcext)
                                                     ) + Config.htmlext), "w")
      preproc = Preprocess.new(File.read(path))
      mdwnsrc = Maruku.new(preproc).to_html
      hengine = Haml::Engine.new(mdwnsrc)
      @destfile.write(hengine.to_html)
    end
  end
end
