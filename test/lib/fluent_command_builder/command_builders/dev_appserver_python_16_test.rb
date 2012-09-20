# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class DevAppserverPython16Test < CommandTestBase
  include FluentCommandBuilder::DevAppserverPython::V16

  def test_full_command
    expected = 'dev_appserver.py applicationRoot --address=address --clear_datastore --debug --help --port=port --allow_skipped_files --auth_domain --backends --blobstore_path=dir --clear_prospective_search --datastore_path=dsFile --debug_imports --default_partition --disable_static_caching --disable_task_running --enable_sendmail --high_replication --history_path=path --multiprocess_min_port --mysql_host=hostname --mysql_port=port --mysql_user=user --mysql_password=password --mysql_socket=path --persist_logs --require_indexes --show_mail_body --skip_sdk_update_check --smtp_host=hostname --smtp_port=port --smtp_user=user --smtp_password=password --task_retry_seconds --use_sqlite'
    actual = dev_appserver_python('applicationRoot').address('address').clear_datastore.debug.help.port('port').allow_skipped_files.auth_domain.backends.blobstore_path('dir').clear_prospective_search.datastore_path('dsFile').debug_imports.default_partition.disable_static_caching.disable_task_running.enable_sendmail.high_replication.history_path('path').multiprocess_min_port.mysql_host('hostname').mysql_port('port').mysql_user('user').mysql_password('password').mysql_socket('path').persist_logs.require_indexes.show_mail_body.skip_sdk_update_check.smtp_host('hostname').smtp_port('port').smtp_user('user').smtp_password('password').task_retry_seconds.use_sqlite
    assert_command expected, actual
  end

end