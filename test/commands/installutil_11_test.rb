# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class InstallUtil11Test < CommandTestBase

  def test_full_command
    expected = 'installUtil /help assemblyPath /logFile=fileName /logToConsole=bool /showCallStack /uninstall assemblyFileName'
    actual = installutil_11.help('assemblyPath').log_file('fileName').log_to_console('bool').show_call_stack.uninstall.assembly_file_name('assemblyFileName')
    assert_command expected, actual
  end

  def test_help_assembly_path_is_optional
    expected = 'installUtil /help'
    actual = installutil_11.help
    assert_command expected, actual
  end

  def test_log_file_file_name_is_optional
    expected = 'installUtil /logFile'
    actual = installutil_11.log_file
    assert_command expected, actual
  end

end