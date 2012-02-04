require 'yaml'
require_relative 'node'

class CommandDefinition

  attr_reader :versions, :command

  def initialize stream
    puts stream
    file = File.open stream
    text = file.read
    #puts text
    options_index = text =~ /^options:$/
    options = text[options_index, text.length - 1] unless options_index.nil?

    text = text[0, options_index] if options_index

    if options
      option_lines = options.split "\n"
      option_lines.delete_at 0

      new_lines = text.split("\n").map do |text_line|
        padding = text_line[/^ +/]

        matches = option_lines.select { |o|
          o if o.strip.start_with? text_line.strip
        }

        raise if matches.length > 1
        matches.empty? ? text_line : (padding + matches[0].strip)


      end
      text = new_lines.join "\n"

      #puts text
    end

    yaml = get_yaml text
    struct = YAML.load yaml
    @versions = struct[0].keys[0].split(',').map { |v| v.strip }
    @command = Node.new struct[1].keys[0]
    process_array struct[1].values[0], @command
  end

  private

  #def get_yaml stream
  #  IO.readlines(stream).map { |l| l.rstrip.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join "\n"
  #end

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