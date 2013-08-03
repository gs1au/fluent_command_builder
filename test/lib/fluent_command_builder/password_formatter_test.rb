require 'test/unit'
require_relative '../../../lib/fluent_command_builder'

class PasswordFormatterTest < Test::Unit::TestCase
  include FluentCommandBuilder

  def test_default_format
    f = PasswordFormatter.new
    actual = f.format 'command password123', %w(password123)
    assert_equal 'command ***', actual
  end

  def test_custom_format
    f = PasswordFormatter.new
    f.replacement = '...'
    actual = f.format 'command password123', %w(password123)
    assert_equal 'command ...', actual
  end

  def test_disabled
    f = PasswordFormatter.new
    f.enabled = false
    actual = f.format 'command password123', %w(password123)
    assert_equal 'command password123', actual
  end

  def test_static_instance
    assert_equal PasswordFormatter, FluentCommandBuilder.password_formatter.class
  end

end