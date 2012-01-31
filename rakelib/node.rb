require_relative 'fragment'

class Node

  attr_reader :child_nodes

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

  def node_name
    @node_name ||= starts_with_arg? ? first_arg_name : words_preceding_args
  end

  def fragments
    @fragments ||= @node_text.gsub(/\]/, ']|').gsub(/\[/, '|[').split('|').compact.map { |f| Fragment.new f }
  end

  private

  def starts_with_arg?
    words_preceding_args.empty?
  end

  def first_arg_name
    @first_arg_name ||= fragments.map { |f| f.arg_names }.flatten[0]
  end

  def words_preceding_args
    @words_preceding_args ||= @node_text.gsub(/<.*/, '').gsub(/\W/, ' ').strip
  end

end