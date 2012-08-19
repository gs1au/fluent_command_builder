require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def nuget(&block)
    NuGet.create &block
  end
  module NuGet
    COMMAND_NAME = 'NuGet'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::NuGet::COMMAND_NAME
      c = version_module(NuGet).create b
      yield b if block_given?
      c
    end
  end
end