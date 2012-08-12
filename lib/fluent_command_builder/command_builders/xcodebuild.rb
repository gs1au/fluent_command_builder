require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def xcodebuild(&block)
    XCodeBuild.create &block
  end
  module XCodeBuild
    COMMAND_NAME = 'xcodebuild'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::XCodeBuild::COMMAND_NAME
      c = version_module(XCodeBuild).create b
      yield b if block_given?
      c
    end
  end
end