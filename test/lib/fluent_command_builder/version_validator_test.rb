require 'test/unit'
require 'mocha'
require 'tmpdir'
require_relative '../../../lib/fluent_command_builder'
include FluentCommandBuilder

class VersionValidatorTest < Test::Unit::TestCase

  def setup
    @config = stub
    @config.stubs(:command_name).returns('command')
    @config.stubs(:version).returns('1.0')
    @config.stubs(:evaluated_path).returns(nil)
    @version_detector = stub
    @config.stubs(:version_detector).returns(@version_detector)
    @printer = stub
    @validator = VersionValidator.new @config
    @validator.printer = @printer
    @validator.should_abort_on_fatal = false
  end

  def test_should_raise_when_validation_level_not_supported
    begin
      @config.stubs(:version_validation_level).returns(:unreal)
      @validator.validate
      raise
    rescue => e
      assert_equal %Q[Validation level "unreal" is not supported.], e.message
    end
  end

  def test_should_not_validate_when_validation_level_is_off
    @config.stubs(:version_validation_level).returns(:off)
    @validator.validate
  end

  def test_should_not_validate_when_unable_to_determine_version
    @config.stubs(:version_validation_level).returns(:fatal)
    @version_detector.stubs(:version).returns(nil)
    @printer.expects(:print_warning).with(%Q[Version validation for command "command" failed. Expected version 1.0 but was unable to determine actual version.]).once
    @validator.validate
  end

  def test_should_be_valid_when_actual_version_matches_expected_version
    @config.stubs(:version_validation_level).returns(:fatal)
    @version_detector.stubs(:version).returns('1.0')
    @validator.validate
  end

  def test_should_be_invalid_when_actual_version_does_not_match_expected_version_and_validation_level_is_warn
    @config.stubs(:version_validation_level).returns(:warn)
    @version_detector.stubs(:version).returns('1.1')
    @printer.expects(:print_warning).with(%Q[Version validation for command "command" failed. Expected version 1.0 but was 1.1.]).once
    @validator.validate
  end

  def test_should_be_invalid_when_actual_version_does_not_match_expected_version_and_validation_level_is_fatal
    @config.stubs(:version_validation_level).returns(:fatal)
    @version_detector.stubs(:version).returns('1.1')
    @printer.expects(:print_error).with(%Q[Version validation for command "command" failed. Expected version 1.0 but was 1.1.]).once
    @validator.validate
  end

end