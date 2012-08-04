require 'test/unit'
require_relative '../../code_generator/lib/command'
require_relative '../../code_generator/lib/command_code_names'
include CodeGenerator

class TestCommandCodeNames < Test::Unit::TestCase

  def test_module_name
    assert_module_name 'Command', 'command', 'COMMAND'
    assert_module_name 'CommandTool', 'command_tool', 'command-tool', 'commandTool', 'CommandTool'
    assert_module_name 'CMDTool', 'CMDTool'
    assert_module_name 'CMD123', 'CMD123'
  end

  def test_version_module_name
    assert_version_module_name 'V1', '1'
    assert_version_module_name 'V10', '1.0'
    assert_version_module_name 'Beta', 'beta', 'BETA'
    assert_version_module_name 'AlphaBeta', 'alpha beta', 'alpha_beta', 'alpha-beta', 'alphaBeta', 'AlphaBeta'
    assert_version_module_name 'BETA1', 'BETA1'
    assert_version_module_name 'ALPHABeta', 'ALPHABeta'
  end

  def test_factory_method_name
    assert_factory_method_name 'command', 'command', 'COMMAND'
    assert_factory_method_name 'command_tool', 'command_tool', 'command-tool'
    assert_factory_method_name 'commandtool', 'commandTool', 'CommandTool'
    assert_factory_method_name 'cmdtool', 'CMDTool'
    assert_factory_method_name 'cmd123', 'CMD123'
  end

  def test_version_factory_method_name
    assert_equal 'command_1', command_code_names('command', '1').version_factory_method_name
    assert_version_factory_method_name_starts_with 'command', 'command', 'COMMAND'
    assert_version_factory_method_name_starts_with 'command_tool', 'command_tool', 'command-tool'
    assert_version_factory_method_name_starts_with 'commandtool', 'commandTool', 'CommandTool'
    assert_version_factory_method_name_starts_with 'cmdtool', 'CMDTool'
    assert_version_factory_method_name_starts_with 'cmd123', 'CMD123'
    assert_version_factory_method_name_ends_with '1', '1'
    assert_version_factory_method_name_ends_with '10', '1.0'
    assert_version_factory_method_name_ends_with 'beta', 'beta', 'BETA'
    assert_version_factory_method_name_ends_with 'alpha_beta', 'alpha beta', 'alpha_beta', 'alpha-beta'
    assert_version_factory_method_name_ends_with 'alphabeta', 'alphaBeta', 'AlphaBeta', 'ALPHABeta'
    assert_version_factory_method_name_ends_with 'beta1', 'BETA1'
  end

  def test_class_name
    assert_module_name 'Command', 'command', 'COMMAND'
    assert_module_name 'CommandTool', 'command_tool', 'command-tool', 'commandTool', 'CommandTool'
    assert_module_name 'CMDTool', 'CMDTool'
    assert_module_name 'CMD123', 'CMD123'
  end

  private

  def assert_module_name(expected_module_name, *command_def)
    command_def.each { |c| assert_equal expected_module_name, command_code_names(c, '0').module_name }
  end

  def assert_version_module_name(expected_module_name, *version)
    version.each { |v| assert_equal expected_module_name, command_code_names('command', v).version_module_name }
  end

  def assert_factory_method_name(expected_method_name, *command_def)
    command_def.each { |c| assert_equal expected_method_name, command_code_names(c, '0').factory_method_name }
  end

  def assert_version_factory_method_name_starts_with(expected_method_name, *command_def)
    command_def.each { |c| assert_equal true, command_code_names(c, '0').version_factory_method_name.start_with?(expected_method_name) }
  end

  def assert_version_factory_method_name_ends_with(expected_method_name, *version)
    version.each { |v| assert_equal true, command_code_names('command', v).version_factory_method_name.end_with?(expected_method_name) }
  end

  def assert_class_name(expected_class_name, *command_def)
    command_def.each { |c| assert_equal expected_class_name, command_code_names(c, '0').class_name }
  end

  def command_code_names(command_def, version)
    CommandCodeNames.new Command.new(command_def), version
  end

end