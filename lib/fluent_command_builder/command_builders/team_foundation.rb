# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def team_foundation(&block)
    TeamFoundation.create &block
  end
  module TeamFoundation
    COMMAND_NAME = 'tf'
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
      version_module(TeamFoundation).create &block
    end
  end
end