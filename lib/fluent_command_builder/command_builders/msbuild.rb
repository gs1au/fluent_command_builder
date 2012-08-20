require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def msbuild(&block)
    MSBuild.create &block
  end
  module MSBuild
    COMMAND_NAME = 'MSBuild'
    def self.create(&block)
      version_module(MSBuild).create &block
    end
  end
end