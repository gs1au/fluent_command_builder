module CodeGenerator
  class CommandArgument

    def initialize(arg_text, required=true)
      @arg_text = arg_text
      @required = required
    end

    def arg_name
      @arg_name ||= @arg_text[/<(\w+)/, 1]
    end

    def key_value_separator
      @key_value_separator ||= @arg_text[/(\W)\W>/, 1]
    end

    def delimiter
      @delimiter ||= @arg_text[/(\W)>/, 1]
    end

    def required?
      @required
    end

    def optional?
      !required?
    end

  end
end