require 'test/unit'
require_relative '../lib/fluent_command_builder/command_builder'
include FluentCommandBuilder

class CommandBuilderTest < Test::Unit::TestCase

  def test_initialize_with_existing_command
    builder = CommandBuilder.new 'commandName'
    assert_equal 'commandName', builder.to_s
  end

  def test_format_array_using_delimiter
    builder = CommandBuilder.new 'commandName'
    value = builder.format %w(a b c), ';'
    assert_equal 'a;b;c', value
  end

  def test_format_hash_using_key_value_separator_and_delimiter
    builder = CommandBuilder.new 'commandName'
    value = builder.format({'a' => '1', 'b' => 2, 'c' => 3}, ';', '=')
    assert_equal 'a=1;b=2;c=3', value
  end

  def test_format_plain_string_is_not_altered
    builder = CommandBuilder.new 'commandName'
    value = builder.format 'plainString'
    assert_equal 'plainString', value
  end

  def test_format_command_base_object
    builder = CommandBuilder.new 'commandName'
    value = builder.format CommandBase.new(CommandBuilder.new 'subCommandName')
    assert_equal 'subCommandName', value
  end

  def test_should_not_append_trailing_space
    builder = CommandBuilder.new 'commandName'
    builder.append 'optionName'
    assert_no_match /\s$/, builder.to_s
  end

end