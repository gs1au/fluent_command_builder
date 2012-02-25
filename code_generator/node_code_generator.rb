require_relative 'ruby_naming_convention'
require_relative 'node'

module CodeGenerator
  class NodeCodeGenerator

    def initialize
      @naming_convention = RubyNamingConvention.new
    end

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
      unless_condition = fragment.arg_names.map { |a| "#{@naming_convention.arg_name a}.nil?" }.join ' or '
      statement = "@builder.append #{append_arg fragment}"
      statement << " unless #{unless_condition}" if fragment.optional? and fragment.has_args?
      writer.write_line statement
    end

    def append_arg(fragment)
      value = fragment.fragment_text.gsub(/<.+?>/) do |m|
        arg = CommandArgument.new m
        format_args = [@naming_convention.arg_name(arg.arg_name), [arg.delimiter, arg.key_value_separator].compact.map { |v| "'#{v}'" }].flatten
        "\#{@builder.format #{format_args.join ', '}}"
      end
      value.include?('#{') ? %Q["#{value}"] : "'#{value}'"
    end

    def class_name(node)
      @naming_convention.class_name node.node_name
    end

    def method_name(node)
      @naming_convention.method_name node.node_name
    end

    def method_args(node)
      node.required_args.map { |a| @naming_convention.arg_name a.arg_name } +
          node.optional_args.map { |a| @naming_convention.arg_name(a.arg_name) + '=nil' }
    end

    def args(node)
      node.required_args.map { |a| @naming_convention.arg_name a.arg_name } +
          node.optional_args.map { |a| @naming_convention.arg_name(a.arg_name) }
    end

  end
end