require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def dev_appserver_python(&block)
    DevAppserverPython.create &block
  end
  module DevAppserverPython
    COMMAND_NAME = 'dev_appserver.py'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::DevAppserverPython::COMMAND_NAME
      c = version_module(DevAppserverPython).create b
      yield b if block_given?
      c
    end
  end
end