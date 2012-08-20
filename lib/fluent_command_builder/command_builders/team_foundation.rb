require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../version')

module FluentCommandBuilder
  def team_foundation(&block)
    TeamFoundation.create &block
  end
  module TeamFoundation
    COMMAND_NAME = 'tf'
    def self.create(&block)
      version_module(TeamFoundation).create &block
    end
  end
end