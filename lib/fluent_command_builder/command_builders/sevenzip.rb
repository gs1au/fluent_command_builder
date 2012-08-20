require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def sevenzip(&block)
    SevenZip.create &block
  end
  module SevenZip
    COMMAND_NAME = '7za'
    def self.create(&block)
      version_module(SevenZip).create &block
    end
  end
end