# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class MSBuild20And35Test < CommandTestBase

  def test_full_command
    expected = 'MSBuild projectFile /help /noLogo /version @file /noAutoResponse /target:target1;target2 /property:key1=value1;key2=value2 /logger:logger /consoleLoggerParameters:parameters /verbosity:level /noConsoleLogger /validate:schema'
    assert_each_command expected, msbuild_20('projectFile'), msbuild_30('projectFile') do |msbuild|
      msbuild.help.no_logo.version.file('file').no_auto_response.target(['target1', 'target2']).property({'key1' => 'value1', 'key2' => 'value2'}).logger('logger').console_logger_parameters('parameters').verbosity('level').no_console_logger.validate('schema')
    end
  end

  def test_project_file_is_optional
    expected = 'MSBuild'
    assert_each_command expected, msbuild_20, msbuild_30
  end

  def test_validate_schema_is_optional
    expected = 'MSBuild /validate'
    assert_each_command expected, msbuild_20, msbuild_30 do |msbuild|
      msbuild.validate
    end
  end

end