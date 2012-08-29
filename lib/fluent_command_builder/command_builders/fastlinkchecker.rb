# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def fastlinkchecker(&block)
    FastLinkChecker.create &block
  end
  module FastLinkChecker
    COMMAND_NAME = 'conlinkchecker'
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
      version_module(FastLinkChecker).create &block
    end
  end
end