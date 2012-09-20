require File.expand_path(File.dirname(__FILE__) + '/argument_formatter')
require File.expand_path(File.dirname(__FILE__) + '/execution_context')

module FluentCommandBuilder
  class UnderlyingBuilder
    include ArgumentFormatter

    attr_reader :args, :passwords

    def initialize(command_builder_config)
      @c = command_builder_config
      @args = nil
      @passwords = []
      @execution_context = FluentCommandBuilder.execution_context
    end

    def append(value)
      v = value.to_s
      v = @args ? v : v.lstrip
      @args = @args.to_s + v
    end

    def executable
      @c.path ? File.join(@c.tidy_path, @c.command_name) : @c.command_name
    end

    def execute
      @c.validate_path :fatal
      @c.validate_version
      visible_command = @execution_context.formatter.format self
      @execution_context.execute to_s, visible_command
    end

    def to_s
      quoted_executable = @c.evaluated_path.to_s.include?(' ') ? %Q["#{executable}"] : executable
      "#{quoted_executable} #{@args}".strip
    end

  end
end