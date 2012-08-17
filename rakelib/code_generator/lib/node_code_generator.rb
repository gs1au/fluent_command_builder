require_relative 'string_extensions'
require_relative 'node'
require_relative 'node_code_names'

class NodeCodeGenerator

  def initialize(node, command, writer)
    @node = node
    @command = command
    @writer = writer
  end

  def render
    render_branch_node if @node.branch?
    render_leaf_node if @node.leaf?
  end

  def render_method
    @writer.write_method node_code_names.method_name, node_code_names.method_args do
      if @node.branch?
        render_branch_node_method_body
      else
        render_leaf_node_method_body
        @writer.write_line 'yield @b if block_given?'
        @writer.write_line 'self'
      end
    end
  end

  private

  def render_branch_node
    @writer.write_class node_code_names.class_name, 'CommandBase' do
      render_constructor
      @node.child_nodes.each do |n|
        generator = NodeCodeGenerator.new n, @command, @writer
        generator.render_method
      end
    end
    render_child_nodes
  end

  def render_leaf_node
    render_child_nodes
  end

  def render_child_nodes
    @node.child_nodes.each do |n|
      generator = NodeCodeGenerator.new n, @command, @writer
      generator.render
    end
  end

  def render_constructor
    @writer.write_method 'initialize', 'underlying_builder', node_code_names.method_args do
      @writer.write_line 'super underlying_builder'
      render_leaf_node_method_body
    end
  end

  def render_branch_node_method_body
    args = node_code_names.initializer_values
    @writer.write_line "#{node_code_names.class_name}.new #{args.join ', '}"
  end

  def render_leaf_node_method_body
    @node.fragments.each { |f| write_append_statement f }
  end

  def write_append_statement(fragment)
    return if fragment.fragment_text.empty?
    unless_condition = fragment.arg_names.map { |a| "#{a.snakecase}.nil?" }.join ' or '
    statement = "@b.append #{append_arg fragment}"
    statement << " unless #{unless_condition}" if fragment.optional? and fragment.has_args?
    @writer.write_line statement
  end

  def append_arg(fragment)
    value = fragment.fragment_text.gsub(/<.+?>/) do |m|
      arg = CommandArgument.new m
      format_args = [arg.arg_name.snakecase, [arg.delimiter, arg.key_value_separator].compact.map { |v| "'#{v}'" }].flatten
      "\#{@b.format #{format_args.join ', '}}"
    end
    value.include?('#{') ? %Q["#{value}"] : "'#{value}'"
  end

  def node_code_names
    @node_code_names ||= NodeCodeNames.new @node
  end

end