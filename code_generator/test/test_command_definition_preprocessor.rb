require 'stringio'
require 'yaml'
require 'test/unit'
require_relative 'test_helper'
require_relative '../command_definition_preprocessor'
include CodeGenerator

class TestCommandDefinitionPreprocessor < Test::Unit::TestCase

  def test_should_expand_options
    stream = StringIO.new "1.0\ncommand\n  -option\noptions:\n  -option:<arg>"
    preprocessor = CommandDefinitionPreprocessor.new stream
    preprocessor.expand_options
    assert_equal "1.0\ncommand\n  -option:<arg>", preprocessor.result_text
  end

  def test_should_return_yaml
    stream = StringIO.new "1.0\ncommand\n  -option:<arg>"
    preprocessor = CommandDefinitionPreprocessor.new stream
    yaml = preprocessor.yaml
    array = YAML.load yaml
    assert_kind_of Array, array
  end

end