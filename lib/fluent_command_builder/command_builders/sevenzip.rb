require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def sevenzip(&block)
    SevenZip.create &block
  end
  module SevenZip
    COMMAND_NAME = '7za'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::COMMAND_NAME
      c = version_module(SevenZip).create b
      yield b if block_given?
      c
    end
  end
end