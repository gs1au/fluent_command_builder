require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def cucumber(&block)
    Cucumber.create &block
  end
  module Cucumber
    COMMAND_NAME = 'cucumber'
    def self.create
      b = UnderlyingBuilder.new
      c = version_module(Cucumber).create b
      yield b if block_given?
      c
    end
  end
end
