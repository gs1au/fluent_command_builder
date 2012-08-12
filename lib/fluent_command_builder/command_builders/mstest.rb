require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def mstest(&block)
    MSTest.create &block
  end
  module MSTest
    COMMAND_NAME = 'MSTest'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::MSTest::COMMAND_NAME
      c = version_module(MSTest).create b
      yield b if block_given?
      c
    end
  end
end