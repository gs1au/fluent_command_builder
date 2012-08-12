require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def nunit(&block)
    NUnit.create &block
  end
  module NUnit
    COMMAND_NAME = 'nunit-console'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::COMMAND_NAME
      c = version_module(NUnit).create b
      yield b if block_given?
      c
    end
  end
end