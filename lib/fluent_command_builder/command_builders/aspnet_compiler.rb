require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def aspnet_compiler(&block)
    AspnetCompiler.create &block
  end
  module AspnetCompiler
    COMMAND_NAME = 'aspnet_compiler'
    def self.create(&block)
      version_module(AspnetCompiler).create &block
    end
  end
end