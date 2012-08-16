require_relative 'command'
require_relative '../../../lib/fluent_command_builder/util.rb'; include FluentCommandBuilder

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
    versions.each { |v| raise "#{v} is not a valid version number." unless is_valid_version? v }
    versions
  end

end