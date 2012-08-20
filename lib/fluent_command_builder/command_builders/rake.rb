require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def rake(&block)
    Rake.create &block
  end
  module Rake
    COMMAND_NAME = 'rake'
    def self.create(&block)
      version_module(Rake).create &block
    end
  end
end