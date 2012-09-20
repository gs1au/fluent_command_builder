# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class InstallUtil20Test < CommandTestBase
  include FluentCommandBuilder::InstallUtil::V20

  def test_full_command
    expected = 'installUtil /help assemblyPath /help /logFile=fileName /logFile /assemblyName=assemblyName /logToConsole=bool /showCallStack /uninstall assemblyFileName'
    actual = installutil.help('assemblyPath').help.log_file('fileName').log_file.assembly_strong_name('assemblyName').log_to_console('bool').show_call_stack.uninstall.assembly_file_name('assemblyFileName')
    assert_command expected, actual
  end

end