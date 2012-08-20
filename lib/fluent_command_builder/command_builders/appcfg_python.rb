require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def appcfg_python(&block)
    AppCfgPython.create &block
  end
  module AppCfgPython
    COMMAND_NAME = 'appcfg.py'
    def self.create(&block)
      version_module(AppCfgPython).create &block
    end
  end
end