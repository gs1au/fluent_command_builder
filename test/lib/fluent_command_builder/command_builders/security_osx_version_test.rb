require_relative '../../../command_test_base'

class SecurityOsxVersionTest < CommandTestBase

  def test_version_108
    output = '10.8'
    executor = stub
    executor.stubs(:execute).returns(output)
    FluentCommandBuilder::SecurityOSX.version_detector.backticks_executor = executor
    actual = FluentCommandBuilder::SecurityOSX.version
    assert_equal '10.8', actual
  end

end