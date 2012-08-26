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
    end

    def execute(underlying_builder)
      validate_should_print_on_execute
      validate_should_fail_on_error
      visible_command = @formatter.format underlying_builder
      puts visible_command if @should_print_on_execute && !@executor.will_print_on_execute?
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

  end
end

module FluentCommandBuilder

  def self.execution_context
    @execution_context ||= ExecutionContext.new(SystemExecutor.new)
  end

  def self.execution_context=(value)
    @execution_context = value
  end

end