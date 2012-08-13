require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def team_foundation_tee(&block)
    TeamFoundationTEE.create &block
  end
  module TeamFoundationTEE
    COMMAND_NAME = 'tf'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::TeamFoundationTEE::COMMAND_NAME
      c = version_module(TeamFoundationTEE).create b
      yield b if block_given?
      c
    end
  end
end