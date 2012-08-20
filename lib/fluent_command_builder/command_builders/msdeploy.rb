require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def msdeploy(&block)
    MSDeploy.create &block
  end
  module MSDeploy
    COMMAND_NAME = 'MSDeploy'
    def self.create(&block)
      version_module(MSDeploy).create &block
    end
  end
end