require 'test/unit'
require 'mocha/setup'
require_relative '../../../../lib/fluent_command_builder'


class UnderlyingBuilderTest < Test::Unit::TestCase
  include FluentCommandBuilder

  def test_should_format_passwords_on_execute
    config = stub
    config.stubs(:validate_path)
    config.stubs(:validate_version)
    config.stubs(:executable)
    builder = UnderlyingBuilder.new config

    password_formatter = stub
    password_formatter.expects(:format).once
    builder.password_formatter = password_formatter

    execution_context = stub
    execution_context.expects(:execute)
    builder.execution_context = execution_context

    builder.execute
  end

  def test_initialize_with_existing_command
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    assert_equal 'commandName', builder.to_s
  end

  def test_should_not_append_trailing_space
    builder = UnderlyingBuilder.new CommandBuilderConfig.new('commandName', '1.0')
    builder.append 'optionName'
    assert_no_match /\s$/, builder.to_s
  end

end