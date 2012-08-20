require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def security_osx(&block)
    SecurityOSX.create &block
  end
  module SecurityOSX
    COMMAND_NAME = 'security'
    def self.create(&block)
      version_module(SecurityOSX).create &block
    end
  end
end