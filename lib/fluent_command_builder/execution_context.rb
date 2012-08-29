require File.expand_path(File.dirname(__FILE__) + '/printer')
require File.expand_path(File.dirname(__FILE__) + '/version')
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
      return unless underlying_builder.version && underlying_builder.actual_version_lambda

      expected_version = underlying_builder.version
      actual_version = underlying_builder.actual_version_lambda.call underlying_builder.path
      warning_message_partial = %Q[Version validation for command "#{underlying_builder.command_name}" failed. Expected version #{expected_version} but was ]

      unless actual_version
        @printer.print_warning warning_message_partial + 'unable to determine actual version.'
        return
      end

      expected_version = Version.new expected_version
      actual_version = Version.new actual_version
      is_valid = actual_version.compact == expected_version.compact

      unless is_valid
        @printer.print_warning warning_message_partial + actual_version.to_s(2) + '.'
      end
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