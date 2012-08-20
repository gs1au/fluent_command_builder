require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def nuget(&block)
    NuGet.create &block
  end
  module NuGet
    COMMAND_NAME = 'NuGet'
    def self.create(&block)
      version_module(NuGet).create &block
    end
  end
end