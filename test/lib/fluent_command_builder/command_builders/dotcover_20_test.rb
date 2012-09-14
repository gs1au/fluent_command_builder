# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class DotCover20Test < CommandTestBase

  def assert_each_dotcover_command(expected_command_text)
    assert_each_command expected_command_text, dotcover_20 do |dotcover|
      yield dotcover
    end
  end

  def test_analyse_full_command
    expected = 'dotCover analyse configurationFile /analyseTargetArguments=bool /attributeFilters=filter1;filter2 /filters=filter1;filter2 /inheritConsole=bool /logFile=logFile /output=output /reportType=reportType /targetArguments=targetArguments /targetExecutable=targetExecutable /targetWorkingDir=targetWorkingDir /tempDir=tempDir'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.analyse('configurationFile').analyse_target_arguments('bool').attribute_filters(%w(filter1 filter2)).filters(%w(filter1 filter2)).inherit_console('bool').log_file('logFile').output('output').report_type('reportType').target_arguments('targetArguments').target_executable('targetExecutable').target_working_dir('targetWorkingDir').temp_dir('tempDir')
    end
  end

  def test_analyse_configuration_file_is_optional
    expected = 'dotCover analyse'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.analyse
    end
  end

  def test_cover_full_command
    expected = 'dotCover cover configurationFile /analyseTargetArguments=bool /attributeFilters=filter1;filter2 /filters=filter1;filter2 /inheritConsole=bool /logFile=logFile /output=output /targetArguments=targetArguments /targetExecutable=targetExecutable /targetWorkingDir=targetWorkingDir /tempDir=tempDir'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.cover('configurationFile').analyse_target_arguments('bool').attribute_filters(%w(filter1 filter2)).filters(%w(filter1 filter2)).inherit_console('bool').log_file('logFile').output('output').target_arguments('targetArguments').target_executable('targetExecutable').target_working_dir('targetWorkingDir').temp_dir('tempDir')
    end
  end

  def test_cover_configuration_file_is_optional
    expected = 'dotCover cover'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.cover
    end
  end

  def test_delete_full_command
    expected = 'dotCover delete configurationFile /logFile=logFile /source=source'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.delete('configurationFile').log_file('logFile').source('source')
    end
  end

  def test_delete_configuration_file_is_optional
    expected = 'dotCover delete'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.delete
    end
  end

  def test_help_full_command
    expected = 'dotCover help command fileName'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.help('command', 'fileName')
    end
  end

  def test_help_file_name_is_optional
    expected = 'dotCover help command'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.help('command')
    end
  end

  def test_help_command_is_optional
    expected = 'dotCover help'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.help
    end
  end

  def test_list_full_command
    expected = 'dotCover list configurationFile /logFile=logFile /output=output /source=source'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.list('configurationFile').log_file('logFile').output('output').source('source')
    end
  end

  def test_list_configuration_file_is_optional
    expected = 'dotCover list'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.list
    end
  end

  def test_merge_full_command
    expected = 'dotCover merge configurationFile /logFile=logFile /output=output /source=source /tempDir=tempDir'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.merge('configurationFile').log_file('logFile').output('output').source('source').temp_dir('tempDir')
    end
  end

  def test_merge_configuration_file_is_optional
    expected = 'dotCover merge'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.merge
    end
  end

  def test_report_full_command
    expected = 'dotCover report configurationFile /logFile=logFile /output=output /reportType=reportType /source=source'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.report('configurationFile').log_file('logFile').output('output').report_type('reportType').source('source')
    end
  end

  def test_report_configuration_file_is_optional
    expected = 'dotCover report'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.report
    end
  end

  def test_version_full_command
    expected = 'dotCover version outputFileName /logFile=logFile'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.version('outputFileName').log_file('logFile')
    end
  end

  def test_version_output_file_name_is_optional
    expected = 'dotCover version'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.version
    end
  end

  def test_zip_full_command
    expected = 'dotCover zip configurationFile /logFile=logFile /output=output /source=source'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.zip('configurationFile').log_file('logFile').output('output').source('source')
    end
  end

  def test_zip_configuration_file_is_optional
    expected = 'dotCover zip'
    assert_each_dotcover_command expected do |dotcover|
      dotcover.zip
    end
  end

end