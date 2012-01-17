module FluentCommandBuilder
  class CommandBuilder

    def initialize command
      @command = command.to_s
    end

    def append value
      @command << value + ' '
    end

    def format value, delimiter=nil, key_value_separator=nil
      yield(format_value(value, delimiter, key_value_separator))
    end

    def to_s
      @command
    end

    private

    def format_value value, delimiter=nil, key_value_separator=nil
      quote_if_includes_space(array_to_s([value].flatten.map { |v| v.kind_of?(Hash) ? hash_to_array(v, key_value_separator) : value }, delimiter)) unless value.nil?
    end

    def hash_to_array hash, key_value_separator
      hash.map { |k, v| k.to_s + key_value_separator + v.to_s }
    end

    def array_to_s array, delimiter
      array.join delimiter
    end

    def quote_if_includes_space value
      value.to_s.include?(' ') ? %Q["#{value}"] : value
    end

  end
end