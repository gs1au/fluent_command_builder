# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def appcfg_python(&block)
    AppCfgPython.create &block
  end
  module AppCfgPython
    COMMAND_NAME = 'appcfg.py'
    def self.version_detector
      @version_detector ||= AppEnginePythonVersionDetector.new COMMAND_NAME
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      version_module(AppCfgPython).create &block
    end
  end
end