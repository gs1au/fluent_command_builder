require 'test/unit'
require_relative '../../code_generator/lib/fragment'

class TestFragment < Test::Unit::TestCase

  def test_should_return_fragment_text_unchanged_when_not_optional
    fragment = Fragment.new '/option:<optionValue>'
    assert_equal '/option:<optionValue>', fragment.fragment_text
  end

  def test_should_return_fragment_text_with_square_brackets_removed_when_optional
    fragment = Fragment.new '[:<optionValue>]'
    assert_equal ':<optionValue>', fragment.fragment_text
  end

  def test_should_determine_that_fragment_is_not_optional
    fragment = Fragment.new '/option'
    assert_equal false, fragment.optional?
  end

  def test_should_determine_that_fragment_is_optional
    fragment = Fragment.new '[:<optionValue>]'
    assert_equal true, fragment.optional?
  end

  def test_should_return_one_arg_when_fragment_contains_one_arg
    fragment = Fragment.new '/option:<optionValue>'
    assert_equal 1, fragment.args.length
  end

  def test_should_return_one_arg_name_when_fragment_contains_one_arg
    fragment = Fragment.new '/option:<optionValue>'
    assert_equal 1, fragment.arg_names.length
  end

  def test_should_determine_that_fragment_does_not_have_args
    fragment = Fragment.new '/option'
    assert_equal false, fragment.has_args?
  end

  def test_should_determine_that_fragment_has_args
    fragment = Fragment.new '/option:<optionValue>'
    assert_equal true, fragment.has_args?
  end

end