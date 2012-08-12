require_relative 'string_extensions'

class NodeCodeNames

  def initialize(node)
    @node = node
  end

  def class_name
    @node.node_name.camelcase
  end

  def method_name
    @node.node_name.snakecase
  end

  def method_args
    @node.args.map do |arg|
      arg_name = arg.arg_name.snakecase
      arg_name << '=nil' if arg.optional?
      arg_name
    end
  end

  def initializer_values
    %w(b) + @node.args.map { |arg| arg.arg_name.snakecase }
  end

end