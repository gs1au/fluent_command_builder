require File.expand_path(File.dirname(__FILE__) + '/command_base')

module FluentCommandBuilder
  class CommandBuilder

    attr_accessor :command_name, :path

    def initialize(command_name, path=nil)
      @command_name = command_name
      @path = path
      @args = ''
    end

    def format(value, delimiter=nil, key_value_separator=nil)

      if value.kind_of? Array and delimiter.nil?
        return array_to_s(value.map { |v| quote_if_includes_space v }, ' ')
      end

      if value.kind_of? CommandBase
        return value.to_s
      end

      value_as_array = case
                         when value.kind_of?(Hash)
                           hash_to_array value, key_value_separator
                         when value.kind_of?(Array)
                           value
                         else
                           [value.to_s]
                       end
      value_as_string = array_to_s value_as_array, delimiter
      quote_if_includes_space value_as_string
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

    def hash_to_array(hash, key_value_separator)
      hash.map { |k, v| k.to_s + key_value_separator + v.to_s }
    end

    def array_to_s(array, delimiter)
      array.join delimiter
    end

    def quote_if_includes_space(value)
      value.to_s.include?(' ') ? %Q["#{value}"] : value
    end

  end
end