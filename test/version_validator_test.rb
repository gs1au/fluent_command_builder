#require 'test/unit'
#require_relative '../lib/fluent_command_builder'
#include FluentCommandBuilder
#
#class VersionValidatorTest < Test::Unit::TestCase
#
#  def test_should_not_validate_when_version_is_nil
#    b = UnderlyingBuilder.new 'command'
#    v = VersionValidator.new 'command', '/', '1.0',
#    $stdout = StringIO.new
#    v.validate
#    assert_equal '', $stdout.string
#  end
#
#  def test_should_not_validate_when_actual_version_lambda_is_nil
#    b = UnderlyingBuilder.new 'command', '1.0'
#    v = StatefulVersionValidator.new b
#    $stdout = StringIO.new
#    v.validate
#    assert_equal '', $stdout.string
#  end
#
#  def test_should_warn_when_unable_to_determine_actual_version
#    b = UnderlyingBuilder.new 'command', '1.0'
#    b.actual_version_lambda = lambda { |path|}
#    v = StatefulVersionValidator.new b
#    v.warn_only = true
#    $stdout = StringIO.new
#    v.validate
#    assert_equal "\e[33mWARNING: Version validation for command \"command\" failed. Expected version 1.0 but was unable to determine actual version.\e[0m\n", $stdout.string
#  end
#
#  def test_should_warn_on_unexpected_version
#    b = UnderlyingBuilder.new 'command', '1.0'
#    b.actual_version_lambda = lambda { |path| '1.1' }
#    v = StatefulVersionValidator.new b
#    v.warn_only = true
#    $stdout = StringIO.new
#    v.validate
#    assert_equal "\e[33mWARNING: Version validation for command \"command\" failed. Expected version 1.0 but was 1.1.\e[0m\n", $stdout.string
#  end
#
#  def test_should_fail_on_unexpected_version
#    b = UnderlyingBuilder.new 'command', '1.0'
#    b.actual_version_lambda = lambda { |path| '1.1' }
#    v = StatefulVersionValidator.new b
#    $stdout = StringIO.new
#
#    begin
#      v.validate
#    rescue => e
#      assert_equal "Version validation for command \"command\" failed. Expected version 1.0 but was 1.1.", e.message
#      assert_equal "\e[31mERROR: Version validation for command \"command\" failed. Expected version 1.0 but was 1.1.\e[0m\n", $stdout.string
#      return
#    end
#
#    fail
#  end
#
#end