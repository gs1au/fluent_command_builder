require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def nunit(&block)
    NUnit.create &block
  end
  module NUnit
    COMMAND_NAME = 'nunit-console'
    def self.create(&block)
      version_module(NUnit).create &block
    end
  end
end