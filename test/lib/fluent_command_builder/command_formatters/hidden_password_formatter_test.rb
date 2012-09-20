require 'test/unit'
require_relative '../../../../lib/fluent_command_builder'
require_relative '../../../../lib/fluent_command_builder/command_builder_config'
require_relative '../../../../lib/fluent_command_builder/command_formatters/hidden_password_formatter'
include FluentCommandBuilder

class HiddenPasswordFormatterTest < Test::Unit::TestCase

  def test_password_is_hidden
    f = HiddenPasswordFormatter.new
    b = UnderlyingBuilder.new CommandBuilderConfig.new('command', '1.0')
    b.append " -password #{b.format_password 'password123'}"
    expected = 'command -password ***'
    actual = f.format b
    assert_equal expected, actual
  end

end