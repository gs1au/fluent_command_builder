require 'test/unit'
require_relative '../lib/fluent_command_builder/command_builder'
include FluentCommandBuilder

class TestCommandBuilder < Test::Unit::TestCase

  def test_should_initialize_with_existing_command
    builder = CommandBuilder.new 'MSBuild'
    assert_equal 'MSBuild', builder.to_s
  end

  def test_should_format_array_using_delimiter
    builder = CommandBuilder.new
    value = builder.format(['a', 'b', 'c'], ';')
    assert_equal 'a;b;c', value
  end

  def test_should_format_hash_using_key_value_separator_and_delimiter
    builder = CommandBuilder.new
    value = builder.format({:a => '1', :b => 2, :c => 3}, ';', '=')
    assert_equal 'a=1;b=2;c=3', value
  end

  def test_should_not_contain_trailing_space
    builder = CommandBuilder.new
    builder.append('MSBuild')
    builder.append('/property:a=1')
    assert_no_match /\s$/, builder.to_s
  end

end