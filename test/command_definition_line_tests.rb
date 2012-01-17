require 'test/unit'
require '../rakelib/command_definition_line'

class CommandDefinitionLineTests < Test::Unit::TestCase

  def test_get_command_name
    line = CommandDefinitionLine.new 'MSBuild'
    assert_equal 'MSBuild', line.command_name
  end

  def test_get_command_name_with_spaces
    line = CommandDefinitionLine.new 'set portopening'
    assert_equal 'set portopening', line.command_name
  end

  def test_command_name_is_nil_when_option_specified
    line = CommandDefinitionLine.new '-p <physicalPath>'
    assert_nil line.command_name
  end

  def test_get_option_name_when_argument_specified
    line = CommandDefinitionLine.new '-p <physicalPath>'
    assert_equal 'p', line.option_name
  end

  def test_get_option_name_when_no_argument_specified
    line = CommandDefinitionLine.new '-c'
    assert_equal 'c', line.option_name
  end

  def test_argument_name_returned_instead_of_option_name_when_none_specified
    line = CommandDefinitionLine.new '<projectFile>'
    assert_equal 'projectFile', line.option_name
  end

  def test_get_argument_name_when_option_specified
    line = CommandDefinitionLine.new '-p <physicalPath>'
    assert_equal 'physicalPath', line.arg_name
  end

  def test_get_argument_name_when_no_option_specified
    line = CommandDefinitionLine.new '<projectFile>'
    assert_equal 'projectFile', line.arg_name
  end

  def test_arg_name_is_nil_when_none_specified
    line = CommandDefinitionLine.new '-c'
    assert_nil line.arg_name
  end

  def test_get_key_value_separator
    line = CommandDefinitionLine.new '/property:<property=;>'
    assert_equal '=', line.key_value_separator
  end

  def test_key_value_separator_is_nil_when_only_delimiter_present
    line = CommandDefinitionLine.new '/target:<target;>'
    assert_nil line.key_value_separator
  end

  def test_key_value_separator_is_nil_when_none_specified
    line = CommandDefinitionLine.new '/verbosity:<level>'
    assert_nil line.key_value_separator
  end

  def test_get_delimiter
    line = CommandDefinitionLine.new '/target:<target;>'
    assert_equal ';', line.delimiter
  end

  def test_get_delimiter_when_key_value_separator_also_specified
    line = CommandDefinitionLine.new '/property:<property=;>'
    assert_equal ';', line.delimiter
  end

  def test_delimiter_is_nil_when_none_specified
    line = CommandDefinitionLine.new '/verbosity:<level>'
    assert_nil line.delimiter
  end

end