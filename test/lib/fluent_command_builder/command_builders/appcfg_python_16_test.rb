# Note: Tests do not represent valid command line usage.

require_relative '../../../command_test_base'

class AppCfgPython16Test < CommandTestBase
  include FluentCommandBuilder::AppCfgPython::V16
  
  # todo: reincorporate this
  #def test_common_options
  #  expected = 'appcfg.py --help --quiet --verbose --noisy --server=server --insecure --email=email --host=host --no_cookies --skip_sdk_update_check --passin --application=appId --version=version --runtime=runtime --allow_any_runtime --oauth2 --oauth2_refresh_token=oauth2RefreshToken --noauth_local_webserver'
  #  actual = appcfg_python.help.quiet.verbose.noisy.server('server').insecure.email('email').host('host').no_cookies.skip_sdk_update_check.passin.application('appId').version('version').runtime('runtime').allow_any_runtime.oauth2.oauth2_refresh_token('oauth2RefreshToken').noauth_local_webserver
  #  assert_command expected, actual
  #end

  def test_backends_configure
    expected = 'appcfg.py backends directory configure backend'
    actual = appcfg_python.backends('directory').configure('backend')
    assert_command expected, actual
  end

  def test_backends_delete
    expected = 'appcfg.py backends directory delete backend'
    actual = appcfg_python.backends('directory').delete('backend')
    assert_command expected, actual
  end

  def test_backends_list
    expected = 'appcfg.py backends directory list'
    actual = appcfg_python.backends('directory').list
    assert_command expected, actual
  end

  def test_backends_rollback
    expected = 'appcfg.py backends directory rollback backend'
    actual = appcfg_python.backends('directory').rollback('backend')
    assert_command expected, actual
  end

  def test_backends_start
    expected = 'appcfg.py backends directory start backend'
    actual = appcfg_python.backends('directory').start('backend')
    assert_command expected, actual
  end

  def test_backends_stop
    expected = 'appcfg.py backends directory stop backend'
    actual = appcfg_python.backends('directory').stop('backend')
    assert_command expected, actual
  end

  def test_backends_update
    expected = 'appcfg.py backends directory update backend --max_size=size'
    actual = appcfg_python.backends('directory').update('backend').max_size('size')
    assert_command expected, actual
  end

  def test_create_bulkloader_config
    expected = 'appcfg.py create_bulkload_config directory --url=url --batch_size=batchSize --bandwidth_limit=bandwidthLimit --rps_limit=rpsLimit --http_limit=httpLimit --db_filename=dbFilename --auth_domain=authDomain --log_file=logFile --dry_run --namespace=namespace --num_threads=numThreads --filename=filename'
    actual = appcfg_python.create_bulkload_config('directory').url('url').batch_size('batchSize').bandwidth_limit('bandwidthLimit').rps_limit('rpsLimit').http_limit('httpLimit').db_filename('dbFilename').auth_domain('authDomain').log_file('logFile').dry_run.namespace('namespace').num_threads('numThreads').filename('filename')
    assert_command expected, actual
  end

  def test_cron_info
    expected = 'appcfg.py cron_info directory --num_runs=numRuns'
    actual = appcfg_python.cron_info('directory').num_runs('numRuns')
    assert_command expected, actual
  end

  def test_download_app
    expected = 'appcfg.py download_app'
    actual = appcfg_python.download_app
    assert_command expected, actual
  end

  def test_download_data
    expected = 'appcfg.py download_data directory --url=url --batch_size=batchSize --bandwidth_limit=bandwidthLimit --rps_limit=rpsLimit --http_limit=httpLimit --db_filename=dbFilename --auth_domain=authDomain --log_file=logFile --dry_run --namespace=namespace --num_threads=numThreads --filename=filename --kind=kind --exporter_opts=exporterOpts --result_db_filename=resultDbFilename --config_file=configFile'
    actual = appcfg_python.download_data('directory').url('url').batch_size('batchSize').bandwidth_limit('bandwidthLimit').rps_limit('rpsLimit').http_limit('httpLimit').db_filename('dbFilename').auth_domain('authDomain').log_file('logFile').dry_run.namespace('namespace').num_threads('numThreads').filename('filename').kind('kind').exporter_opts('exporterOpts').result_db_filename('resultDbFilename').config_file('configFile')
    assert_command expected, actual
  end

  def test_help
    expected = 'appcfg.py help action'
    actual = appcfg_python.help('action')
    assert_command expected, actual
  end

  def test_request_logs
    expected = 'appcfg.py request_logs directory outputFile --num_days=numDays --append --severity=severity --vhost=vhost --include_vhost --include_all --end_date=endDate'
    actual = appcfg_python.request_logs('directory', 'outputFile').num_days('numDays').append.severity('severity').vhost('vhost').include_vhost.include_all.end_date('endDate')
    assert_command expected, actual
  end

  def test_resource_limits_info
    expected = 'appcfg.py resource_limits_info directory'
    actual = appcfg_python.resource_limits_info('directory')
    assert_command expected, actual
  end

  def test_rollback
    expected = 'appcfg.py rollback directory'
    actual = appcfg_python.rollback('directory')
    assert_command expected, actual
  end

  def test_set_default_version
    expected = 'appcfg.py set_default_version directory'
    actual = appcfg_python.set_default_version('directory')
    assert_command expected, actual
  end

  def test_update
    expected = 'appcfg.py update directory --max_size=maxSize --no_precompilation --backends'
    actual = appcfg_python.update('directory').max_size('maxSize').no_precompilation.backends
    assert_command expected, actual
  end

  def test_update_cron
    expected = 'appcfg.py update_cron directory'
    actual = appcfg_python.update_cron('directory')
    assert_command expected, actual
  end

  def test_update_dos
    expected = 'appcfg.py update_dos directory'
    actual = appcfg_python.update_dos('directory')
    assert_command expected, actual
  end

  def test_update_indexes
    expected = 'appcfg.py update_indexes directory'
    actual = appcfg_python.update_indexes('directory')
    assert_command expected, actual
  end

  def test_update_queues
    expected = 'appcfg.py update_queues directory'
    actual = appcfg_python.update_queues('directory')
    assert_command expected, actual
  end

  def test_upload_data
    expected = 'appcfg.py upload_data directory --url=url --batch_size=batchSize --bandwidth_limit=bandwidthLimit --rps_limit=rpsLimit --http_limit=httpLimit --db_filename=dbFilename --auth_domain=authDomain --log_file=logFile --dry_run --namespace=namespace --num_threads=numThreads --filename=filename --kind=kind --has_header --loader_opts=loaderOpts --config_file=configFile'
    actual = appcfg_python.upload_data('directory').url('url').batch_size('batchSize').bandwidth_limit('bandwidthLimit').rps_limit('rpsLimit').http_limit('httpLimit').db_filename('dbFilename').auth_domain('authDomain').log_file('logFile').dry_run.namespace('namespace').num_threads('numThreads').filename('filename').kind('kind').has_header.loader_opts('loaderOpts').config_file('configFile')
    assert_command expected, actual
  end

  def test_vacuum_indexes
    expected = 'appcfg.py vacuum_indexes directory'
    actual = appcfg_python.vacuum_indexes('directory')
    assert_command expected, actual
  end
  
end