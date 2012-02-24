require 'yaml'
require_relative 'code_generator'
require_relative 'node'

module CodeGenerator
  class Command < Node

    attr_reader :command_name

    def initialize command_text
      hash = command_hash command_text
      command_line = hash.keys[0]
      @command_name = command_line.match(/^([-\w]+)/)[1]
      command_line_without_name = command_line[@command_name.length, command_line.length]
      super command_line_without_name
      process_array hash.values[0], self
    end

    def node_name
      @node_name ||= node_alias || @command_name
    end

    private

    def command_hash command_text
      array = YAML.load command_yaml(command_text)
      array[0]
    end

    def command_yaml command_text
      command_text.split(NEW_LINE).map { |l| l.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join NEW_LINE
    end

    def process_array array, parent_node=nil
      array ||= []
      array.each do |hash|
        process_hash hash, parent_node
      end
    end

    def process_hash hash, parent_node
      hash.each_pair do |node_text, child_nodes|
        node = Node.new " #{node_text}" # todo: remove need for leading space
        parent_node.child_nodes << node
        process_array child_nodes, node
      end
    end

  end
end