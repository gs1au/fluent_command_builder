require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def msbuild(&block)
    MSBuild.create &block
  end
  module MSBuild
    COMMAND_NAME = 'MSBuild'
    def self.create
      b = UnderlyingBuilder.new
      c = version_module(MSBuild).create b
      yield b if block_given?
      c
    end
  end
end
