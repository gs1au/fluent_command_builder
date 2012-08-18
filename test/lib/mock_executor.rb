class MockExecutor

  def initialize(result)
    @result = result
  end

  def execute(command)
    @result
  end

end