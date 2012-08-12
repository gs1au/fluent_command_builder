require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def aspnet_compiler(&block)
    AspnetCompiler.create &block
  end
  module AspnetCompiler
    COMMAND_NAME = 'aspnet_compiler'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::COMMAND_NAME
      c = version_module(AspnetCompiler).create b
      yield b if block_given?
      c
    end
  end
end