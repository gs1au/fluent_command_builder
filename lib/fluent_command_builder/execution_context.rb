require File.expand_path(File.dirname(__FILE__) + '/printer')
require File.expand_path(File.dirname(__FILE__) + '/version_validator')
require File.expand_path(File.dirname(__FILE__) + '/command_executors/system_executor')
require File.expand_path(File.dirname(__FILE__) + '/command_formatters/null_formatter')

module FluentCommandBuilder
  class ExecutionContext

    attr_accessor :executor, :formatter, :should_print_on_execute, :should_fail_on_error

    def initialize(executor)
      @executor = executor
      @formatter = NullFormatter.new
      @should_print_on_execute = true
      @should_fail_on_error = true
      @printer = FluentCommandBuilder::Printer.new
    end

    def execute(underlying_builder)
      validate_should_print_on_execute
      validate_should_fail_on_error
      validate_path underlying_builder
      validate_version underlying_builder
      visible_command = @formatter.format underlying_builder
      print_command visible_command
      @executor.execute(underlying_builder) do |status|
        raise "Command failed with status (#{status.exitstatus}): [#{visible_command}]" if @should_fail_on_error && !status.success?
      end
    end

    private

    def validate_should_print_on_execute
      raise "should_print_on_execute must be true for #{@executor}." if !@should_print_on_execute && @executor.will_print_on_execute?
    end

    def validate_should_fail_on_error
      raise "should_fail_on_error must be true for #{@executor}." if !@should_fail_on_error && @executor.will_fail_on_error?
    end

    def validate_version(underlying_builder)
      v = VersionValidator.new underlying_builder
      v.validate
    end

    def validate_path(underlying_builder)
      return unless underlying_builder.path
      return if File.exist? underlying_builder.path
      message = %Q[Path for command "#{underlying_builder.command_name}" does not exist. Path: #{underlying_builder.path}]
      @printer.print_error message
      raise message
    end

    def print_command(visible_command)
      @printer.print_command visible_command if @should_print_on_execute && !@executor.will_print_on_execute?
    end

  end
end

module FluentCommandBuilder

  def self.execution_context
    @execution_context ||= ExecutionContext.new(SystemExecutor.new)
  end

  def self.execution_context=(value)
    @execution_context = value
  end

  def self.change_execution_context
    current = @execution_context.clone
    begin
      return yield @execution_context
    ensure
      @execution_context = current
    end
  end

end