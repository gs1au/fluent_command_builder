# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_builder_factory')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def rake(&block)
    Rake.create &block
  end
  module Rake
    COMMAND_NAME = 'rake'
    def self.version_detector
      @version_detector ||= StandardVersionDetector.new COMMAND_NAME, '--version'
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      f = CommandBuilderFactory.new Rake
      f.create &block
    end
  end
end