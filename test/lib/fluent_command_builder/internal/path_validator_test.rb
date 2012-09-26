require 'test/unit'
require 'mocha'
require 'tmpdir'
require_relative '../../../../lib/fluent_command_builder'
include FluentCommandBuilder

class PathValidatorTest < Test::Unit::TestCase

  def setup
    @config = stub
    @config.stubs(:command_name).returns('command')
    @config.stubs(:version).returns('1.0')
    @path_finder = stub
    @printer = stub
    @validator = PathValidator.new @config
    @validator.path_finder = @path_finder
    @validator.printer = @printer
    @validator.should_abort_on_fatal = false
  end

  def test_should_raise_when_validation_level_not_supported
    begin
      @config.stubs(:path_validation_level).returns(:unreal)
      @validator.validate
      raise
    rescue => e
      assert_equal %Q[Validation level "unreal" is not supported.], e.message
    end
  end

  def test_should_not_validate_when_validation_level_is_off
    @config.stubs(:path_validation_level).returns(:off)
    @validator.validate
  end

  def test_should_be_valid_when_path_exists
    Dir.mktmpdir do |d|
      @config.stubs(:path_validation_level).returns(:fatal)
      @config.stubs(:path).returns(d)
      @validator.validate
    end
  end

  def test_should_be_invalid_when_path_does_not_exist_and_validation_level_is_warn
    d = '/unreal'
    @config.stubs(:path_validation_level).returns(:warn)
    @config.stubs(:path).returns(d)
    @printer.expects(:print_warning).with(%Q[Path for command "command", version "1.0" does not exist. Path: /unreal]).once
    @validator.validate
  end

  def test_should_be_invalid_when_path_does_not_exist_and_validation_level_is_fatal
    d = '/unreal'
    @config.stubs(:path_validation_level).returns(:fatal)
    @config.stubs(:path).returns(d)
    @printer.expects(:print_error).with(%Q[Path for command "command", version "1.0" does not exist. Path: /unreal]).once
    @validator.validate
  end
  
  def test_should_be_valid_when_path_on_path
    @config.stubs(:path_validation_level).returns(:fatal)
    @config.stubs(:path).returns(nil)
    @path_finder.stubs(:find_path).returns(true)
    @validator.validate
  end

  def test_should_be_invalid_when_path_not_on_path_and_validation_level_is_warn
    @config.stubs(:path_validation_level).returns(:warn)
    @config.stubs(:path).returns(nil)
    @path_finder.stubs(:find_path).returns(false)
    @printer.expects(:print_warning).with(%Q[Command "command" was not found on the PATH.]).once
    @validator.validate
  end

  def test_should_be_invalid_when_path_not_on_path_and_validation_level_is_fatal
    @config.stubs(:path_validation_level).returns(:fatal)
    @config.stubs(:path).returns(nil)
    @path_finder.stubs(:find_path).returns(false)
    @printer.expects(:print_error).with(%Q[Command "command" was not found on the PATH.]).once
    @validator.validate
  end

end