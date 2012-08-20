require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def dev_appserver_python(&block)
    DevAppserverPython.create &block
  end
  module DevAppserverPython
    COMMAND_NAME = 'dev_appserver.py'
    def self.create(&block)
      version_module(DevAppserverPython).create &block
    end
  end
end