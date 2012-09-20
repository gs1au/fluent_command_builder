require File.expand_path(File.dirname(__FILE__) + '/argument_formatter')
require File.expand_path(File.dirname(__FILE__) + '/execution_context')

module FluentCommandBuilder
  class UnderlyingBuilder
    include ArgumentFormatter

    attr_reader :command_builder_config, :args, :passwords

    def initialize(command_builder_config)
      @command_builder_config = command_builder_config
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
      e = path ? File.join(path, command_name) : command_name
      e.gsub! '/', '\\' if e.include? '\\'
      e
    end

    def execute
      @command_builder_config.validate_path :fatal
      @command_builder_config.validate_version
      visible_command = @execution_context.formatter.format self
      @execution_context.execute to_s, visible_command
    end

    def to_s
      quoted_executable = evaluated_path.to_s.include?(' ') ? %Q["#{executable}"] : executable
      "#{quoted_executable} #{@args}".strip
    end

    private

    def path
      @command_builder_config.path
    end

    def command_name
      @command_builder_config.command_name
    end

    def evaluated_path
      is_windows? ? windows_path : @command_builder_config.path
    end

    def windows_path
      `echo #{@command_builder_config.path}`.strip
    end

    def is_windows?
      !ENV['WINDIR'].nil?
    end

  end
end