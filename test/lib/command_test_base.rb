require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class CommandTestBase < Test::Unit::TestCase

  def assert_command(expected_command_text, actual_command_obj)
    assert_equal expected_command_text, actual_command_obj.to_s
  end

  def assert_each_command(expected_command_text, *actual_command_objs)
    actual_command_objs.each do |command|
      actual_command_obj = block_given? ? yield(command) : command
      assert_command expected_command_text, actual_command_obj
    end
  end

end