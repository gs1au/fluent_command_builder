require 'test/unit'
require_relative 'test_helper'
require_relative '../command_text'
include CodeGenerator

class TestCommandText < Test::Unit::TestCase

  def test_should_expand_options
    command_text = CommandText.new "command\n  -option"
    command_text.expand_options ['-option:<arg>']
    assert_equal "command\n  -option:<arg>", command_text.to_s
  end

  def test_should_return_yaml
    command_text = CommandText.new "command\n  -option:<arg>"
    yaml = command_text.yaml
    array = YAML.load yaml
    assert_kind_of Array, array
  end

end