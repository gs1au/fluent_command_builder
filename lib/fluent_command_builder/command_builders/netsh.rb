require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def netsh(&block)
    Netsh.create &block
  end
  module Netsh
    COMMAND_NAME = 'netsh'
    def self.create
      b = UnderlyingBuilder.new
      c = version_module(Netsh).create b
      yield b if block_given?
      c
    end
  end
end