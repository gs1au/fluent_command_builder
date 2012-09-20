require File.expand_path(File.dirname(__FILE__) + '/command_builder_config')
require File.expand_path(File.dirname(__FILE__) + '/underlying_builder')

module FluentCommandBuilder
  class CommandBuilder < UnderlyingBuilder

    def initialize(command, version=nil)
      command_builder_config = CommandBuilderConfig.new command, version
      super command_builder_config
    end

  end
end