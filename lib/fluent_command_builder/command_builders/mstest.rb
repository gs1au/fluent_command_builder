require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def mstest(&block)
    MSTest.create &block
  end
  module MSTest
    COMMAND_NAME = 'MSTest'
    def self.create(&block)
      version_module(MSTest).create &block
    end
  end
end