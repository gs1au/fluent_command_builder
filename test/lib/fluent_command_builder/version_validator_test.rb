require 'test/unit'
require 'mocha/setup'
require_relative '../../../lib/fluent_command_builder'

class VersionValidatorTest < Test::Unit::TestCase
  include FluentCommandBuilder

  def setup
    @printer = stub
    @validator = VersionValidator.new 'target'
    @validator.printer = @printer
    @validator.should_abort_on_fatal = false
  end

  def test_should_raise_when_validation_level_not_supported
    begin
      @validator.validation_level = :unreal
      @validator.validate '1.0'
      raise
    rescue => e
      assert_equal 'Validation level "unreal" is not supported.', e.message
    end
  end

  def test_should_not_validate_when_validation_level_is_off
    @validator.validation_level = :off
    @validator.validate '1.0'
  end

  def test_should_not_validate_when_unable_to_determine_version
    @validator.validation_level = :fatal
    @validator.get_version = lambda { |path| nil }
    @printer.expects(:print_warning).with('Version validation for "target" failed. Expected version 1.0 but was unable to determine actual version.').once
    @validator.validate '1.0'
  end

  def test_should_be_valid_when_actual_version_matches_expected_version
    @validator.validation_level = :fatal
    @validator.get_version = lambda { |path| '1.0' }
    @validator.validate '1.0'
  end

  def test_should_be_invalid_when_actual_version_does_not_match_expected_version_and_validation_level_is_warn
    @validator.validation_level = :warn
    @validator.get_version = lambda { |path| '1.1' }
    @printer.expects(:print_warning).with('Version validation for "target" failed. Expected version 1.0 but was 1.1.').once
    @validator.validate '1.0'
  end

  def test_should_be_invalid_when_actual_version_does_not_match_expected_version_and_validation_level_is_fatal
    @validator.validation_level = :fatal
    @validator.get_version = lambda { |path| '1.1' }
    @printer.expects(:print_error).with('Version validation for "target" failed. Expected version 1.0 but was 1.1.').once
    @validator.validate '1.0'
  end

end