# Note: Tests do not represent valid command line usage.

require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class DotCover12Test < Test::Unit::TestCase

  def test_analyse_full_command
    expected = 'dotCover analyse configurationFile /analyseTargetArguments=bool /filters=filter1;filter2 /inheritConsole=bool /logFile=logFile /output=output /reportType=reportType /targetArguments=targetArguments /targetExecutable=targetExecutable /targetWorkingDir=targetWorkingDir /tempDir=tempDir'
    actual = dotcover_12.analyse('configurationFile').analyse_target_arguments('bool').filters(['filter1', 'filter2']).inherit_console('bool').log_file('logFile').output('output').report_type('reportType').target_arguments('targetArguments').target_executable('targetExecutable').target_working_dir('targetWorkingDir').temp_dir('tempDir').to_s
    assert_equal expected, actual
  end

  def test_analyse_configuration_file_is_optional
    expected = 'dotCover analyse'
    actual = dotcover_12.analyse.to_s
    assert_equal expected, actual
  end

  def test_cover_full_command
    expected = 'dotCover cover configurationFile /analyseTargetArguments=bool /filters=filter1;filter2 /inheritConsole=bool /logFile=logFile /output=output /targetArguments=targetArguments /targetExecutable=targetExecutable /targetWorkingDir=targetWorkingDir /tempDir=tempDir'
    actual = dotcover_12.cover('configurationFile').analyse_target_arguments('bool').filters(['filter1', 'filter2']).inherit_console('bool').log_file('logFile').output('output').target_arguments('targetArguments').target_executable('targetExecutable').target_working_dir('targetWorkingDir').temp_dir('tempDir').to_s
    assert_equal expected, actual
  end

  def test_cover_configuration_file_is_optional
    expected = 'dotCover cover'
    actual = dotcover_12.cover.to_s
    assert_equal expected, actual
  end

  def test_delete_full_command
    expected = 'dotCover delete configurationFile /logFile=logFile /source=source'
    actual = dotcover_12.delete('configurationFile').log_file('logFile').source('source').to_s
    assert_equal expected, actual
  end

  def test_delete_configuration_file_is_optional
    expected = 'dotCover delete'
    actual = dotcover_12.delete.to_s
    assert_equal expected, actual
  end

  def test_help_full_command
    expected = 'dotCover help command fileName'
    actual = dotcover_12.help('command', 'fileName').to_s
    assert_equal expected, actual
  end

  def test_help_file_name_is_optional
    expected = 'dotCover help command'
    actual = dotcover_12.help('command').to_s
    assert_equal expected, actual
  end

  def test_help_command_is_optional
    expected = 'dotCover help'
    actual = dotcover_12.help.to_s
    assert_equal expected, actual
  end

  def test_list_full_command
    expected = 'dotCover list configurationFile /logFile=logFile /output=output /source=source'
    actual = dotcover_12.list('configurationFile').log_file('logFile').output('output').source('source').to_s
    assert_equal expected, actual
  end

  def test_list_configuration_file_is_optional
    expected = 'dotCover list'
    actual = dotcover_12.list.to_s
    assert_equal expected, actual
  end

  def test_merge_full_command
    expected = 'dotCover merge configurationFile /logFile=logFile /output=output /source=source /tempDir=tempDir'
    actual = dotcover_12.merge('configurationFile').log_file('logFile').output('output').source('source').temp_dir('tempDir').to_s
    assert_equal expected, actual
  end

  def test_merge_configuration_file_is_optional
    expected = 'dotCover merge'
    actual = dotcover_12.merge.to_s
    assert_equal expected, actual
  end

  def test_report_full_command
    expected = 'dotCover report configurationFile /logFile=logFile /output=output /reportType=reportType /source=source'
    actual = dotcover_12.report('configurationFile').log_file('logFile').output('output').report_type('reportType').source('source').to_s
    assert_equal expected, actual
  end

  def test_report_configuration_file_is_optional
    expected = 'dotCover report'
    actual = dotcover_12.report.to_s
    assert_equal expected, actual
  end

  def test_version_full_command
    expected = 'dotCover version outputFileName /logFile=logFile'
    actual = dotcover_12.version('outputFileName').log_file('logFile').to_s
    assert_equal expected, actual
  end

  def test_version_output_file_name_is_optional
    expected = 'dotCover version'
    actual = dotcover_12.version.to_s
    assert_equal expected, actual
  end

  def test_zip_full_command
    expected = 'dotCover zip configurationFile /logFile=logFile /output=output /source=source'
    actual = dotcover_12.zip('configurationFile').log_file('logFile').output('output').source('source').to_s
    assert_equal expected, actual
  end

  def test_zip_configuration_file_is_optional
    expected = 'dotCover zip'
    actual = dotcover_12.zip.to_s
    assert_equal expected, actual
  end

end