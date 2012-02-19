require_relative 'fragment'

module CodeGenerator
  class Node

    attr_accessor :fragments
    attr_reader :child_nodes

    def initialize raw_text
      @raw_text = raw_text
      @child_nodes = []
    end

    def branch?
      !@child_nodes.empty?
    end

    def leaf?
      @child_nodes.empty?
    end

    def node_name
      @node_name ||= node_alias || (starts_with_arg? ? first_arg_name : words_preceding_args)
    end

    def fragments
      @fragments ||= @raw_text.gsub(/ \(.+?\)/, '').gsub(']', ']|').gsub('[', '|[').split('|').compact.map { |f| Fragment.new f }
    end

    def required_args
      fragments.map { |f| f.args.map { |a| a unless f.optional? } }.flatten.compact
    end

    def optional_args
      fragments.map { |f| f.args.map { |a| a if f.optional? } }.flatten.compact
    end

    protected

    def starts_with_arg?
      @starts_with_arg ||= words_preceding_args.empty?
    end

    def first_arg_name
      match = @raw_text.match /<(.+?)>/
      match.nil? ? nil : match[1]
    end

    def words_preceding_args
      @words_preceding_args ||= @raw_text.gsub(/<.*/, '').gsub(/\W/, ' ').strip
    end

    def node_alias
      match = @raw_text.match(/\((.+?)\)/)
      match.nil? ? nil : match[1]
    end

  end
end