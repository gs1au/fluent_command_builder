require 'test/unit'
require_relative '../../../lib/fluent_command_builder/underlying_builder'
include FluentCommandBuilder

class UnderlyingBuilderTest < Test::Unit::TestCase

  def test_initialize_with_existing_command
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    assert_equal 'commandName', builder.to_s
  end

  def test_should_not_append_trailing_space
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    builder.append 'optionName'
    assert_no_match /\s$/, builder.to_s
  end

end