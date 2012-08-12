require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def installutil(&block)
    InstallUtil.create &block
  end
  module InstallUtil
    COMMAND_NAME = 'installUtil'
    def self.create
      b = UnderlyingBuilder.new
      c = version_module(InstallUtil).create b
      yield b if block_given?
      c
    end
  end
end