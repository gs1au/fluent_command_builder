require_relative 'ruby_naming_convention'
require_relative 'node'

class NodeCodeGenerator

  def initialize
    @naming_convention = RubyNamingConvention.new
  end

  def render node, writer
    return if node.leaf?
    writer.block "class #{class_name(node)}" do
      render_constructor node, writer
      node.child_nodes.each { |n| render_method n, writer }
      writer.method 'to_s' do
        writer.line '@builder.to_s'
      end
    end
  end

  private

  def render_constructor node, writer
    writer.method 'initialize', 'builder', method_args(node) do
      writer.line '@builder = builder'
      render_leaf_node_method_body node, writer
    end
  end

  def render_method node, writer
    writer.method method_name(node), method_args(node) do
      if node.branch?
        render_branch_node_method_body node, writer
      else
        render_leaf_node_method_body node, writer
        writer.line 'self'
      end
    end
  end

  def render_branch_node_method_body node, writer
    writer.initializer class_name(node), '@builder', method_args(node)
  end

  def render_leaf_node_method_body node, writer
    write_append_statements node, writer
  end


  def write_append_statements node, writer
    fragments = node.fragments

    if fragments.length == 1
      append_arg = get_append_arg fragments[0]
      writer.line "@builder.append #{quote append_arg}"
    else
      fragments.each do |node_text|
        append_arg = get_append_arg node_text
        n = Node.new node_text
        line = ''
        line << "@builder.buffer #{quote append_arg}"
        line << " unless #{@naming_convention.arg_name(n.arg_names[0])}.nil?" if n.arg_names.length > 0
        writer.line line
      end
      writer.line '@builder.append_buffer'
    end
  end

  def get_append_arg node_text
    node_text.gsub(/<.+?>/) do |m|
      arg = CommandArgument.new m
      format_args = [@naming_convention.arg_name(arg.arg_name), [arg.delimiter, arg.key_value_separator].compact.map { |v| "'#{v}'" }].flatten
      "\#{@builder.format #{format_args.join ', '}}"
    end
  end

  def quote value
    value.include?('#{') ? %Q["#{value}"] : "'#{value}'"
  end

  def class_name node
    @naming_convention.class_name node.node_name
  end

  def method_name node
    @naming_convention.method_name node.node_name
  end

  #def method_args node
  #  node.args.map { |a| @naming_convention.arg_name a.arg_name }
  #end

  def method_args node
    node.args.map { |a| "#{@naming_convention.arg_name a.arg_name}=nil" }
  end

end