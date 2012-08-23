require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def bundle(&block)
    Bundle.create &block
  end
  module Bundle
    COMMAND_NAME = 'bundle'
    def self.version_detector
      @version_detector ||= StandardVersionDetector.new COMMAND_NAME, '--version'
    end
    def self.version_detector=(value)
      @version_detector = value
    end
    def self.version(path=nil)
      self.version_detector.version path
    end
    def self.create(&block)
      version_module(Bundle).create &block
    end
  end
end