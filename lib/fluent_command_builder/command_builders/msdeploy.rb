require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def msdeploy(&block)
    MSDeploy.create &block
  end
  module MSDeploy
    COMMAND_NAME = 'MSDeploy'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::MSDeploy::COMMAND_NAME
      c = version_module(MSDeploy).create b
      yield b if block_given?
      c
    end
  end
end