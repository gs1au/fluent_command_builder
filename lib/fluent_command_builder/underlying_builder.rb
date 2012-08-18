require File.expand_path(File.dirname(__FILE__) + '/command_base')
require File.expand_path(File.dirname(__FILE__) + '/executor')
require File.expand_path(File.dirname(__FILE__) + '/path_finder')

module FluentCommandBuilder

  def self.default_executor
    @default_executor ||= self.executor.rake_sh_executor
  end

  def self.default_executor=(value)
    @default_executor = value
  end

  class UnderlyingBuilder

    attr_accessor :command_name, :path, :executor

    def initialize(command_name=nil)
      @command_name = command_name
      @path = nil
      @executor = FluentCommandBuilder.default_executor
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

    def to_s
      "#{quote_if_includes_space executable} #{args}".strip
    end

    def args
      @args.strip
    end

    def executable
      executable = @path ? File.join(@path, @command_name) : @command_name
      executable.gsub! '/', '\\' if executable.include? '\\'
      executable
    end

    def execute
      @executor.execute to_s
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