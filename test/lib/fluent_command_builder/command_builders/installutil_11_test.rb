# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class InstallUtil11Test < CommandTestBase

  def test_full_command
    expected = 'installUtil /help assemblyPath /help /logFile=fileName /logFile /logToConsole=bool /showCallStack /uninstall assemblyFileName'
    actual = installutil_11.help('assemblyPath').help.log_file('fileName').log_file.log_to_console('bool').show_call_stack.uninstall.assembly_file_name('assemblyFileName')
    assert_command expected, actual
  end

end