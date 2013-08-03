require 'test/unit'
require 'mocha/setup'
require_relative '../../../../lib/fluent_command_builder'

class CommandBuilderConfigTest < Test::Unit::TestCase
  include FluentCommandBuilder

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

end