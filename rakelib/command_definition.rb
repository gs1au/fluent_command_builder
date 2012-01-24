require 'yaml'
require_relative 'node'

class CommandDefinition

  attr_reader :versions, :command

  def initialize stream
    yaml = get_yaml stream
    struct = YAML.load yaml
    @versions = struct[0].keys[0].split(',').map { |v| v.strip }
    @command = Node.new struct[1].keys[0]
    process_array struct[1].values[0], @command
  end

  private

  def get_yaml stream
    IO.readlines(stream).map { |l| l.rstrip.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join "\n"
  end

  def process_array array, parent_node=nil
    array.each do |hash|
      process_hash hash, parent_node
    end
  end

  def process_hash hash, parent_node
    hash.each_pair do |node_text, child_nodes|
      node = Node.new node_text
      parent_node.child_nodes << node
      process_array child_nodes, node unless child_nodes.nil?
    end
  end
end