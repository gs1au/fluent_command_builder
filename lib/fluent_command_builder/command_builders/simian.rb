require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def simian(&block)
    Simian.create &block
  end
  module Simian
    COMMAND_NAME = 'simian'
    def self.create(&block)
      version_module(Simian).create &block
    end
  end
end