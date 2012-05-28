require File.expand_path(File.dirname(__FILE__) + '/command_base')

module FluentCommandBuilder
  class CommandBuilder

    attr_accessor :command_name, :path

    def initialize(command_name, path=nil)
      @command_name = command_name
      @path = path
      @args = ''
    end

    def format(value, delimiter=' ', key_value_separator='=')
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

    def append(value)
      @args << value.to_s
    end

    def append_arg(arg)
      append " #{arg.to_s}"
    end

    def to_s
      "#{executable} #{args}".strip
    end

    def args
      @args.strip
    end

    private

    def executable
      executable = @path ? File.join(@path, @command_name) : @command_name
      executable.gsub! '/', '\\' if executable.include? '\\'
      executable
    end

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