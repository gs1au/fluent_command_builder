require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def installutil(&block)
    InstallUtil.create &block
  end
  module InstallUtil
    COMMAND_NAME = 'installUtil'
    def self.create(&block)
      version_module(InstallUtil).create &block
    end
  end
end