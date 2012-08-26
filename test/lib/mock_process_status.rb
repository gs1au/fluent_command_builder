class MockProcessStatus

  attr_accessor :exitstatus, :success

  def initialize(options={})
    @exitstatus = 0
    @success = true
  end

  def exitstatus
    @exitstatus
  end

  def success?
    @success
  end

end