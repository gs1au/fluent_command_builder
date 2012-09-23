require_relative 'command'
require_relative '../../../lib/fluent_command_builder/internal/version'; include FluentCommandBuilder

class CommandDefinition

  attr_reader :versions, :command

  def initialize(stream)
    s = stream.read
    @versions = parse_versions s.first_line
    @command = Command.new s.strip_first_line
  end

  private

  def parse_versions(line)
    versions = line.split_and_strip ','
    versions.each { |v| Version.new v }
    versions
  end

end