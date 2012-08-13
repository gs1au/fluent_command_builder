require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def security_osx(&block)
    SecurityOSX.create &block
  end
  module SecurityOSX
    COMMAND_NAME = 'security'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::SecurityOSX::COMMAND_NAME
      c = version_module(SecurityOSX).create b
      yield b if block_given?
      c
    end
  end
end