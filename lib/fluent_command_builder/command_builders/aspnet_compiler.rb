# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_builder_factory')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def aspnet_compiler(&block)
    AspnetCompiler.create &block
  end
  module AspnetCompiler
    COMMAND_NAME = 'aspnet_compiler'
    def self.version_detector
      @version_detector ||= MSBuild.version_detector
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      f = CommandBuilderFactory.new AspnetCompiler
      f.create &block
    end
  end
end