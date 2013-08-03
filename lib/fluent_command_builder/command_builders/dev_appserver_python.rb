# Generated code. Do not modify.

require 'getversion'
require File.expand_path(File.dirname(__FILE__) + '/../internal/underlying_builder')

module FluentCommandBuilder
  module DevAppserverPython
    COMMAND_NAME = 'dev_appserver.py'
    def self.version(path=nil)
      executable = path ? File.join(path, COMMAND_NAME) : COMMAND_NAME
      GetVersion[executable]
    end
  end
end