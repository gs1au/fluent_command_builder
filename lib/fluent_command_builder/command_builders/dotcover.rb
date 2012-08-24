# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def dotcover(&block)
    DotCover.create &block
  end
  module DotCover
    COMMAND_NAME = 'dotCover'
    def self.version_detector
      @version_detector ||= StandardVersionDetector.new COMMAND_NAME, 'version'
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      version_module(DotCover).create &block
    end
  end
end