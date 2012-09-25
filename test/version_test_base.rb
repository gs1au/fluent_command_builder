require 'test/unit'
require 'mocha'
require_relative '../lib/fluent_command_builder'
include FluentCommandBuilder

class VersionTestBase < Test::Unit::TestCase

  def assert_version(mod, expected_version, output)
    Dir.mktmpdir do |path|
      path_finder = stub
      path_finder.stubs(:find_path).returns(path)

      backticks_executor = stub
      backticks_executor.stubs(:execute).returns(output)

      version_detector = mod.version_detector
      version_detector.path_finder = path_finder if version_detector.respond_to? :path_finder
      version_detector.backticks_executor = backticks_executor

      actual = version_detector.version
      assert_equal expected_version, actual
    end
  end


end