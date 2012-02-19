require 'test/unit'
require_relative 'test_helper'
require_relative '../node'
include CodeGenerator

class TestNode < Test::Unit::TestCase

  def test_node_is_leaf
    node = CodeGenerator::Node.new '/option'
    assert_true node.leaf?
    assert_false node.branch?
  end

  def test_node_is_branch
    node = CodeGenerator::Node.new 'command'
    node.child_nodes << CodeGenerator::Node.new('/option')
    assert_true node.branch?
    assert_false node.leaf?
  end

  def test_node_name_on_option_without_value
    node = CodeGenerator::Node.new '/option'
    assert_equal 'option', node.node_name
  end

  def test_node_name_on_option_with_value
    node = CodeGenerator::Node.new '/option:<optionValue>'
    assert_equal 'option', node.node_name
  end

  def test_node_name_on_pure_value
    node = CodeGenerator::Node.new '<optionValue>'
    assert_equal 'optionValue', node.node_name
  end

  def test_node_name_on_multiple_pure_values
    node = CodeGenerator::Node.new '<optionValue1><optionValue2>'
    assert_equal 'optionValue1', node.node_name
  end

  def test_node_name_on_option_with_alias
    node = CodeGenerator::Node.new '/option:<optionValue> (optionAlias)'
    assert_equal 'optionAlias', node.node_name
  end

  def test_node_with_no_optional_fragments
    node = CodeGenerator::Node.new '/option:<optionValue>'
    assert_equal 1, node.fragments.length
    assert_equal '/option:<optionValue>', node.fragments[0].fragment_text
  end

  def test_node_with_optional_fragment
    node = CodeGenerator::Node.new '/option[:<optionValue>]'
    assert_equal 2, node.fragments.length
    assert_equal '/option', node.fragments[0].fragment_text
    assert_equal ':<optionValue>', node.fragments[1].fragment_text
  end

  def test_node_with_required_arg
    node = CodeGenerator::Node.new '/option:<optionValue>'
    assert_empty node.optional_args
    assert_equal 1, node.required_args.length
    assert_equal 'optionValue', node.required_args[0].arg_name
  end

  def test_node_with_optional_arg
    node = CodeGenerator::Node.new '/option[:<optionValue>]'
    assert_empty node.required_args
    assert_equal 1, node.optional_args.length
    assert_equal 'optionValue', node.optional_args[0].arg_name
  end

end