require 'test/unit'
require_relative '../../code_generator/lib/command'

class TestCommand < Test::Unit::TestCase

  # command_name should return the actual command to be executed so should not be modified

  def test_should_return_correct_command_name_when_command_has_no_arg
    command = Command.new 'command'
    assert_equal 'command', command.command_name
  end

  def test_should_return_correct_command_name_when_command_has_an_arg
    command = Command.new 'command <arg>'
    assert_equal 'command', command.command_name
  end

  def test_should_return_correct_command_name_when_alias_is_specified
    command = Command.new 'command (commandAlias)'
    assert_equal 'command', command.command_name
  end

  def test_should_return_correct_node_name_when_command_has_no_arg
    command = Command.new 'command'
    assert_equal 'command', command.node_name
  end

  def test_should_return_correct_node_name_when_command_has_an_arg
    command = Command.new 'command <arg>'
    assert_equal 'command', command.node_name
  end

  def test_should_return_alias_as_node_name_when_alias_is_specified
    command = Command.new 'command (commandAlias)'
    assert_equal 'commandAlias', command.node_name
  end

  def test_should_exclude_command_name_in_first_fragment
    command = Command.new 'command <arg>'
    assert_equal ' <arg>', command.fragments[0].fragment_text
  end


end