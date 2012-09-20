# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  module DevAppserverPython
    COMMAND_NAME = 'dev_appserver.py'
    def self.version_detector
      @version_detector ||= AppEnginePythonVersionDetector.new COMMAND_NAME
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
  end
end