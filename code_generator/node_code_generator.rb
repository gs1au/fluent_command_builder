require_relative 'code_generator'
require_relative 'node'

module CodeGenerator
  class NodeCodeGenerator

    def render(node, writer)
      return if node.leaf?
      writer.write_class class_name(node), 'CommandBase' do
        render_constructor node, writer
        node.child_nodes.each { |n| render_method n, writer }
      end
    end

    private

    def render_constructor(node, writer)
      writer.write_method 'initialize', 'builder', method_args(node) do
        writer.write_line 'super builder'
        render_leaf_node_method_body node, writer
      end
    end

    def render_method(node, writer)
      writer.write_method method_name(node), method_args(node) do
        if node.branch?
          render_branch_node_method_body node, writer
        else
          render_leaf_node_method_body node, writer
          writer.write_line 'yield @builder if block_given?'
          writer.write_line 'self'
        end
      end
    end

    def render_branch_node_method_body(node, writer)
      args = ['@builder'] | args(node)
      writer.write_line "#{class_name(node)}.new #{args.join ', '}"
    end

    def render_leaf_node_method_body(node, writer)
      node.fragments.each { |f| write_append_statement f, writer }
    end

    def write_append_statement(fragment, writer)
      return if fragment.fragment_text.empty?
      unless_condition = fragment.arg_names.map { |a| "#{a.snakecase}.nil?" }.join ' or '
      statement = "@builder.append #{append_arg fragment}"
      statement << " unless #{unless_condition}" if fragment.optional? and fragment.has_args?
      writer.write_line statement
    end

    def append_arg(fragment)
      value = fragment.fragment_text.gsub(/<.+?>/) do |m|
        arg = CommandArgument.new m
        format_args = [arg.arg_name.snakecase, [arg.delimiter, arg.key_value_separator].compact.map { |v| "'#{v}'" }].flatten
        "\#{@builder.format #{format_args.join ', '}}"
      end
      value.include?('#{') ? %Q["#{value}"] : "'#{value}'"
    end

    def class_name(node)
      node.node_name.camelcase
    end

    def method_name(node)
      node.node_name.snakecase
    end

    def method_args(node)
      node.required_args.map { |a| a.arg_name.snakecase } +
          node.optional_args.map { |a| a.arg_name.snakecase + '=nil' }
    end

    def args(node)
      node.required_args.map { |a| a.arg_name.snakecase } +
          node.optional_args.map { |a| a.arg_name.snakecase }
    end

  end
end