require File.expand_path(File.dirname(__FILE__) + '/command_base')

module FluentCommandBuilder
  module ArgumentFormatter

    def format(value, delimiter=' ', key_value_separator=nil)
      case
        when value.kind_of?(CommandBase)
          value.to_s
        when value.kind_of?(Hash)
          format_hash value, delimiter, key_value_separator
        when value.kind_of?(Array)
          format_array value, delimiter
        else
          quote_if_includes_space value.to_s
      end
    end

    def format_password(value)
      password = quote_if_includes_space value.to_s
      @passwords << password
      password
    end

    private

    def format_hash(hash, delimiter, key_value_separator)
      hash.map { |k, v| quote_if_includes_space(k.to_s) + key_value_separator + quote_if_includes_space(v.to_s) }.join delimiter
    end

    def format_array(array, delimiter)
      array.map { |v| quote_if_includes_space v }.join delimiter
    end

    def quote_if_includes_space(value)
      value.to_s.include?(' ') ? %Q["#{value}"] : value
    end

  end
end