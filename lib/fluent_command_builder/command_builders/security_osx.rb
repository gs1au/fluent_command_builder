# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_builder_factory')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def security_osx(&block)
    SecurityOSX.create &block
  end
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
    def self.create(&block)
      f = CommandBuilderFactory.new SecurityOSX
      f.create &block
    end
  end
end