require 'yaml'
require_relative 'string_extensions'
require_relative 'node'

class Command < Node

  attr_reader :command_name

  def initialize(command_def)
    hash = Command.command_hash command_def
    command_text = hash.keys[0]
    command_name = Command.command_name command_text
    node_def = command_text[command_name.length, command_text.length]
    super node_def
    Command.process_array hash.values[0], self
    @command_name = command_name
  end

  def node_name
    @node_name ||= node_alias || @command_name
  end

  private

  def Command.command_name(command_text)
    command_text[/^([-\.\w]+)/, 1]
  end

  def Command.command_hash(command_text)
    yaml = command_text.split(String::NEW_LINE).map { |l| l.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join String::NEW_LINE
    array = YAML.load yaml
    array[0]
  end

  def Command.process_array(array, parent_node=nil)
    array ||= []
    array.each { |hash| Command.process_hash hash, parent_node }
  end

  def Command.process_hash(hash, parent_node)
    hash.each_pair do |node_text, child_nodes|
      node = Node.new " #{node_text}" # todo: remove need for leading space
      parent_node.child_nodes << node
      process_array child_nodes, node
    end
  end

end