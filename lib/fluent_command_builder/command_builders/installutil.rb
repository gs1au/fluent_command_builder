require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def installutil(&block)
    InstallUtil.create &block
  end
  module InstallUtil
    COMMAND_NAME = 'installUtil'
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
      version_module(InstallUtil).create &block
    end
  end
end