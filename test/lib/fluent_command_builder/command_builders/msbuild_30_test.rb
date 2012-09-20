# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class MSBuild30Test < CommandTestBase
  include FluentCommandBuilder::MSBuild::V30

  def test_full_command
    expected = 'MSBuild projectFile /help /noLogo /version @file /noAutoResponse /target:target1;target2 /property:key1=value1;key2=value2 /logger:logger /consoleLoggerParameters:parameters /verbosity:level /noConsoleLogger /validate:schema /validate'
    actual = msbuild('projectFile').help.no_logo.version.file('file').no_auto_response.target(%w(target1 target2)).property({'key1' => 'value1', 'key2' => 'value2'}).logger('logger').console_logger_parameters('parameters').verbosity('level').no_console_logger.validate('schema').validate
    assert_command expected, actual
  end

  def test_project_file_is_optional
    expected = 'MSBuild'
    actual = msbuild
    assert_command expected, actual
  end

end