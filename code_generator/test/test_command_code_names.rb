require 'test/unit'
require_relative 'test_helper'
require_relative '../command'
require_relative '../command_code_names'
include CodeGenerator

class TestCommandCodeNames < Test::Unit::TestCase

  # module_name

  def test_module_name_where_executable_is_lowercase
    assert_equal 'Command', command_code_names('command').module_name
  end

  def test_module_name_where_executable_is_snakecase
    assert_equal 'CommandTool', command_code_names('command_tool').module_name
  end

  def test_module_name_where_executable_is_lowercase_and_contains_dash
    assert_equal 'CommandTool', command_code_names('command-tool').module_name
  end

  def test_module_name_where_executable_is_lowercase_and_contains_space
    assert_equal 'Command', command_code_names('command tool').module_name
    # note: executable with space is not yet supported
  end

  def test_module_name_where_executable_is_camelcase_and_starts_with_lowercase
    assert_equal 'CommandTool', command_code_names('commandTool').module_name
  end

  def test_module_name_where_executable_is_camelcase_and_starts_with_uppercase
    assert_equal 'CommandTool', command_code_names('CommandTool').module_name
  end

  def test_module_name_where_executable_is_uppercase
    assert_equal 'Command', command_code_names('COMMAND').module_name
  end

  def test_module_name_where_executable_contains_uppercase_letters_and_digits
    assert_equal 'CMD123', command_code_names('CMD123').module_name
    # note: uppercase letters preserved
  end

  def test_module_name_where_executable_contains_consecutive_uppercase_letters
    assert_equal 'CMDTool', command_code_names('CMDTool').module_name
    # note: consecutive uppercase letters preserved
  end

  # version_module_name

  def test_version_module_name_where_version_starts_with_digit
    assert_equal 'V1', command_code_names('command', '1').version_module_name
  end

  def test_version_module_name_where_version_starts_with_digit_and_contains_dot
    assert_equal 'V10', command_code_names('command', '1.0').version_module_name
    # note: dot removed
  end

  def test_version_module_name_where_version_is_lowercase
    assert_equal 'Beta', command_code_names('command', 'beta').version_module_name
  end

  def test_version_module_name_where_version_is_snakecase
    assert_equal 'AlphaBeta', command_code_names('command', 'alpha_beta').version_module_name
  end

  def test_version_module_name_where_version_is_lowercase_and_contains_dash
    assert_equal 'AlphaBeta', command_code_names('command', 'alpha-beta').version_module_name
  end

  def test_version_module_name_where_version_is_lowercase_and_contains_space
    assert_equal 'AlphaBeta', command_code_names('command', 'alpha beta').version_module_name
  end

  def test_version_module_name_where_version_is_camelcase_and_starts_with_lowercase
    assert_equal 'AlphaBeta', command_code_names('command', 'alphaBeta').version_module_name
  end

  def test_version_module_name_where_version_is_camelcase_and_starts_with_uppercase
    assert_equal 'AlphaBeta', command_code_names('command', 'AlphaBeta').version_module_name
  end

  def test_version_module_name_where_version_is_uppercase
    assert_equal 'Beta', command_code_names('command', 'BETA').version_module_name
  end

  def test_version_module_name_where_executable_contains_uppercase_letters_and_digits
    assert_equal 'BETA1', command_code_names('BETA1').module_name
    # note: uppercase letters preserved
  end

  def test_version_module_name_where_version_contains_consecutive_uppercase_letters
    assert_equal 'ALPHABeta', command_code_names('command', 'ALPHABeta').version_module_name
    # note: consecutive uppercase letters preserved
  end

  # factory_method_name

  def test_factory_method_name_where_executable_is_lowercase
    assert_equal 'command', command_code_names('command').factory_method_name
  end

  def test_factory_method_name_where_executable_is_snakecase
    assert_equal 'command_tool', command_code_names('command_tool').factory_method_name
  end

  def test_factory_method_name_where_executable_is_lowercase_and_contains_dash
    assert_equal 'command_tool', command_code_names('command-tool').factory_method_name
  end

  def test_factory_method_name_where_executable_is_lowercase_and_contains_space
    assert_equal 'command', command_code_names('command tool').factory_method_name
    # note: executable with space is not yet supported
  end

  def test_factory_method_name_where_executable_is_camelcase_and_starts_with_lowercase
    assert_equal 'commandtool', command_code_names('commandTool').factory_method_name
    # note: no underscore
  end

  def test_factory_method_name_where_executable_is_camelcase_and_starts_with_uppercase
    assert_equal 'commandtool', command_code_names('CommandTool').factory_method_name
    # note: no underscore
  end

  def test_factory_method_name_where_executable_is_uppercase
    assert_equal 'command', command_code_names('COMMAND').factory_method_name
  end

  def test_factory_method_name_where_executable_contains_uppercase_letters_and_digits
    assert_equal 'command123', command_code_names('COMMAND123').factory_method_name
    # note: no underscore
  end

  def test_factory_method_name_where_executable_contains_consecutive_uppercase_letters
    assert_equal 'cmdtool', command_code_names('CMDTool').factory_method_name
    # note: no underscore
  end

  private

  def command_code_names(command_def, version='0')
    command = Command.new command_def
    CommandCodeNames.new command, version
  end

end