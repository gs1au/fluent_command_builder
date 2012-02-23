require 'test/unit'
require_relative 'test_helper'
require_relative '../command_definition_text'
include CodeGenerator

class TestCommandDefinitionText < Test::Unit::TestCase

  def test_should_get_versions
    command_definition_text = CommandDefinitionText.new "1.0\ncommand"
    assert_equal 1, command_definition_text.versions.length
    assert_equal '1.0', command_definition_text.versions[0]
  end

  def test_should_get_command_text
    command_definition_text = CommandDefinitionText.new "1.0\ncommand\n  -option"
    assert_equal "command\n  -option", command_definition_text.command_text.to_s
  end

  def test_should_get_option_references
    command_definition_text = CommandDefinitionText.new "1.0\ncommand\n  -option\noptions:\n  -option:<arg>"
    assert_equal 1, command_definition_text.option_references.length
    assert_equal '-option:<arg>', command_definition_text.option_references[0]
  end

end
