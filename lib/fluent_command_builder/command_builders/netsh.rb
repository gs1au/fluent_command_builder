require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def netsh(&block)
    Netsh.create &block
  end
  module Netsh
    COMMAND_NAME = 'netsh'
    def self.create(&block)
      version_module(Netsh).create &block
    end
  end
end