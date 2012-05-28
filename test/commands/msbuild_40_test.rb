require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class MSBuild40Test < Test::Unit::TestCase

  def test_full_command
    expected = 'MSBuild projectFile /help /noLogo /version @file /noAutoResponse /target:target1;target2 /property:key1=value1;key2=value2 /logger:logger /distributedLogger:logger /consoleLoggerParameters:parameters /verbosity:level /noConsoleLogger /validate:schema /maxCpuCount:number /ignoreProjectExtensions:extension1;extension2 /fileLogger1 /distributedFileLogger /fileLoggerParameters1:key1=value1;key2=value2 /toolsVersion:version /nodeReuse:parameters'
    actual = msbuild_40('projectFile').help.no_logo.version.file('file').no_auto_response.target(['target1', 'target2']).property({'key1' => 'value1', 'key2' => 'value2'}).logger('logger').distributed_logger('logger').console_logger_parameters('parameters').verbosity('level').no_console_logger.validate('schema').max_cpu_count('number').ignore_project_extensions(['extension1', 'extension2']).file_logger('1').distributed_file_logger.file_logger_parameters({'key1' => 'value1', 'key2' => 'value2'}, '1').tools_version('version').node_reuse('parameters').to_s
    assert_equal expected, actual
  end

  def test_project_file_is_optional
    expected = 'MSBuild'
    actual = msbuild_40.to_s
    assert_equal expected, actual
  end

  def test_validate_schema_is_optional
    expected = 'MSBuild /validate'
    actual = msbuild_40.validate.to_s
    assert_equal expected, actual
  end

  def test_file_logger_n_is_optional
    expected = 'MSBuild /fileLogger'
    actual = msbuild_40.file_logger.to_s
    assert_equal expected, actual
  end

  def test_file_logger_parameters_n_is_optional
    expected = 'MSBuild /fileLoggerParameters:key1=value1;key2=value2'
    actual = msbuild_40.file_logger_parameters('key1' => 'value1', 'key2' => 'value2').to_s
    assert_equal expected, actual
  end

end