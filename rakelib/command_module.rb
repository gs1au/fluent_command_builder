require_relative 'command'
require_relative 'option'

class CommandModule

  def initialize command_definition
    @version = command_definition[0].keys[0]
    @root_command = Command.new command_definition[1].keys[0]
    process_array command_definition[1].values[0], @root_command
  end

  def write_command_module writer
    w = writer
    w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_builder')]
    w.write_line
    w.write_block 'module FluentCommandBuilder' do
      w.write_block "module #{@root_command.class_name}" do
        w.write_block "module V#{version}" do
          write_command @root_command, w
        end
      end
      w.write_block "def #{@root_command.method_name}#{version}" do
        w.write_line "#{@root_command.class_name}::V#{version}::#{@root_command.class_name}.new"
      end
    end
  end

  private

  def version
    @version.gsub /\D/, ''
  end

  def write_command command, writer
    command.write_command_class writer
    command.sub_commands.each { |c| write_command c, writer }
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
