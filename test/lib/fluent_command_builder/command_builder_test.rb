require 'test/unit'
require 'mocha'
require_relative '../../../lib/fluent_command_builder'
include FluentCommandBuilder

class CommandBuilderTest < Test::Unit::TestCase

  def test_initialize
    b = CommandBuilder.new 'command', '1.0'
    assert_equal 'command', b.to_s
  end

end