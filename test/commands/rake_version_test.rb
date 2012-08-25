require_relative '../lib/command_test_base'

class RakeVersionTest < CommandTestBase

  def test_version_09
    FluentCommandBuilder::Rake.version_detector.backticks_executor = MockExecutor.new 'rake, version 0.9.2.2'
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::Rake.version
    assert_equal '0.9.2.2', actual
  end

end