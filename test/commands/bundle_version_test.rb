require_relative '../lib/command_test_base'

class BundleVersionTest < CommandTestBase

  def test_version_11
    FluentCommandBuilder::Bundle.version_detector.backticks_executor = MockExecutor.new 'Bundler version 1.1.4'
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::Bundle.version
    assert_equal '1.1.4', actual
  end

end