require 'test/unit'
require 'mocha'
require_relative '../../../../lib/fluent_command_builder'
include FluentCommandBuilder

class PathTest < Test::Unit::TestCase

  def test_should_normalise_path_on_unix
    p = Path.new '\\path'
    p.is_windows = false
    assert_equal '/path', p.normalised_path
  end

  def test_should_normalise_path_on_windows
    p = Path.new 'C:/path'
    p.is_windows = true
    assert_equal 'C:\\path', p.normalised_path
  end

  def test_should_evaluate_path_on_unix
    p = Path.new '$command_path'
    return if p.is_windows
    ENV['command_path'] = '/path'
    assert_equal '/path', p.evaluated_path
  end

  def test_should_evaluate_path_on_windows
    p = Path.new '%command_path%'
    return unless p.is_windows
    ENV['command_path'] = 'C:\\path'
    assert_equal 'C:\\path', p.evaluated_path
  end

end