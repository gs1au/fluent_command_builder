require 'test/unit'
require 'mocha'
require_relative '../../../../lib/fluent_command_builder'
include FluentCommandBuilder

class StandardVersionDetectorTest < Test::Unit::TestCase

  def setup
    @path_finder = stub
    @backticks_executor = stub
    @version_detector = StandardVersionDetector.new 'command', '/version'
    @version_detector.path_finder = @path_finder
    @version_detector.backticks_executor = @backticks_executor
  end

  def test_should_find_path_when_path_not_specified
    Dir.mktmpdir do |path|
      @path_finder.expects(:find_path).with('command').returns(path).once
      @backticks_executor.stubs(:execute)
      @version_detector.version
    end
  end

  def test_should_not_use_path_finder_when_path_specified
    Dir.mktmpdir do |path|
      @path_finder.expects(:find_path).with('command').never
      @backticks_executor.stubs(:execute)
      @version_detector.version path
    end
  end

  def test_version_is_nil_when_no_path_found
    @path_finder.stubs(:find_path).returns(nil)
    @backticks_executor.expects(:execute).never
    version = @version_detector.version
    assert_equal nil, version
  end

  def test_version_is_nil_when_path_does_not_exist
    @backticks_executor.expects(:execute).never
    version = @version_detector.version '/path'
    assert_equal nil, version
  end

  def test_current_directory_represented_as_single_dot_is_ignored
    @path_finder.stubs(:find_path).returns('.')
    @backticks_executor.expects(:execute).with('"command" /version 2>&1').once
    version = @version_detector.version
    assert_equal nil, version
  end

  def test_should_execute_command_with_args
    Dir.mktmpdir do |path|
      executable = File.join path, 'command'
      @path_finder.stubs(:find_path).returns(path)
      @backticks_executor.expects(:execute).with(%Q["#{executable}" /version 2>&1])
      @version_detector.version
    end
  end

end