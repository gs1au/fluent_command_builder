module CodeGenerator
  class Command < Node

    attr_reader :command_name

    def initialize raw_text
      @command_name = raw_text.match(/^([-\w]+)/)[1]
      super raw_text[@command_name.length, raw_text.length]
    end

    def node_name
      @node_name ||= node_alias || @command_name
    end

  end
end