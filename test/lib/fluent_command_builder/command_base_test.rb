require 'test/unit'
require 'mocha'
require_relative '../../../lib/fluent_command_builder'
include FluentCommandBuilder

class CommandBaseTest < Test::Unit::TestCase

  def setup
    @underlying_builder = stub
    @command_base = CommandBase.new @underlying_builder
  end

  def test_should_yield_builder_and_execute
    yielded_builder = nil
    @underlying_builder.expects(:execute).once
    @command_base.execute! { |b| yielded_builder = b }
    assert_equal @underlying_builder, yielded_builder
  end

  def test_should_return_result_of_yield_on_to_s
    actual = @command_base.to_s do |b|
      assert_equal @underlying_builder, b
      'command'
    end
    assert_equal 'command', actual
  end

  def test_should_yield_builder_and_to_s
    @underlying_builder.stubs(:to_s).returns('command')
    actual = @command_base.to_s
    assert_equal 'command', actual
  end

end