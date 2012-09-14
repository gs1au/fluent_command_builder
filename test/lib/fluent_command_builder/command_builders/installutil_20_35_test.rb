# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class InstallUtil20And35Test < CommandTestBase

  def assert_each_installutil_command(expected_command_text)
    assert_each_command expected_command_text, installutil_20, installutil_35 do |installutil|
      yield installutil
    end
  end

  def test_full_command
    expected = 'installUtil /help assemblyPath /help /logFile=fileName /logFile /assemblyName=assemblyName /logToConsole=bool /showCallStack /uninstall assemblyFileName'
    assert_each_installutil_command expected do |installutil|
      installutil.help('assemblyPath').help.log_file('fileName').log_file.assembly_strong_name('assemblyName').log_to_console('bool').show_call_stack.uninstall.assembly_file_name('assemblyFileName')
    end
  end

end