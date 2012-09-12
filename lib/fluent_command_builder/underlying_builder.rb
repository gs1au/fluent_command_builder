require File.expand_path(File.dirname(__FILE__) + '/argument_formatter')
require File.expand_path(File.dirname(__FILE__) + '/execution_context')

module FluentCommandBuilder
  class UnderlyingBuilder
    include ArgumentFormatter

    attr_reader :command_name, :args, :passwords
    attr_accessor :path, :version_validator

    def initialize(command_name)
      @command_name = command_name
      @args = nil
      @passwords = []
      @path = nil
      @execution_context = FluentCommandBuilder.execution_context
      @version_validator = nil
    end

    def append(value)
      v = value.to_s
      v = @args ? v : v.lstrip
      @args = @args.to_s + v
    end

    def executable
      e = @path ? File.join(@path, @command_name) : @command_name
      e.gsub! '/', '\\' if e.include? '\\'
      e
    end

    def execute
      @execution_context.execute self, @version_validator
    end

    def to_s
      "#{quote_if_includes_space executable} #{@args}".strip
    end

  end
end