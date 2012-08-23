require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def nunit(&block)
    NUnit.create &block
  end
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
    def self.create(&block)
      version_module(NUnit).create &block
    end
  end
end