require 'hriki/preprocess'

Hriki::PreProcess::Plugin.define "basic_clean" do
  author "Jeff Mickey"
  version "0.1"
  url "http://codemac.net"

  def process(str)
    str.gsub(/\[\[[^\[]+\]\]/, '')
  end
end
