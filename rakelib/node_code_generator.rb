require_relative 'ruby_naming_convention'

class NodeCodeGenerator

  def initialize
    @naming_convention = RubyNamingConvention.new
  end

  def render node, writer
    return if node.leaf?
    class_name = @naming_convention.class_name node.node_text
    w = writer
    w.write_block "class #{class_name}" do
      w.write_block 'def initialize command=nil' do
        w.write_line '@b = CommandBuilder.new command'
        w.write_line "@b.append '#{node.node_text}'"
        w.write_line 'self'
      end
      node.child_nodes.each { |n| render_method n, w }
      w.write_block 'def to_s' do
        w.write_line '@b.to_s'
      end
    end
  end

  private

  def render_method node, writer
    method_name = @naming_convention.method_name node.node_name
    method_args = node.arg_names.map { |a| @naming_convention.arg_name(a) }.join ', '

    writer.write_block "def #{method_name} #{method_args}" do
      if node.branch?
        render_branch_node_method_body node, writer
      else
        render_leaf_node_method_body node, writer
      end
    end
  end

  def render_branch_node_method_body branch_node, writer
    writer.write_line "#{@naming_convention.class_name branch_node.node_name}.new self"
  end

  def render_leaf_node_method_body leaf_node, writer
    writer.write_line append_statement(leaf_node)
    writer.write_line 'self'
  end

  def append_statement node
    append_arg = node.node_text.gsub /<.+?>/ do |m|
      arg = CommandArgument.new m
      format_args = [@naming_convention.arg_name(arg.arg_name), [arg.delimiter, arg.key_value_separator].compact.map { |v| "'#{v}'" }].flatten
      "\#{@b.format #{format_args.join ', '}}"
    end
    append_arg = append_arg.include?('#{') ? %Q["#{append_arg}"] : "'#{append_arg}'"
    "@b.append #{append_arg}"
  end

end