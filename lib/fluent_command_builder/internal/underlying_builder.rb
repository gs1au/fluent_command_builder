require File.expand_path(File.dirname(__FILE__) + '/argument_formatter')
require File.expand_path(File.dirname(__FILE__) + '/path')
require File.expand_path(File.dirname(__FILE__) + '/../execution_context')

module FluentCommandBuilder
  class UnderlyingBuilder
    include ArgumentFormatter

    attr_reader :args, :passwords
    attr_accessor :password_formatter, :execution_context

    def initialize(command_builder_config)
      @c = command_builder_config
      @args = nil
      @passwords = []
      @password_formatter = FluentCommandBuilder.password_formatter
      @execution_context = @c.execution_context
    end

    def append(value)
      v = value.to_s
      v = @args ? v : v.lstrip
      @args = @args.to_s + v
    end

    def executable
      @c.executable
    end

    def execute
      @c.validate_path
      @c.validate_version
      @execution_context.execute to_s, visible_command
    end

    def to_s
      p = Path.new @c.executable
      "#{quote_if_includes_space p.evaluated_path} #{@args}".strip
    end

    private

    def visible_command
      @password_formatter.format to_s, @passwords
    end

  end
end