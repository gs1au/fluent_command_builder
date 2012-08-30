# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_builder_factory')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def simian(&block)
    Simian.create &block
  end
  module Simian
    COMMAND_NAME = 'simian'
    def self.version_detector
      @version_detector ||= DefaultVersionDetector.new COMMAND_NAME
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      f = CommandBuilderFactory.new Simian
      f.create &block
    end
  end
end