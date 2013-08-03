# Generated code. Do not modify.

require 'getversion'
require File.expand_path(File.dirname(__FILE__) + '/../internal/underlying_builder')

module FluentCommandBuilder
  module Simian
    COMMAND_NAME = 'simian'
    def self.version(path=nil)
      executable = path ? File.join(path, COMMAND_NAME) : COMMAND_NAME
      GetVersion[executable]
    end
  end
end