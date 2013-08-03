# Generated code. Do not modify.

require 'getversion'
require_relative '../internal/underlying_builder'

module FluentCommandBuilder
  module AppCfgPython
    COMMAND_NAME = 'appcfg.py'
    def self.version(path=nil)
      executable = path ? File.join(path, COMMAND_NAME) : COMMAND_NAME
      GetVersion[executable]
    end
  end
end