require_relative '../../../command_test_base'

class XCodeBuildVersionTest < CommandTestBase

  def test_version_44
    output = "Xcode 4.4.1\nBuild version 4F1003"
    executor = stub
    executor.stubs(:execute).returns(output)
    FluentCommandBuilder::XCodeBuild.version_detector.backticks_executor = executor
    actual = FluentCommandBuilder::XCodeBuild.version
    assert_equal '4.4.1', actual
  end

end