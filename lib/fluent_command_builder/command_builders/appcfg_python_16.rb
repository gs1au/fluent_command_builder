require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def appcfg_python_16
    FluentCommandBuilder::AppCfgPython::V16.create { |b| yield b if block_given? }
  end
  module AppCfgPython
    module V16
      VERSION = '1.6'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        @default_path = value
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::AppCfgPython::COMMAND_NAME
        b.path = self.default_path
        c = AppCfgPython.new(b)
        yield b if block_given?
        c
      end
      def appcfg_python
        FluentCommandBuilder::AppCfgPython::V16.create { |b| yield b if block_given? }
      end
      class AppCfgPython < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def backends(directory)
          Backends.new @b, directory
        end
        def create_bulkload_config(directory)
          CreateBulkloadConfig.new @b, directory
        end
        def cron_info(directory)
          CronInfo.new @b, directory
        end
        def download_app
          DownloadApp.new @b
        end
        def download_data(directory)
          DownloadData.new @b, directory
        end
        def help(action)
          Help.new @b, action
        end
        def request_logs(directory, output_file)
          RequestLogs.new @b, directory, output_file
        end
        def resource_limits_info(directory)
          ResourceLimitsInfo.new @b, directory
        end
        def rollback(directory)
          Rollback.new @b, directory
        end
        def set_default_version(directory)
          SetDefaultVersion.new @b, directory
        end
        def update(directory)
          Update.new @b, directory
        end
        def update_cron(directory)
          UpdateCron.new @b, directory
        end
        def update_dos(directory)
          UpdateDos.new @b, directory
        end
        def update_indexes(directory)
          UpdateIndexes.new @b, directory
        end
        def update_queues(directory)
          UpdateQueues.new @b, directory
        end
        def upload_data(directory)
          UploadData.new @b, directory
        end
        def vacuum_indexes(directory)
          VacuumIndexes.new @b, directory
        end
      end
      class Backends < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " backends #{@b.format directory}"
        end
        def configure(backend)
          Configure.new @b, backend
        end
        def delete(backend)
          Delete.new @b, backend
        end
        def list
          List.new @b
        end
        def rollback(backend)
          Rollback.new @b, backend
        end
        def start(backend)
          Start.new @b, backend
        end
        def stop(backend)
          Stop.new @b, backend
        end
        def update(backend)
          Update.new @b, backend
        end
      end
      class Configure < CommandBase
        def initialize(underlying_builder, backend)
          super underlying_builder
          @b.append " configure #{@b.format backend}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(underlying_builder, backend)
          super underlying_builder
          @b.append " delete #{@b.format backend}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class List < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' list'
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class Rollback < CommandBase
        def initialize(underlying_builder, backend)
          super underlying_builder
          @b.append " rollback #{@b.format backend}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class Start < CommandBase
        def initialize(underlying_builder, backend)
          super underlying_builder
          @b.append " start #{@b.format backend}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class Stop < CommandBase
        def initialize(underlying_builder, backend)
          super underlying_builder
          @b.append " stop #{@b.format backend}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize(underlying_builder, backend)
          super underlying_builder
          @b.append " update #{@b.format backend}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
        def max_size(size)
          @b.append " --max_size=#{@b.format size}"
          yield @b if block_given?
          self
        end
        def no_precompilation
          @b.append ' --no_precompilation'
          yield @b if block_given?
          self
        end
        def backends
          @b.append ' --backends'
          yield @b if block_given?
          self
        end
      end
      class CreateBulkloadConfig < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " create_bulkload_config #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
        def url(url)
          @b.append " --url=#{@b.format url}"
          yield @b if block_given?
          self
        end
        def batch_size(batch_size)
          @b.append " --batch_size=#{@b.format batch_size}"
          yield @b if block_given?
          self
        end
        def bandwidth_limit(bandwidth_limit)
          @b.append " --bandwidth_limit=#{@b.format bandwidth_limit}"
          yield @b if block_given?
          self
        end
        def rps_limit(rps_limit)
          @b.append " --rps_limit=#{@b.format rps_limit}"
          yield @b if block_given?
          self
        end
        def http_limit(http_limit)
          @b.append " --http_limit=#{@b.format http_limit}"
          yield @b if block_given?
          self
        end
        def db_filename(db_filename)
          @b.append " --db_filename=#{@b.format db_filename}"
          yield @b if block_given?
          self
        end
        def auth_domain(auth_domain)
          @b.append " --auth_domain=#{@b.format auth_domain}"
          yield @b if block_given?
          self
        end
        def log_file(log_file)
          @b.append " --log_file=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def dry_run
          @b.append ' --dry_run'
          yield @b if block_given?
          self
        end
        def namespace(namespace)
          @b.append " --namespace=#{@b.format namespace}"
          yield @b if block_given?
          self
        end
        def num_threads(num_threads)
          @b.append " --num_threads=#{@b.format num_threads}"
          yield @b if block_given?
          self
        end
        def filename(filename)
          @b.append " --filename=#{@b.format filename}"
          yield @b if block_given?
          self
        end
      end
      class CronInfo < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " cron_info #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
        def num_runs(num_runs)
          @b.append " --num_runs=#{@b.format num_runs}"
          yield @b if block_given?
          self
        end
      end
      class DownloadApp < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' download_app'
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class DownloadData < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " download_data #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
        def url(url)
          @b.append " --url=#{@b.format url}"
          yield @b if block_given?
          self
        end
        def batch_size(batch_size)
          @b.append " --batch_size=#{@b.format batch_size}"
          yield @b if block_given?
          self
        end
        def bandwidth_limit(bandwidth_limit)
          @b.append " --bandwidth_limit=#{@b.format bandwidth_limit}"
          yield @b if block_given?
          self
        end
        def rps_limit(rps_limit)
          @b.append " --rps_limit=#{@b.format rps_limit}"
          yield @b if block_given?
          self
        end
        def http_limit(http_limit)
          @b.append " --http_limit=#{@b.format http_limit}"
          yield @b if block_given?
          self
        end
        def db_filename(db_filename)
          @b.append " --db_filename=#{@b.format db_filename}"
          yield @b if block_given?
          self
        end
        def auth_domain(auth_domain)
          @b.append " --auth_domain=#{@b.format auth_domain}"
          yield @b if block_given?
          self
        end
        def log_file(log_file)
          @b.append " --log_file=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def dry_run
          @b.append ' --dry_run'
          yield @b if block_given?
          self
        end
        def namespace(namespace)
          @b.append " --namespace=#{@b.format namespace}"
          yield @b if block_given?
          self
        end
        def num_threads(num_threads)
          @b.append " --num_threads=#{@b.format num_threads}"
          yield @b if block_given?
          self
        end
        def filename(filename)
          @b.append " --filename=#{@b.format filename}"
          yield @b if block_given?
          self
        end
        def kind(kind)
          @b.append " --kind=#{@b.format kind}"
          yield @b if block_given?
          self
        end
        def exporter_opts(exporter_opts)
          @b.append " --exporter_opts=#{@b.format exporter_opts}"
          yield @b if block_given?
          self
        end
        def result_db_filename(result_db_filename)
          @b.append " --result_db_filename=#{@b.format result_db_filename}"
          yield @b if block_given?
          self
        end
        def config_file(config_file)
          @b.append " --config_file=#{@b.format config_file}"
          yield @b if block_given?
          self
        end
      end
      class Help < CommandBase
        def initialize(underlying_builder, action)
          super underlying_builder
          @b.append " help #{@b.format action}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class RequestLogs < CommandBase
        def initialize(underlying_builder, directory, output_file)
          super underlying_builder
          @b.append " request_logs #{@b.format directory} #{@b.format output_file}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
        def num_days(num_days)
          @b.append " --num_days=#{@b.format num_days}"
          yield @b if block_given?
          self
        end
        def append
          @b.append ' --append'
          yield @b if block_given?
          self
        end
        def severity(severity)
          @b.append " --severity=#{@b.format severity}"
          yield @b if block_given?
          self
        end
        def vhost(vhost)
          @b.append " --vhost=#{@b.format vhost}"
          yield @b if block_given?
          self
        end
        def include_vhost
          @b.append ' --include_vhost'
          yield @b if block_given?
          self
        end
        def include_all
          @b.append ' --include_all'
          yield @b if block_given?
          self
        end
        def end_date(end_date)
          @b.append " --end_date=#{@b.format end_date}"
          yield @b if block_given?
          self
        end
      end
      class ResourceLimitsInfo < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " resource_limits_info #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class Rollback < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " rollback #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class SetDefaultVersion < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " set_default_version #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " update #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
        def max_size(size)
          @b.append " --max_size=#{@b.format size}"
          yield @b if block_given?
          self
        end
        def no_precompilation
          @b.append ' --no_precompilation'
          yield @b if block_given?
          self
        end
        def backends
          @b.append ' --backends'
          yield @b if block_given?
          self
        end
      end
      class UpdateCron < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " update_cron #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class UpdateDos < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " update_dos #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class UpdateIndexes < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " update_indexes #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class UpdateQueues < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " update_queues #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
      end
      class UploadData < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " upload_data #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
        def url(url)
          @b.append " --url=#{@b.format url}"
          yield @b if block_given?
          self
        end
        def batch_size(batch_size)
          @b.append " --batch_size=#{@b.format batch_size}"
          yield @b if block_given?
          self
        end
        def bandwidth_limit(bandwidth_limit)
          @b.append " --bandwidth_limit=#{@b.format bandwidth_limit}"
          yield @b if block_given?
          self
        end
        def rps_limit(rps_limit)
          @b.append " --rps_limit=#{@b.format rps_limit}"
          yield @b if block_given?
          self
        end
        def http_limit(http_limit)
          @b.append " --http_limit=#{@b.format http_limit}"
          yield @b if block_given?
          self
        end
        def db_filename(db_filename)
          @b.append " --db_filename=#{@b.format db_filename}"
          yield @b if block_given?
          self
        end
        def auth_domain(auth_domain)
          @b.append " --auth_domain=#{@b.format auth_domain}"
          yield @b if block_given?
          self
        end
        def log_file(log_file)
          @b.append " --log_file=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def dry_run
          @b.append ' --dry_run'
          yield @b if block_given?
          self
        end
        def namespace(namespace)
          @b.append " --namespace=#{@b.format namespace}"
          yield @b if block_given?
          self
        end
        def num_threads(num_threads)
          @b.append " --num_threads=#{@b.format num_threads}"
          yield @b if block_given?
          self
        end
        def filename(filename)
          @b.append " --filename=#{@b.format filename}"
          yield @b if block_given?
          self
        end
        def kind(kind)
          @b.append " --kind=#{@b.format kind}"
          yield @b if block_given?
          self
        end
        def has_header
          @b.append ' --has_header'
          yield @b if block_given?
          self
        end
        def loader_opts(loader_opts)
          @b.append " --loader_opts=#{@b.format loader_opts}"
          yield @b if block_given?
          self
        end
        def config_file(config_file)
          @b.append " --config_file=#{@b.format config_file}"
          yield @b if block_given?
          self
        end
      end
      class VacuumIndexes < CommandBase
        def initialize(underlying_builder, directory)
          super underlying_builder
          @b.append " vacuum_indexes #{@b.format directory}"
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def quiet
          @b.append ' --quiet'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' --verbose'
          yield @b if block_given?
          self
        end
        def noisy
          @b.append ' --noisy'
          yield @b if block_given?
          self
        end
        def server(server)
          @b.append " --server=#{@b.format server}"
          yield @b if block_given?
          self
        end
        def insecure
          @b.append ' --insecure'
          yield @b if block_given?
          self
        end
        def email(email)
          @b.append " --email=#{@b.format email}"
          yield @b if block_given?
          self
        end
        def host(host)
          @b.append " --host=#{@b.format host}"
          yield @b if block_given?
          self
        end
        def no_cookies
          @b.append ' --no_cookies'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def passin
          @b.append ' --passin'
          yield @b if block_given?
          self
        end
        def application(app_id)
          @b.append " --application=#{@b.format app_id}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " --version=#{@b.format version}"
          yield @b if block_given?
          self
        end
        def runtime(runtime)
          @b.append " --runtime=#{@b.format runtime}"
          yield @b if block_given?
          self
        end
        def allow_any_runtime
          @b.append ' --allow_any_runtime'
          yield @b if block_given?
          self
        end
        def oauth2
          @b.append ' --oauth2'
          yield @b if block_given?
          self
        end
        def oauth2_refresh_token(oauth2_refresh_token)
          @b.append " --oauth2_refresh_token=#{@b.format oauth2_refresh_token}"
          yield @b if block_given?
          self
        end
        def noauth_local_webserver
          @b.append ' --noauth_local_webserver'
          yield @b if block_given?
          self
        end
        def force
          @b.append ' --force'
          yield @b if block_given?
          self
        end
      end

    end
  end
end