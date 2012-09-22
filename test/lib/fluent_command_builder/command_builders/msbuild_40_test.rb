# Note: Tests do not represent valid command line usage.

require_relative '../../../command_test_base'

class MSBuild40Test < CommandTestBase
  include FluentCommandBuilder::MSBuild::V40

  def test_full_command
    expected = 'MSBuild projectFile /help /noLogo /version @file /noAutoResponse /target:target1;target2 /property:key1=value1;key2=value2 /logger:logger /distributedLogger:logger /consoleLoggerParameters:parameters /verbosity:level /noConsoleLogger /validate:schema /validate /maxCpuCount:number /ignoreProjectExtensions:extension1;extension2 /fileLogger1 /fileLogger /distributedFileLogger /fileLoggerParameters1:key1=value1;key2=value2 /fileLoggerParameters:key1=value1;key2=value2 /toolsVersion:version /nodeReuse:parameters'
    actual = msbuild('projectFile').help.no_logo.version.file('file').no_auto_response.target(%w(target1 target2)).property({'key1' => 'value1', 'key2' => 'value2'}).logger('logger').distributed_logger('logger').console_logger_parameters('parameters').verbosity('level').no_console_logger.validate('schema').validate.max_cpu_count('number').ignore_project_extensions(['extension1', 'extension2']).file_logger('1').file_logger.distributed_file_logger.file_logger_parameters({'key1' => 'value1', 'key2' => 'value2'}, '1').file_logger_parameters({'key1' => 'value1', 'key2' => 'value2'}).tools_version('version').node_reuse('parameters')
    assert_command expected, actual
  end

  def test_project_file_is_optional
    expected = 'MSBuild'
    actual = msbuild
    assert_command expected, actual
  end

end