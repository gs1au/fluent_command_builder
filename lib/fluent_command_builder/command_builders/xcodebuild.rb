require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def xcodebuild(&block)
    XCodeBuild.create &block
  end
  module XCodeBuild
    COMMAND_NAME = 'xcodebuild'
    def self.create(&block)
      version_module(XCodeBuild).create &block
    end
  end
end