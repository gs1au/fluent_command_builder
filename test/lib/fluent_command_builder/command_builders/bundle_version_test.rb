require_relative '../../../command_test_base'

class BundleVersionTest < CommandTestBase

  def test_version_11
    output = 'Bundler version 1.1.4'
    executor = stub
    executor.stubs(:execute).returns(output)
    FluentCommandBuilder::Bundle.version_detector.backticks_executor = executor
    actual = FluentCommandBuilder::Bundle.version
    assert_equal '1.1.4', actual
  end

end