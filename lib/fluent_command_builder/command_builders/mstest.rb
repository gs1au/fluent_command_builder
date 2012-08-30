# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_builder_factory')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def mstest(&block)
    MSTest.create &block
  end
  module MSTest
    COMMAND_NAME = 'MSTest'
    def self.version_detector
      @version_detector ||= StandardVersionDetector.new COMMAND_NAME, '/help'
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      f = CommandBuilderFactory.new MSTest
      f.create &block
    end
  end
end