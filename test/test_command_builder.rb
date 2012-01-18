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
    builder.append_format(['a', 'b', 'c'], ';') { |v| v }
    assert_equal 'a;b;c', builder.to_s
  end

  def test_should_format_hash_using_key_value_separator_and_delimiter
    builder = CommandBuilder.new
    builder.append_format({:a => '1', :b => 2, :c => 3}, ';', '=') { |v| v }
    assert_equal 'a=1;b=2;c=3', builder.to_s
  end

end