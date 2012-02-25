require_relative 'fragment'

module CodeGenerator
  class Node

    def initialize(node_def)
      @node_def = node_def
    end

    def child_nodes
      @child_nodes ||= []
    end

    def branch?
      !child_nodes.empty?
    end

    def leaf?
      child_nodes.empty?
    end

    def node_name
      @node_name ||= node_alias || (starts_with_arg? ? first_arg_name : words_preceding_args)
    end

    def fragments
      @fragments ||= @node_def.gsub(/ \(.+?\)/, '').gsub(']', ']|').gsub('[', '|[').split('|').compact.map { |f| Fragment.new f }
    end

    def required_args
      args { |a| a.required? }
    end

    def optional_args
      args { |a| a.optional? }
    end

    protected

    def starts_with_arg?
      words_preceding_args.empty?
    end

    def first_arg_name
      @node_def[/<(.+?)>/, 1]
    end

    def words_preceding_args
      @node_def.gsub(/<.*/, '').gsub(/\W/, ' ').strip
    end

    def node_alias
      @node_def[/\((.+?)\)/, 1]
    end

    def args
      fragments.map { |f| f.args.map { |a| a if yield a } }.flatten.compact
    end

  end
end