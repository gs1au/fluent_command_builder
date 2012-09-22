# Note: Tests do not represent valid command line usage.

require_relative '../../../command_test_base'

class DotCover20Test < CommandTestBase
  include FluentCommandBuilder::DotCover::V20

  def test_analyse_full_command
    expected = 'dotCover analyse configurationFile /analyseTargetArguments=bool /attributeFilters=filter1;filter2 /filters=filter1;filter2 /inheritConsole=bool /logFile=logFile /output=output /reportType=reportType /targetArguments=targetArguments /targetExecutable=targetExecutable /targetWorkingDir=targetWorkingDir /tempDir=tempDir'
    actual = dotcover.analyse('configurationFile').analyse_target_arguments('bool').attribute_filters(%w(filter1 filter2)).filters(%w(filter1 filter2)).inherit_console('bool').log_file('logFile').output('output').report_type('reportType').target_arguments('targetArguments').target_executable('targetExecutable').target_working_dir('targetWorkingDir').temp_dir('tempDir')
    assert_command expected, actual
  end

  def test_analyse_configuration_file_is_optional
    expected = 'dotCover analyse'
    actual = dotcover.analyse
    assert_command expected, actual
  end

  def test_cover_full_command
    expected = 'dotCover cover configurationFile /analyseTargetArguments=bool /attributeFilters=filter1;filter2 /filters=filter1;filter2 /inheritConsole=bool /logFile=logFile /output=output /targetArguments=targetArguments /targetExecutable=targetExecutable /targetWorkingDir=targetWorkingDir /tempDir=tempDir'
    actual = dotcover.cover('configurationFile').analyse_target_arguments('bool').attribute_filters(%w(filter1 filter2)).filters(%w(filter1 filter2)).inherit_console('bool').log_file('logFile').output('output').target_arguments('targetArguments').target_executable('targetExecutable').target_working_dir('targetWorkingDir').temp_dir('tempDir')
    assert_command expected, actual
  end

  def test_cover_configuration_file_is_optional
    expected = 'dotCover cover'
    actual = dotcover.cover
    assert_command expected, actual
  end

  def test_delete_full_command
    expected = 'dotCover delete configurationFile /logFile=logFile /source=source'
    actual = dotcover.delete('configurationFile').log_file('logFile').source('source')
    assert_command expected, actual
  end

  def test_delete_configuration_file_is_optional
    expected = 'dotCover delete'
    actual = dotcover.delete
    assert_command expected, actual
  end

  def test_help_full_command
    expected = 'dotCover help command fileName'
    actual = dotcover.help('command', 'fileName')
    assert_command expected, actual
  end

  def test_help_file_name_is_optional
    expected = 'dotCover help command'
    actual = dotcover.help('command')
    assert_command expected, actual
  end

  def test_help_command_is_optional
    expected = 'dotCover help'
    actual = dotcover.help
    assert_command expected, actual
  end

  def test_list_full_command
    expected = 'dotCover list configurationFile /logFile=logFile /output=output /source=source'
    actual = dotcover.list('configurationFile').log_file('logFile').output('output').source('source')
    assert_command expected, actual
  end

  def test_list_configuration_file_is_optional
    expected = 'dotCover list'
    actual = dotcover.list
    assert_command expected, actual
  end

  def test_merge_full_command
    expected = 'dotCover merge configurationFile /logFile=logFile /output=output /source=source /tempDir=tempDir'
    actual = dotcover.merge('configurationFile').log_file('logFile').output('output').source('source').temp_dir('tempDir')
    assert_command expected, actual
  end

  def test_merge_configuration_file_is_optional
    expected = 'dotCover merge'
    actual = dotcover.merge
    assert_command expected, actual
  end

  def test_report_full_command
    expected = 'dotCover report configurationFile /logFile=logFile /output=output /reportType=reportType /source=source'
    actual = dotcover.report('configurationFile').log_file('logFile').output('output').report_type('reportType').source('source')
    assert_command expected, actual
  end

  def test_report_configuration_file_is_optional
    expected = 'dotCover report'
    actual = dotcover.report
    assert_command expected, actual
  end

  def test_version_full_command
    expected = 'dotCover version outputFileName /logFile=logFile'
    actual = dotcover.version('outputFileName').log_file('logFile')
    assert_command expected, actual
  end

  def test_version_output_file_name_is_optional
    expected = 'dotCover version'
    actual = dotcover.version
    assert_command expected, actual
  end

  def test_zip_full_command
    expected = 'dotCover zip configurationFile /logFile=logFile /output=output /source=source'
    actual = dotcover.zip('configurationFile').log_file('logFile').output('output').source('source')
    assert_command expected, actual
  end

  def test_zip_configuration_file_is_optional
    expected = 'dotCover zip'
    actual = dotcover.zip
    assert_command expected, actual
  end

end