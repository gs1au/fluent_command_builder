require_relative '../lib/command_test_base'

class SecurityOsxVersionTest < CommandTestBase

  def test_version_108
    FluentCommandBuilder.executor.backticks_executor = MockExecutor.new '10.8'
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::SecurityOSX.version
    assert_equal '10.8', actual
  end

end