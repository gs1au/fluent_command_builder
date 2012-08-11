require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def dotcover(&block)
    DotCover.create &block
  end
  module DotCover
    COMMAND_NAME = 'dotCover'
    def self.create
      b = UnderlyingBuilder.new
      c = version_module(DotCover).create b
      yield b if block_given?
      c
    end
  end
end
