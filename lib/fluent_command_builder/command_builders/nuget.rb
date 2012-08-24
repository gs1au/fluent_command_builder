# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def nuget(&block)
    NuGet.create &block
  end
  module NuGet
    COMMAND_NAME = 'NuGet'
    def self.version_detector
      @version_detector ||= StandardVersionDetector.new COMMAND_NAME
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      version_module(NuGet).create &block
    end
  end
end