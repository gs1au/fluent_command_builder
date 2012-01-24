require_relative 'command_argument'

class Node

  attr_accessor :node_text, :child_nodes

  def initialize node_text
    @node_text = node_text
    @child_nodes = []
  end

  def write writer
    return if leaf?
    w = writer
    w.write_block "class #{class_name}" do
      w.write_block 'def initialize command=nil' do
        w.write_line '@b = CommandBuilder.new command'
        w.write_line "@b.append '#{@node_text}'"
        w.write_line 'self'
      end
      @child_nodes.each { |n| write_method n, w }
      w.write_block 'def to_s' do
        w.write_line '@b.to_s'
      end
    end
  end

  def class_name
    @node_text.gsub(/[\W_]/, ' ').gsub(/[A-Z]/, ' \0').strip.split(' ').map { |s| s.capitalize }.join
  end

  def method_name
    @node_text.split(/ |-/).join('_').downcase
  end

  def branch?
    @child_nodes.length > 0
  end

  def leaf?
    @child_nodes.length == 0
  end

  def args
    @node_text.scan(/<.+?>/).flatten.map { |m| CommandArgument.new m }
  end

  def node_name
    ruby_case(@node_text.match(/(\w[ \w-]*)/)[1].gsub(/\W/, ' '))
  end

  private

  def write_method node, writer
    method_name = node.node_name
    method_args = node.args.map { |a| ruby_case a.arg_name }.join ', '

    writer.write_block "def #{method_name} #{method_args}" do
      if node.branch?
        write_branch_node_method_body node, writer
      else
        write_leaf_node_method_body node, writer
      end
    end
  end

  def write_branch_node_method_body node, writer
    writer.write_line "#{node.class_name}.new self"
  end

  def write_leaf_node_method_body leaf, writer
    writer.write_line append_statement(leaf)
    writer.write_line 'self'
  end

  def append_statement node
    append_arg = node.node_text.gsub /<.+?>/ do |m|
      arg = CommandArgument.new m
      format_args = [ruby_case(arg.arg_name), [arg.delimiter, arg.key_value_separator].compact.map { |v| "'#{v}'" }].flatten
      "\#{@b.format #{format_args.join ', '}}"
    end
    append_arg = append_arg.include?('#{') ? %Q["#{append_arg}"] : "'#{append_arg}'"
    "@b.append #{append_arg}"
  end

  def ruby_case value
    value.gsub(/[A-Z]/, ' \0').strip.gsub(' ', '_').downcase
  end

end