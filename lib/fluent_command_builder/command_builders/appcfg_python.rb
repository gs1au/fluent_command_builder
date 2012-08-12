require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def appcfg_python(&block)
    AppCfgPython.create &block
  end
  module AppCfgPython
    COMMAND_NAME = 'appcfg.py'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::AppCfgPython::COMMAND_NAME
      c = version_module(AppCfgPython).create b
      yield b if block_given?
      c
    end
  end
end