require_relative '../lib/command_test_base'

class XCodeBuildVersionTest < CommandTestBase

  def test_version_44
    FluentCommandBuilder.executor.backticks_executor = MockExecutor.new "Xcode 4.4.1\nBuild version 4F1003"
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::XCodeBuild.version
    assert_equal '4.4.1', actual
  end

end