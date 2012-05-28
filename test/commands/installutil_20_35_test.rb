# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class InstallUtil20And35Test < CommandTestBase

  def assert_each_installutil_command(expected_command_text)
    assert_each_command expected_command_text, installutil_20, installutil_35 do |installutil|
      yield installutil
    end
  end

  def test_full_command
    expected = 'installUtil /help assemblyPath /logFile=fileName /assemblyName=assemblyName /logToConsole=bool /showCallStack /uninstall assemblyFileName'
    assert_each_installutil_command expected do |installutil|
      installutil.help('assemblyPath').log_file('fileName').assembly_strong_name('assemblyName').log_to_console('bool').show_call_stack.uninstall.assembly_file_name('assemblyFileName')
    end
  end

  def test_help_assembly_path_is_optional
    expected = 'installUtil /help'
    assert_each_installutil_command expected do |installutil|
      installutil.help
    end
  end

  def test_log_file_file_name_is_optional
    expected = 'installUtil /logFile'
    assert_each_installutil_command expected do |installutil|
      installutil.log_file
    end
  end

end