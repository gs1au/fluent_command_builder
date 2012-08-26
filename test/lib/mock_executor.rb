require_relative 'mock_process_status'

class MockExecutor

  attr_accessor :status, :will_print_on_execute, :will_fail_on_error

  def initialize(result=nil)
    @result = result
    @status = MockProcessStatus.new
    @will_print_on_execute = false
    @will_fail_on_error = false
  end

  def execute(underlying_builder)
    @execute_block.call(nil) if @execute_block
    yield @status if block_given?
    @result
  end

  def setup_execute(&block)
    @execute_block = block
  end

  def will_print_on_execute?
    @will_print_on_execute
  end

  def will_fail_on_error?
    @will_fail_on_error
  end

end