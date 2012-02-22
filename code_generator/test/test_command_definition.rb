require 'stringio'
require 'test/unit'
require_relative 'test_helper'
require_relative '../command_definition'
include CodeGenerator

class TestCommandDefinition < Test::Unit::TestCase

  def test_should_return_versions
    stream = StringIO.new '1.0, 1.1, 2.0'
    command_definition = CommandDefinition.load_stream stream
    assert_equal '1.0', command_definition.versions[0]
    assert_equal '1.1', command_definition.versions[1]
    assert_equal '2.0', command_definition.versions[2]
  end

  def test_should_return_single_line_command
    stream = StringIO.new "1.0\ncommand"
    command_definition = CommandDefinition.load_stream stream
    assert_not_nil command_definition.command
    assert_equal 'command', command_definition.command.command_name
  end

  def test_should_return_command_with_node
    stream = StringIO.new "1.0\ncommand\n  -option"
    command_definition = CommandDefinition.load_stream stream
    assert_equal 1, command_definition.command.child_nodes.length
    assert_equal 'option', command_definition.command.child_nodes[0].node_name
  end

  def test_should_return_command_with_nested_nodes
    stream = StringIO.new "1.0\ncommand\n  subcommand\n    -option"
    command_definition = CommandDefinition.load_stream stream
    assert_not_nil command_definition.command
    assert_equal 1, command_definition.command.child_nodes[0].child_nodes.length
    assert_equal 'option', command_definition.command.child_nodes[0].child_nodes[0].node_name
  end

end