require 'test/unit'
require_relative '../lib/fluent_command_builder'
require_relative 'lib/mock_version_detector'
include FluentCommandBuilder

class VersionValidatorTest < Test::Unit::TestCase

  def test_should_not_validate_when_validation_not_enabled
    v = VersionValidator.new 'command', '/path', '1.0', MockVersionDetector.new, enabled: false
    $stdout = StringIO.new
    v.validate
    assert_equal '', $stdout.string
  end

  def test_should_warn_when_unable_to_determine_actual_version
    v = VersionValidator.new 'command', '/path', '1.0', MockVersionDetector.new
    $stdout = StringIO.new
    v.validate
    assert_equal "\e[33mWARNING: Version validation for command \"command\" failed. Expected version 1.0 but was unable to determine actual version.\e[0m\n", $stdout.string
  end

  def test_should_warn_on_unexpected_version
    v = VersionValidator.new 'command', '/path', '1.0', MockVersionDetector.new('1.1'), warn_only: true
    $stdout = StringIO.new
    v.validate
    assert_equal "\e[33mWARNING: Version validation for command \"command\" failed. Expected version 1.0 but was 1.1.\e[0m\n", $stdout.string
  end

  def test_should_fail_on_unexpected_version
    v = VersionValidator.new 'command', '/path', '1.0', MockVersionDetector.new('1.1')
    $stdout = StringIO.new

    begin
      v.validate
    rescue => e
      assert_equal "Version validation for command \"command\" failed. Expected version 1.0 but was 1.1.", e.message
      assert_equal "\e[31mERROR: Version validation for command \"command\" failed. Expected version 1.0 but was 1.1.\e[0m\n", $stdout.string
      return
    end

    fail
  end

end