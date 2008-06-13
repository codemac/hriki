require 'hriki/config'

module Hriki
  module PreProcess
    module PluginSugar
      def def_field(*names)
        class_eval do 
          names.each do |name|
            define_method(name) do |*args| 
              case args.size
              when 0: instance_variable_get("@#{name}")
              else    instance_variable_set("@#{name}", *args)
              end
            end
          end
        end
      end
    end
    
    class Plugin
      @registered_plugins = {}

      class << self
        attr_reader :registered_plugins
        private :new
      end
      
      def self.define(name, &block)
        p = new
        p.instance_eval(&block)
        Plugin.registered_plugins[name] = p
      end

      extend PluginSugar
      def_field :author, :version, :url
    end
    
    def self.load_plugins
      Dir["#{Config.preprocdir}/*.rb"].each { |p| load p }
    end

    def self.run_plugins(str)
      Plugin.registered_plugins.each { |k, p|
        str = p.process(str) if Config.plugin.include(k)
      }
    end
  end
end
