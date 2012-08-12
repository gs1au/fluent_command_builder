require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def rake(&block)
    Rake.create &block
  end
  module Rake
    COMMAND_NAME = 'rake'
    def self.create
      b = UnderlyingBuilder.new
      c = version_module(Rake).create b
      yield b if block_given?
      c
    end
  end
end