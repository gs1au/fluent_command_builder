require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def simian(&block)
    Simian.create &block
  end
  module Simian
    COMMAND_NAME = 'simian'
    def self.create
      b = UnderlyingBuilder.new
      c = version_module(Simian).create b
      yield b if block_given?
      c
    end
  end
end
