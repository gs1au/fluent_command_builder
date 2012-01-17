require 'yaml'
require_relative 'command'
require_relative 'command_definition_line'
require_relative 'option'

class CommandDefinition

  attr_reader :versions, :root_command

  def initialize stream
    yaml = get_yaml stream
    struct = YAML.load yaml
    @versions = struct[0].keys[0].split(',').map { |v| v.strip }
    @root_command = Command.new struct[1].keys[0]
    process_array struct[1].values[0], @root_command
  end

  private

  def get_yaml stream
    IO.readlines(stream).map { |l| l.rstrip.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join "\n"
  end

  def process_array array, parent_command=nil
    array.each do |hash|
      process_hash hash, parent_command
    end
  end

  def process_hash hash, parent_command
    hash.each_pair do |k, v|
      line = CommandDefinitionLine.new k
      if line.command_name.nil?
        parent_command.options << Option.new(k)
      else
        sub_command = Command.new k
        parent_command.sub_commands << sub_command
        process_array v, sub_command unless v.nil?
      end
    end
  end

end