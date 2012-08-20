require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def dotcover(&block)
    DotCover.create &block
  end
  module DotCover
    COMMAND_NAME = 'dotCover'
    def self.create(&block)
      version_module(DotCover).create &block
    end
  end
end