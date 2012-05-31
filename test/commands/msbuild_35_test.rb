# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class MSBuild35Test < CommandTestBase

  def test_full_command
    expected = 'MSBuild projectFile /help /noLogo /version @file /noAutoResponse /target:target1;target2 /property:key1=value1;key2=value2 /logger:logger /distributedLogger:logger /consoleLoggerParameters:parameters /verbosity:level /noConsoleLogger /validate:schema /validate /maxCpuCount:number /ignoreProjectExtensions:extension1;extension2 /fileLogger /distributedFileLogger /fileLoggerParameters:key1=value1;key2=value2 /toolsVersion:version /nodeReuse:parameters'
    actual = msbuild_35('projectFile').help.no_logo.version.file('file').no_auto_response.target(['target1', 'target2']).property({'key1' => 'value1', 'key2' => 'value2'}).logger('logger').distributed_logger('logger').console_logger_parameters('parameters').verbosity('level').no_console_logger.validate('schema').validate.max_cpu_count('number').ignore_project_extensions(['extension1', 'extension2']).file_logger.distributed_file_logger.file_logger_parameters({'key1' => 'value1', 'key2' => 'value2'}).tools_version('version').node_reuse('parameters')
    assert_command expected, actual
  end

  def test_project_file_is_optional
    expected = 'MSBuild'
    actual = msbuild_35
    assert_command expected, actual
  end

end