# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  module NUnit
    COMMAND_NAME = 'nunit-console'
    def self.version_detector
      @version_detector ||= StandardVersionDetector.new COMMAND_NAME, '/help'
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
  end
end