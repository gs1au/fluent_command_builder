require 'yaml'
require_relative 'command'
require_relative 'node'

module CodeGenerator
  class CommandDefinition

    attr_reader :versions, :command

    def initialize file
      puts file
      raw_text = File.read file
      raw_text = expand_options raw_text
      yaml = get_yaml raw_text
      struct = YAML.load yaml
      @versions = struct[0].keys[0].split(',').map { |v| v.strip }
      @command = Command.new struct[1].keys[0]
      process_array struct[1].values[0], @command
    end

    private

    def expand_options raw_text
      options_index = raw_text =~ /^options:$/
      return raw_text unless options_index

      options = raw_text[options_index, raw_text.length - 1].lines.to_a
      options.delete_at 0
      options.map! { |o| o.strip }

      raw_text = raw_text[0, options_index]
      raw_text.lines.map { |line|
        option_matches = options.select { |o| o if o.start_with? line.strip }
        option_matches.empty? ? line : (line[/^ +/].to_s + option_matches[0])
      }.join "\n"
    end

    def get_yaml text
      text.lines.map { |l| l.rstrip.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join "\n"
    end

    def process_array array, parent_node=nil
      array.each do |hash|
        process_hash hash, parent_node
      end
    end

    def process_hash hash, parent_node
      hash.each_pair do |node_text, child_nodes|
        node = Node.new " #{node_text}"
        parent_node.child_nodes << node
        process_array child_nodes, node unless child_nodes.nil?
      end
    end

  end
end