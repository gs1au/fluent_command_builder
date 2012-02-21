require 'yaml'
require_relative 'command'
require_relative 'node'

module CodeGenerator
  class CommandDefinition

    VERSION_LINE_INDEX = 0
    COMMAND_LINE_INDEX = 1

    def initialize yaml
      @array = YAML.load yaml
    end

    def versions
      @versions ||= load_versions
    end

    def command
      @command ||= load_command
    end

    private

    def load_versions
      @array[VERSION_LINE_INDEX].keys[0].split(',').map { |version| version.strip }
    end

    def load_command
      hash = @array[COMMAND_LINE_INDEX]
      command = Command.new hash.keys[0]
      process_array hash.values[0], command
      command
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