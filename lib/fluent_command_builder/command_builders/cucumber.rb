require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def cucumber(&block)
    Cucumber.create &block
  end
  module Cucumber
    COMMAND_NAME = 'cucumber'
    def self.create(&block)
      version_module(Cucumber).create &block
    end
  end
end