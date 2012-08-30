# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_builder_factory')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def netsh(&block)
    Netsh.create &block
  end
  module Netsh
    COMMAND_NAME = 'netsh'
    def self.version_detector
      @version_detector ||= WindowsVersionDetector.new
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      f = CommandBuilderFactory.new Netsh
      f.create &block
    end
  end
end