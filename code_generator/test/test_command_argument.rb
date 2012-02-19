require 'test/unit'
require_relative 'test_helper'
require_relative '../command_argument'
include CodeGenerator

class TestCommandDefinitionLine < Test::Unit::TestCase

  def test_get_argument_name_when_option_specified
    arg = CommandArgument.new '<physicalPath>'
    assert_equal 'physicalPath', arg.arg_name
  end

  def test_get_key_value_separator
    arg = CommandArgument.new '<property=;>'
    assert_equal '=', arg.key_value_separator
  end

  def test_key_value_separator_is_nil_when_only_delimiter_present
    arg = CommandArgument.new '<target;>'
    assert_nil arg.key_value_separator
  end

  def test_key_value_separator_is_nil_when_none_specified
    arg = CommandArgument.new '<level>'
    assert_nil arg.key_value_separator
  end

  def test_get_delimiter
    arg = CommandArgument.new '<target;>'
    assert_equal ';', arg.delimiter
  end

  def test_get_delimiter_when_key_value_separator_also_specified
    arg = CommandArgument.new '<property=;>'
    assert_equal ';', arg.delimiter
  end

  def test_delimiter_is_nil_when_none_specified
    arg = CommandArgument.new '<level>'
    assert_nil arg.delimiter
  end

end