require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def team_foundation(&block)
    TeamFoundation.create &block
  end
  module TeamFoundation
    COMMAND_NAME = 'tf'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::TeamFoundation::COMMAND_NAME
      c = version_module(TeamFoundation).create b
      yield b if block_given?
      c
    end
  end
end