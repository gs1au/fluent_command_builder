require_relative '../lib/command_test_base'

class CucumberVersionTest < CommandTestBase

  def test_version_12
    FluentCommandBuilder::Cucumber.version_detector.backticks_executor = MockExecutor.new '1.2.0'
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::Cucumber.version
    assert_equal '1.2.0', actual
  end

end