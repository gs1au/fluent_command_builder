require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module AppCfgPython
    module V17
      COMMAND_NAME = 'appcfg.py'
      class AppCfgPython < CommandBase
        def initialize(builder)
          super builder
        end
        def backends(directory)
          Backends.new @builder, directory
        end
        def create_bulkload_config(directory)
          CreateBulkloadConfig.new @builder, directory
        end
        def cron_info(directory)
          CronInfo.new @builder, directory
        end
        def download_app
          DownloadApp.new @builder
        end
        def download_data(directory)
          DownloadData.new @builder, directory
        end
        def help(action)
          Help.new @builder, action
        end
        def request_logs(directory, output_file)
          RequestLogs.new @builder, directory, output_file
        end
        def resource_limits_info(directory)
          ResourceLimitsInfo.new @builder, directory
        end
        def rollback(directory)
          Rollback.new @builder, directory
        end
        def set_default_version(directory)
          SetDefaultVersion.new @builder, directory
        end
        def update(directory)
          Update.new @builder, directory
        end
        def update_cron(directory)
          UpdateCron.new @builder, directory
        end
        def update_dos(directory)
          UpdateDos.new @builder, directory
        end
        def update_indexes(directory)
          UpdateIndexes.new @builder, directory
        end
        def update_queues(directory)
          UpdateQueues.new @builder, directory
        end
        def upload_data(directory)
          UploadData.new @builder, directory
        end
        def vacuum_indexes(directory)
          VacuumIndexes.new @builder, directory
        end
      end
      class Backends < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " backends #{@builder.format directory}"
        end
        def configure(backend)
          Configure.new @builder, backend
        end
        def delete(backend)
          Delete.new @builder, backend
        end
        def list
          List.new @builder
        end
        def rollback(backend)
          Rollback.new @builder, backend
        end
        def start(backend)
          Start.new @builder, backend
        end
        def stop(backend)
          Stop.new @builder, backend
        end
        def update(backend)
          Update.new @builder, backend
        end
      end
      class Configure < CommandBase
        def initialize(builder, backend)
          super builder
          @builder.append " configure #{@builder.format backend}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(builder, backend)
          super builder
          @builder.append " delete #{@builder.format backend}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class List < CommandBase
        def initialize(builder)
          super builder
          @builder.append ' list'
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class Rollback < CommandBase
        def initialize(builder, backend)
          super builder
          @builder.append " rollback #{@builder.format backend}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class Start < CommandBase
        def initialize(builder, backend)
          super builder
          @builder.append " start #{@builder.format backend}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class Stop < CommandBase
        def initialize(builder, backend)
          super builder
          @builder.append " stop #{@builder.format backend}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize(builder, backend)
          super builder
          @builder.append " update #{@builder.format backend}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
        def no_precompilation
          @builder.append ' --no_precompilation'
          yield @builder if block_given?
          self
        end
        def backends
          @builder.append ' --backends'
          yield @builder if block_given?
          self
        end
      end
      class CreateBulkloadConfig < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " create_bulkload_config #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
        def url(url)
          @builder.append " --url=#{@builder.format url}"
          yield @builder if block_given?
          self
        end
        def batch_size(batch_size)
          @builder.append " --batch_size=#{@builder.format batch_size}"
          yield @builder if block_given?
          self
        end
        def bandwidth_limit(bandwidth_limit)
          @builder.append " --bandwidth_limit=#{@builder.format bandwidth_limit}"
          yield @builder if block_given?
          self
        end
        def rps_limit(rps_limit)
          @builder.append " --rps_limit=#{@builder.format rps_limit}"
          yield @builder if block_given?
          self
        end
        def http_limit(http_limit)
          @builder.append " --http_limit=#{@builder.format http_limit}"
          yield @builder if block_given?
          self
        end
        def db_filename(db_filename)
          @builder.append " --db_filename=#{@builder.format db_filename}"
          yield @builder if block_given?
          self
        end
        def auth_domain(auth_domain)
          @builder.append " --auth_domain=#{@builder.format auth_domain}"
          yield @builder if block_given?
          self
        end
        def log_file(log_file)
          @builder.append " --log_file=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def dry_run
          @builder.append ' --dry_run'
          yield @builder if block_given?
          self
        end
        def namespace(namespace)
          @builder.append " --namespace=#{@builder.format namespace}"
          yield @builder if block_given?
          self
        end
        def num_threads(num_threads)
          @builder.append " --num_threads=#{@builder.format num_threads}"
          yield @builder if block_given?
          self
        end
        def filename(filename)
          @builder.append " --filename=#{@builder.format filename}"
          yield @builder if block_given?
          self
        end
      end
      class CronInfo < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " cron_info #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
        def num_runs(num_runs)
          @builder.append " --num_runs=#{@builder.format num_runs}"
          yield @builder if block_given?
          self
        end
      end
      class DownloadApp < CommandBase
        def initialize(builder)
          super builder
          @builder.append ' download_app'
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class DownloadData < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " download_data #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
        def url(url)
          @builder.append " --url=#{@builder.format url}"
          yield @builder if block_given?
          self
        end
        def batch_size(batch_size)
          @builder.append " --batch_size=#{@builder.format batch_size}"
          yield @builder if block_given?
          self
        end
        def bandwidth_limit(bandwidth_limit)
          @builder.append " --bandwidth_limit=#{@builder.format bandwidth_limit}"
          yield @builder if block_given?
          self
        end
        def rps_limit(rps_limit)
          @builder.append " --rps_limit=#{@builder.format rps_limit}"
          yield @builder if block_given?
          self
        end
        def http_limit(http_limit)
          @builder.append " --http_limit=#{@builder.format http_limit}"
          yield @builder if block_given?
          self
        end
        def db_filename(db_filename)
          @builder.append " --db_filename=#{@builder.format db_filename}"
          yield @builder if block_given?
          self
        end
        def auth_domain(auth_domain)
          @builder.append " --auth_domain=#{@builder.format auth_domain}"
          yield @builder if block_given?
          self
        end
        def log_file(log_file)
          @builder.append " --log_file=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def dry_run
          @builder.append ' --dry_run'
          yield @builder if block_given?
          self
        end
        def namespace(namespace)
          @builder.append " --namespace=#{@builder.format namespace}"
          yield @builder if block_given?
          self
        end
        def num_threads(num_threads)
          @builder.append " --num_threads=#{@builder.format num_threads}"
          yield @builder if block_given?
          self
        end
        def filename(filename)
          @builder.append " --filename=#{@builder.format filename}"
          yield @builder if block_given?
          self
        end
        def kind(kind)
          @builder.append " --kind=#{@builder.format kind}"
          yield @builder if block_given?
          self
        end
        def exporter_opts(exporter_opts)
          @builder.append " --exporter_opts=#{@builder.format exporter_opts}"
          yield @builder if block_given?
          self
        end
        def result_db_filename(result_db_filename)
          @builder.append " --result_db_filename=#{@builder.format result_db_filename}"
          yield @builder if block_given?
          self
        end
        def config_file(config_file)
          @builder.append " --config_file=#{@builder.format config_file}"
          yield @builder if block_given?
          self
        end
      end
      class Help < CommandBase
        def initialize(builder, action)
          super builder
          @builder.append " help #{@builder.format action}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class RequestLogs < CommandBase
        def initialize(builder, directory, output_file)
          super builder
          @builder.append " request_logs #{@builder.format directory} #{@builder.format output_file}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
        def num_days(num_days)
          @builder.append " --num_days=#{@builder.format num_days}"
          yield @builder if block_given?
          self
        end
        def append
          @builder.append ' --append'
          yield @builder if block_given?
          self
        end
        def severity(severity)
          @builder.append " --severity=#{@builder.format severity}"
          yield @builder if block_given?
          self
        end
        def vhost(vhost)
          @builder.append " --vhost=#{@builder.format vhost}"
          yield @builder if block_given?
          self
        end
        def include_vhost
          @builder.append ' --include_vhost'
          yield @builder if block_given?
          self
        end
        def include_all
          @builder.append ' --include_all'
          yield @builder if block_given?
          self
        end
        def end_date(end_date)
          @builder.append " --end_date=#{@builder.format end_date}"
          yield @builder if block_given?
          self
        end
      end
      class ResourceLimitsInfo < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " resource_limits_info #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class Rollback < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " rollback #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class SetDefaultVersion < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " set_default_version #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " update #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
        def no_precompilation
          @builder.append ' --no_precompilation'
          yield @builder if block_given?
          self
        end
        def backends
          @builder.append ' --backends'
          yield @builder if block_given?
          self
        end
      end
      class UpdateCron < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " update_cron #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class UpdateDos < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " update_dos #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class UpdateIndexes < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " update_indexes #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class UpdateQueues < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " update_queues #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
      end
      class UploadData < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " upload_data #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
        def url(url)
          @builder.append " --url=#{@builder.format url}"
          yield @builder if block_given?
          self
        end
        def batch_size(batch_size)
          @builder.append " --batch_size=#{@builder.format batch_size}"
          yield @builder if block_given?
          self
        end
        def bandwidth_limit(bandwidth_limit)
          @builder.append " --bandwidth_limit=#{@builder.format bandwidth_limit}"
          yield @builder if block_given?
          self
        end
        def rps_limit(rps_limit)
          @builder.append " --rps_limit=#{@builder.format rps_limit}"
          yield @builder if block_given?
          self
        end
        def http_limit(http_limit)
          @builder.append " --http_limit=#{@builder.format http_limit}"
          yield @builder if block_given?
          self
        end
        def db_filename(db_filename)
          @builder.append " --db_filename=#{@builder.format db_filename}"
          yield @builder if block_given?
          self
        end
        def auth_domain(auth_domain)
          @builder.append " --auth_domain=#{@builder.format auth_domain}"
          yield @builder if block_given?
          self
        end
        def log_file(log_file)
          @builder.append " --log_file=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def dry_run
          @builder.append ' --dry_run'
          yield @builder if block_given?
          self
        end
        def namespace(namespace)
          @builder.append " --namespace=#{@builder.format namespace}"
          yield @builder if block_given?
          self
        end
        def num_threads(num_threads)
          @builder.append " --num_threads=#{@builder.format num_threads}"
          yield @builder if block_given?
          self
        end
        def filename(filename)
          @builder.append " --filename=#{@builder.format filename}"
          yield @builder if block_given?
          self
        end
        def kind(kind)
          @builder.append " --kind=#{@builder.format kind}"
          yield @builder if block_given?
          self
        end
        def has_header
          @builder.append ' --has_header'
          yield @builder if block_given?
          self
        end
        def loader_opts(loader_opts)
          @builder.append " --loader_opts=#{@builder.format loader_opts}"
          yield @builder if block_given?
          self
        end
        def config_file(config_file)
          @builder.append " --config_file=#{@builder.format config_file}"
          yield @builder if block_given?
          self
        end
      end
      class VacuumIndexes < CommandBase
        def initialize(builder, directory)
          super builder
          @builder.append " vacuum_indexes #{@builder.format directory}"
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def quiet
          @builder.append ' --quiet'
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' --verbose'
          yield @builder if block_given?
          self
        end
        def noisy
          @builder.append ' --noisy'
          yield @builder if block_given?
          self
        end
        def server(server)
          @builder.append " --server=#{@builder.format server}"
          yield @builder if block_given?
          self
        end
        def insecure
          @builder.append ' --insecure'
          yield @builder if block_given?
          self
        end
        def email(email)
          @builder.append " --email=#{@builder.format email}"
          yield @builder if block_given?
          self
        end
        def host(host)
          @builder.append " --host=#{@builder.format host}"
          yield @builder if block_given?
          self
        end
        def no_cookies
          @builder.append ' --no_cookies'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def passin
          @builder.append ' --passin'
          yield @builder if block_given?
          self
        end
        def application(app_id)
          @builder.append " --application=#{@builder.format app_id}"
          yield @builder if block_given?
          self
        end
        def version(version)
          @builder.append " --version=#{@builder.format version}"
          yield @builder if block_given?
          self
        end
        def runtime(runtime)
          @builder.append " --runtime=#{@builder.format runtime}"
          yield @builder if block_given?
          self
        end
        def allow_any_runtime
          @builder.append ' --allow_any_runtime'
          yield @builder if block_given?
          self
        end
        def oauth2
          @builder.append ' --oauth2'
          yield @builder if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @builder.append " --oauth2_refresh_token=#{@builder.format oauth2_refresh_token}"
          yield @builder if block_given?
          self
        end
        def noauth_local_webserver
          @builder.append ' --noauth_local_webserver'
          yield @builder if block_given?
          self
        end
        def force
          @builder.append ' --force'
          yield @builder if block_given?
          self
        end
      end
      def appcfg_python
        builder = CommandBuilder.new COMMAND_NAME
        command = AppCfgPython.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def appcfg_python_17
    builder = CommandBuilder.new AppCfgPython::V17::COMMAND_NAME
    command = AppCfgPython::V17::AppCfgPython.new builder
    yield builder if block_given?
    command
  end
end
