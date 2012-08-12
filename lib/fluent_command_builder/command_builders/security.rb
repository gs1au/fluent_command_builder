require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def security(&block)
    Security.create &block
  end
  module Security
    COMMAND_NAME = 'security'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::COMMAND_NAME
      c = version_module(Security).create b
      yield b if block_given?
      c
    end
  end
end