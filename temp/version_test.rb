require 'test/unit'
require_relative '../../../../lib/fluent_command_builder'
include FluentCommandBuilder

class VersionTest < Test::Unit::TestCase

  def test_initialize
    begin
      Version.new 'abc'
      raise
    rescue => e
      assert_equal 'abc is not a valid version.', e.message
    end
  end

  def test_compact
    v = Version.new '1.0'
    assert_equal '10', v.compact
  end

  def test_first
    v = Version.new '1.0'
    assert_equal '1', v.first(1)
  end

  def test_first_with_delimiter
    v = Version.new '1.0'
    assert_equal '1-0', v.first(2, '-')
  end

  def test_to_s
    v = Version.new '1.0'
    assert_equal '1.0', v.to_s
  end

  def test_to_a
    v = Version.new '1.0'
    assert_equal %w(1 0), v.to_a
  end

  def test_match
    v = Version.match('text 1.0 text')
    assert_equal '1.0', v.to_s
  end

  def test_match_fails
    v = Version.match('text text')
    assert_equal nil, v
  end

end