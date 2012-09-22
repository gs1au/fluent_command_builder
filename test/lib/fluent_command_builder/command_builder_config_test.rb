require 'test/unit'
require 'mocha'
require_relative '../../../lib/fluent_command_builder'
include FluentCommandBuilder

class CommandBuilderConfigTest < Test::Unit::TestCase

  def setup
    @path_validator = stub
    @version_validator = stub
    @config = CommandBuilderConfig.new 'command'
    @config.path_validator = @path_validator
    @config.version_validator = @version_validator
  end

  def test_should_validate_path
    @path_validator.expects(:validate).once
    @config.validate_path
  end

  def test_should_validate_version
    @version_validator.expects(:validate).once
    @config.version = '1.0'
    @config.validate_version
  end

  def test_should_not_validate_version_when_no_version_specified
    @version_validator.expects(:validate).never
    @config.validate_version
  end

  def test_should_build_executable_with_path
    @config.path = '/path'
    assert_equal '/path/command', @config.executable
  end

  def test_should_build_executable_without_path
    assert_equal 'command', @config.executable
  end

  def test_should_normalise_executable_on_unix
    @config.is_windows = false
    @config.path = '\\path'
    assert_equal '/path/command', @config.executable
  end

  def test_should_normalise_executable_on_windows
    @config.is_windows = true
    @config.path = 'C:/path'
    assert_equal 'C:\\path\\command', @config.executable
  end

  def test_should_evaluate_executable_on_unix
    return if @config.is_windows
    ENV['command_path'] = '/path'
    @config.path = '$command_path'
    assert_equal '/path/command', @config.evaluated_executable
  end

  def test_should_evaluate_executable_on_windows
    return unless @config.is_windows
    ENV['command_path'] = 'C:\\path'
    @config.path = '$command_path'
    assert_equal 'C:\\path\\command', @config.evaluated_executable
  end

  def test_should_evaluate_path_on_unix
    return if @config.is_windows
    ENV['command_path'] = '/path'
    @config.path = '$command_path'
    assert_equal '/path', @config.evaluated_path
  end

  def test_should_evaluate_path_on_windows
    return unless @config.is_windows
    ENV['command_path'] = 'C:\\path'
    @config.path = '%command_path%'
    assert_equal 'C:\\path', @config.evaluated_path
  end

end