class MockVersionDetector

  def initialize(result=nil)
    @result = result
  end

  def version(path=nil)
    @result
  end

end