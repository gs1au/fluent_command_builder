require_relative '../../../command_test_base'

class CucumberVersionTest < CommandTestBase

  def test_version_12
    output = '1.2.0'
    executor = stub
    executor.stubs(:execute).returns(output)
    FluentCommandBuilder::Cucumber.version_detector.backticks_executor = executor
    actual = FluentCommandBuilder::Cucumber.version
    assert_equal '1.2.0', actual
  end

end