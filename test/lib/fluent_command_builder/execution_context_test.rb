require 'test/unit'
require 'mocha'
require_relative '../../mock_executor'
require_relative '../../mock_process_status'
require_relative '../../../lib/fluent_command_builder'
include FluentCommandBuilder

class ExecutionContextTest < Test::Unit::TestCase

  def setup
    @executor = stub
    @execution_context = ExecutionContext.new @executor
    @printer = stub
    @execution_context.printer = @printer
  end

  def test_should_fail_when_should_not_print_on_execute_but_executor_will_print_on_error
    @executor.stubs(:will_print_on_execute?).returns(true)
    @execution_context.should_print_on_execute = false
    assert_raise_message("should_print_on_execute must be true for #{@executor}.") { @execution_context.execute 'command' }
  end

  def test_should_not_print_on_execute
    @executor.stubs(:will_print_on_execute?).returns(false)
    @executor.expects(:execute)
    @execution_context.should_print_on_execute = false
    @execution_context.execute 'command'
  end

  def test_should_print_on_execute
    @executor.stubs(:will_print_on_execute?).returns(false)
    @executor.expects(:execute)
    @execution_context.should_print_on_execute = true
    @printer.expects(:print_command).with('command').once
    @execution_context.execute 'command'
  end

  def test_should_fail_when_should_not_fail_on_error_but_executor_will_fail_on_error
    @executor.stubs(:will_fail_on_error?).returns(true)
    @execution_context.should_fail_on_error = false
    assert_raise_message("should_fail_on_error must be true for #{@executor}.") { @execution_context.execute 'command' }
  end

  def test_should_fail_when_should_fail_on_error_but_executor_will_not_fail_on_error
    @executor.stubs(:will_print_on_execute?).returns(true)
    @executor.stubs(:will_fail_on_error?).returns(false)
    status = mock
    status.stubs(:success?).returns(false)
    status.stubs(:exitstatus).returns(1)
    @executor.expects(:execute).yields(status)
    @execution_context.should_fail_on_error = true
    assert_raise_message("Command failed with status (1): [command]") { @execution_context.execute 'command' }
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