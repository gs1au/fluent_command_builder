require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def bundle(&block)
    Bundle.create &block
  end
  module Bundle
    COMMAND_NAME = 'bundle'
    def self.create(&block)
      version_module(Bundle).create &block
    end
  end
end