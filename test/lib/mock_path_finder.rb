class MockPathFinder

  def initialize(result=nil)
    @result = result
  end

  def find_path(executable_name)
    @result
  end

end