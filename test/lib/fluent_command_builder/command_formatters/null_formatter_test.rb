require 'test/unit'
require_relative '../../../../lib/fluent_command_builder'
require_relative '../../../../lib/fluent_command_builder/command_builder_config'
require_relative '../../../../lib/fluent_command_builder/command_formatters/null_formatter'
include FluentCommandBuilder

class NullFormatterTest < Test::Unit::TestCase

  def test_command_is_unchanged
    f = NullFormatter.new
    b = UnderlyingBuilder.new CommandBuilderConfig.new('command', '1.0')
    b.append " -password #{b.format_password 'password123'}"
    expected = 'command -password password123'
    actual = f.format b
    assert_equal expected, actual
  end

end