require 'test/unit'
require 'mocha'
require 'tmpdir'
require_relative '../../../lib/fluent_command_builder'
include FluentCommandBuilder

class VersionValidatorTest < Test::Unit::TestCase

  def setup
    @version_detector = stub
    @printer = stub
    @validator = VersionValidator.new 'target', @version_detector
    @validator.printer = @printer
    @validator.should_abort_on_fatal = false
  end

  def test_should_raise_when_validation_level_not_supported
    begin
      @validator.validation_level = :unreal
      @validator.validate '1.0'
      raise
    rescue => e
      assert_equal %Q[Validation level "unreal" is not supported.], e.message
    end
  end

  def test_should_not_validate_when_validation_level_is_off
    @validator.validation_level = :off
    @validator.validate '1.0'
  end

  def test_should_not_validate_when_unable_to_determine_version
    @validator.validation_level = :fatal
    @version_detector.stubs(:version).returns(nil)
    @printer.expects(:print_warning).with(%Q[Version validation for "target" failed. Expected version 1.0 but was unable to determine actual version.]).once
    @validator.validate '1.0'
  end

  def test_should_be_valid_when_actual_version_matches_expected_version
    @validator.validation_level = :fatal
    @version_detector.stubs(:version).returns('1.0')
    @validator.validate '1.0'
  end

  def test_should_be_invalid_when_actual_version_does_not_match_expected_version_and_validation_level_is_warn
    @validator.validation_level = :warn
    @version_detector.stubs(:version).returns('1.1')
    @printer.expects(:print_warning).with(%Q[Version validation for "target" failed. Expected version 1.0 but was 1.1.]).once
    @validator.validate '1.0'
  end

  def test_should_be_invalid_when_actual_version_does_not_match_expected_version_and_validation_level_is_fatal
    @validator.validation_level = :fatal
    @version_detector.stubs(:version).returns('1.1')
    @printer.expects(:print_error).with(%Q[Version validation for "target" failed. Expected version 1.0 but was 1.1.]).once
    @validator.validate '1.0'
  end

end