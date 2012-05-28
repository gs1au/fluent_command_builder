# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class InstallUtil40Test < CommandTestBase

  def test_full_command
    expected = 'installUtil /help assemblyPath /assemblyName=assemblyName /installStateDir=directoryName /logFile=fileName /logToConsole=bool /showCallStack /uninstall assemblyFileName'
    actual = installutil_40.help('assemblyPath').assembly_strong_name('assemblyName').install_state_dir('directoryName').log_file('fileName').log_to_console('bool').show_call_stack.uninstall.assembly_file_name('assemblyFileName')
    assert_command expected, actual
  end

  def test_help_assembly_path_is_optional
    expected = 'installUtil /help'
    actual = installutil_40.help
    assert_command expected, actual
  end

  def test_install_state_dir_directory_name_is_optional
    expected = 'installUtil /installStateDir'
    actual = installutil_40.install_state_dir
    assert_command expected, actual
  end

  def test_log_file_file_name_is_optional
    expected = 'installUtil /logFile'
    actual = installutil_40.log_file
    assert_command expected, actual
  end

end