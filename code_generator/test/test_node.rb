require 'test/unit'
require_relative 'test_helper'
require_relative '../node'
include CodeGenerator

class TestNode < Test::Unit::TestCase

  def test_should_determine_that_node_is_leaf_when_node_has_no_child_nodes
    node = CodeGenerator::Node.new '/option'
    assert_equal true, node.leaf?
    assert_equal false, node.branch?
  end

  def test_should_determine_that_node_is_branch_when_node_has_a_child_node
    node = CodeGenerator::Node.new 'command'
    node.child_nodes << CodeGenerator::Node.new('/option')
    assert_equal true, node.branch?
    assert_equal false, node.leaf?
  end

  def test_should_return_correct_node_name_when_node_has_no_arg
    node = CodeGenerator::Node.new '/option'
    assert_equal 'option', node.node_name
  end

  def test_should_return_correct_node_name_when_node_has_an_arg
    node = CodeGenerator::Node.new '/option:<optionValue>'
    assert_equal 'option', node.node_name
  end

  def test_should_return_correct_node_name_when_node_only_an_arg
    node = CodeGenerator::Node.new '<optionValue>'
    assert_equal 'optionValue', node.node_name
  end

  def test_should_return_alias_as_node_name_when_alias_is_specified
    node = CodeGenerator::Node.new '/option:<optionValue> (optionAlias)'
    assert_equal 'optionAlias', node.node_name
  end

  def test_should_return_one_fragment_when_node_contains_one_fragment
    node = CodeGenerator::Node.new '/option:<optionValue>'
    assert_equal 1, node.fragments.length
  end

  def test_should_return_two_fragments_when_one_part_of_node_is_optional
    node = CodeGenerator::Node.new '/option[:<optionValue>]'
    assert_equal 2, node.fragments.length
  end

  def test_should_return_no_required_or_optional_args_when_fragment_contains_no_args
    node = CodeGenerator::Node.new '/option'
    assert_empty node.required_args
    assert_empty node.optional_args
  end

  def test_should_return_one_required_arg_when_fragment_contains_one_arg
    node = CodeGenerator::Node.new '/option:<optionValue>'
    assert_empty node.optional_args
    assert_equal 1, node.required_args.length
  end

  def test_should_return_one_optional_arg_when_fragment_contains_one_optional_arg
    node = CodeGenerator::Node.new '/option[:<optionValue>]'
    assert_empty node.required_args
    assert_equal 1, node.optional_args.length
  end

end