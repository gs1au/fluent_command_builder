require_relative 'command_argument'

module CodeGenerator
  class Fragment

    def initialize raw_text
      @raw_text = raw_text
    end

    def fragment_text
      @fragment_text ||= optional? ? @raw_text[1, @raw_text.length - 2] : @raw_text
    end

    def optional?
      @optional ||= @raw_text.start_with?('[') and @raw_text.end_with?(']')
    end

    def args
      @args ||= fragment_text.scan(/<.+?>/).flatten.map { |m| CommandArgument.new m }
    end

    def arg_names
      @arg_names ||= args.map { |a| a.arg_name }
    end

    def has_args?
      @has_args ||= args.length > 0
    end

  end
end