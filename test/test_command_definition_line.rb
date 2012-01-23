require 'test/unit'
require_relative '../rakelib/command_definition_line'

class TestCommandDefinitionLine < Test::Unit::TestCase

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
    assert_equal 'physicalPath', line.args[0].arg_name
  end

  def test_get_argument_name_when_no_option_specified
    line = CommandDefinitionLine.new '<projectFile>'
    assert_equal 'projectFile', line.args[0].arg_name
  end

  def test_arg_name_is_nil_when_none_specified
    line = CommandDefinitionLine.new '-c'
    assert_empty line.args
  end

end