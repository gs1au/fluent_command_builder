require_relative 'command_argument'

class Node

  attr_accessor :node_text, :child_nodes

  def initialize node_text
    @node_text = node_text
    @child_nodes = []
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

  def arg_names
    args.map { |a| a.arg_name }
  end

  def node_name
    name = starts_with_arg? ? first_arg_name : words_preceding_args
    name.gsub(/\W/, ' ').strip
  end

  private

  def starts_with_arg?
    words_preceding_args.empty?
  end

  def first_arg_name
    args[0].arg_name
  end

  def words_preceding_args
    @node_text.gsub(/<.*/, '').gsub(/\W/, ' ').strip
  end

end