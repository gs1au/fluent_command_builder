require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def bundle(&block)
    Bundle.create &block
  end
  module Bundle
    COMMAND_NAME = 'bundle'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::COMMAND_NAME
      c = version_module(Bundle).create b
      yield b if block_given?
      c
    end
  end
end