require 'test/unit'
require_relative 'test_helper'
require_relative '../command_argument'
include CodeGenerator

class TestCommandDefinitionLine < Test::Unit::TestCase

  def test_should_return_arg_name_with_angle_brackets_removed
    arg = CommandArgument.new '<value>'
    assert_equal 'value', arg.arg_name
  end

  def test_should_return_key_value_separator_when_specified_together_with_delimiter
    arg = CommandArgument.new '<value=;>'
    assert_equal '=', arg.key_value_separator
  end

  def test_should_return_nil_when_key_value_separator_not_specified
    arg = CommandArgument.new '<target;>'
    assert_nil arg.key_value_separator
  end

  def test_should_return_delimiter_when_specified
    arg = CommandArgument.new '<target;>'
    assert_equal ';', arg.delimiter
  end

  def test_should_return_delimiter_when_key_value_separator_also_specified
    arg = CommandArgument.new '<property=;>'
    assert_equal ';', arg.delimiter
  end

  def test_should_return_nil_when_delimiter_not_specified
    arg = CommandArgument.new '<level>'
    assert_nil arg.delimiter
  end

end