require 'test/unit'
require_relative '../../../lib/fluent_command_builder/underlying_builder'
include FluentCommandBuilder

class UnderlyingBuilderTest < Test::Unit::TestCase

  def test_initialize_with_existing_command
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    assert_equal 'commandName', builder.to_s
  end

  def test_format_array_using_delimiter
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    value = builder.format %w(a b c), ';'
    assert_equal 'a;b;c', value
  end

  def test_format_hash_using_key_value_separator_and_delimiter
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    value = builder.format({'a' => '1', 'b' => 2, 'c' => 3}, ';', '=')
    assert_equal 'a=1;b=2;c=3', value
  end

  def test_format_plain_string_is_not_altered
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    value = builder.format 'plainString'
    assert_equal 'plainString', value
  end

  def test_format_command_base_object
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    value = builder.format CommandBase.new(UnderlyingBuilder.new CommandBuilderConfig.new('subCommandName', '1.0'))
    assert_equal 'subCommandName', value
  end

  def test_should_not_append_trailing_space
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    builder.append 'optionName'
    assert_no_match /\s$/, builder.to_s
  end

end