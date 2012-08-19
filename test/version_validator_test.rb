require 'test/unit'
require_relative 'lib/mock_executor'
require_relative 'lib/mock_path_finder'
require_relative '../lib/fluent_command_builder'
include FluentCommandBuilder

class VersionValidatorTest < Test::Unit::TestCase

  def test_is_not_valid
    FluentCommandBuilder.executor.backticks_executor = MockExecutor.new '1.2.0'
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    validator = VersionValidator.new FluentCommandBuilder::Cucumber::V11::Cucumber, '/'
    assert_equal false, validator.is_valid?
  end

  def test_is_valid
    FluentCommandBuilder.executor.backticks_executor = MockExecutor.new '1.2.0'
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    validator = VersionValidator.new FluentCommandBuilder::Cucumber::V12::Cucumber, '/'
    assert_equal true, validator.is_valid?
  end

end