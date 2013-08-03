require 'test/unit'
require 'mocha/setup'
require_relative '../../../../lib/fluent_command_builder'

class PathTest < Test::Unit::TestCase
  include FluentCommandBuilder

  def test_should_join_path_on_initialize
    p = Path.new 'a', 'b'
    assert_equal 'a/b', p.path
  end

  def test_should_normalise_path_on_unix
    ENV['WINDIR'] = nil
    p = Path.new '\\path'
    assert_equal '/path', p.normalised_path
  end

  def test_should_normalise_path_on_windows
    ENV['WINDIR'] = 'C:\\Windows'
    p = Path.new 'C:/path'
    assert_equal 'C:\\path', p.normalised_path
  end

  unless ENV['WINDIR']
    def test_should_evaluate_path_on_unix
      p = Path.new '$command_path'
      ENV['command_path'] = '/path'
      assert_equal '/path', p.evaluated_path
    end
  end

  if ENV['WINDIR']
    def test_should_evaluate_path_on_windows
      p = Path.new '%command_path%'
      ENV['command_path'] = 'C:\\path'
      assert_equal 'C:\\path', p.evaluated_path
    end
  end

  def test_should_ignore_empty_path_entries
    p = Path.new '', 'command'
    assert_equal 'command', p.path
  end

end