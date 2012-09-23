# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../internal/version_detectors')
require File.expand_path(File.dirname(__FILE__) + '/../internal/underlying_builder')

module FluentCommandBuilder
  module SecurityOSX
    COMMAND_NAME = 'security'
    def self.version_detector
      @version_detector ||= OsxVersionDetector.new
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
  end
end