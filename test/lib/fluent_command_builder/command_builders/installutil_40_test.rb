# Note: Tests do not represent valid command line usage.

require_relative '../../../command_test_base'

class InstallUtil40Test < CommandTestBase
  include FluentCommandBuilder::InstallUtil::V40

  def test_full_command
    expected = 'installUtil /help assemblyPath /help /assemblyName=assemblyName /installStateDir=directoryName /installStateDir /logFile=fileName /logFile /logToConsole=bool /showCallStack /uninstall assemblyFileName'
    actual = installutil.help('assemblyPath').help.assembly_strong_name('assemblyName').install_state_dir('directoryName').install_state_dir.log_file('fileName').log_file.log_to_console('bool').show_call_stack.uninstall.assembly_file_name('assemblyFileName')
    assert_command expected, actual
  end

end