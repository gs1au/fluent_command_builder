# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../version_detectors')
require File.expand_path(File.dirname(__FILE__) + '/../internal/underlying_builder')

module FluentCommandBuilder
  module AspnetCompiler
    COMMAND_NAME = 'aspnet_compiler'
    def self.version_detector
      @version_detector ||= StandardVersionDetector.new 'MSBuild', '/version'
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
  end
end