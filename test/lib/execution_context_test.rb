require 'test/unit'
require_relative 'mock_executor'
require_relative 'mock_process_status'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class ExecutionContextTest < Test::Unit::TestCase

  def test_should_fail_when_should_not_fail_on_error_but_executor_will_fail_on_error
    builder = UnderlyingBuilder.new 'command'

    executor = MockExecutor.new
    executor.will_fail_on_error = true

    context = ExecutionContext.new executor
    context.should_fail_on_error = false

    assert_raise_message("should_fail_on_error must be true for #{executor}.") { context.execute builder }
  end

  def test_should_fail_when_should_fail_on_error_but_executor_will_not_fail_on_error
    builder = UnderlyingBuilder.new 'command'

    status = MockProcessStatus.new
    status.exitstatus = 1
    status.success = false

    executor = MockExecutor.new
    executor.will_fail_on_error = false
    executor.status = status

    context = ExecutionContext.new executor
    context.should_fail_on_error = true

    assert_raise_message("Command failed with status (1): [command]") { context.execute builder }
  end

  def test_should_fail_when_should_not_print_on_execute_but_executor_will_print_on_error
    builder = UnderlyingBuilder.new 'command'

    executor = MockExecutor.new
    executor.will_print_on_execute = true

    context = ExecutionContext.new executor
    context.should_print_on_execute = false

    assert_raise_message("should_print_on_execute must be true for #{executor}.") { context.execute builder }
  end

  def test_should_not_print_on_execute
    builder = UnderlyingBuilder.new 'command'

    executor = MockExecutor.new
    executor.will_print_on_execute = false

    context = ExecutionContext.new executor
    context.should_print_on_execute = false

    $stdout = StringIO.new
    context.execute builder

    assert_equal '', $stdout.string
  end

  def test_should_print_on_execute
    builder = UnderlyingBuilder.new 'command'

    executor = MockExecutor.new
    executor.will_print_on_execute = false

    context = ExecutionContext.new executor
    context.should_print_on_execute = true

    $stdout = StringIO.new
    context.execute builder

    assert_include $stdout.string, 'command'
  end

  private

  def assert_raise_message(expected_message)
    e = nil
    begin
      yield
    rescue => e
      assert_equal expected_message, e.message
    end
    assert_not_nil e
  end

end