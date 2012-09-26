require 'test/unit'
require_relative '../../../../lib/fluent_command_builder'
include FluentCommandBuilder

class ArgumentFormatterTest < Test::Unit::TestCase
  include ArgumentFormatter

  def test_format_array_using_delimiter
    actual = format %w(a b c), ';'
    assert_equal 'a;b;c', actual
  end

  def test_format_hash_using_key_value_separator_and_delimiter
    actual = format({a: 1, b: 2, c: 3}, ';', '=')
    assert_equal 'a=1;b=2;c=3', actual
  end

  def test_format_plain_string_is_not_altered
    actual = format 'plainString'
    assert_equal 'plainString', actual
  end

  def test_format_command_base_object
    actual = format CommandBase.new(UnderlyingBuilder.new CommandBuilderConfig.new('command', '1.0'))
    assert_equal 'command', actual
  end

  def test_should_store_password
    @passwords = []
    format_password 'password'
    assert_equal 'password', @passwords[0]
  end

end