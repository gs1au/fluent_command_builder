# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../default_path_validator')
require File.expand_path(File.dirname(__FILE__) + '/../version_validator')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def dev_appserver_python_17(application_root=nil)
    FluentCommandBuilder::DevAppserverPython::V17.create(application_root) { |b| yield b if block_given? }
  end
  module DevAppserverPython
    module V17
      VERSION = '1.7'
      def self.exact_version
        @exact_version ||= VERSION
      end
      def self.exact_version=(value)
        @exact_version = value
      end
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        validator = DefaultPathValidator.new value, FluentCommandBuilder::DevAppserverPython::COMMAND_NAME, exact_version
        validator.validate
        @default_path = value
      end
      def self.version_validator
        @version_validator ||= VersionValidator.new(FluentCommandBuilder::DevAppserverPython::COMMAND_NAME, FluentCommandBuilder::DevAppserverPython.version_detector, exact_version)
      end
      def self.version_validator=(value)
        @version_validator = value
      end
      def self.create(application_root=nil)
        b = UnderlyingBuilder.new FluentCommandBuilder::DevAppserverPython::COMMAND_NAME
        b.path = self.default_path
        b.version_validator = self.version_validator
        c = DevAppserverPython.new(b, application_root)
        yield b if block_given?
        c
      end
      def dev_appserver_python(application_root=nil)
        FluentCommandBuilder::DevAppserverPython::V17.create(application_root) { |b| yield b if block_given? }
      end
      class DevAppserverPython < CommandBase
        def initialize(underlying_builder, application_root=nil)
          super underlying_builder
          @b.append " #{@b.format application_root}" unless application_root.nil?
        end
        def application_root(application_root)
          @b.append " #{@b.format application_root}"
          yield @b if block_given?
          self
        end
        def address(address)
          @b.append " --address=#{@b.format address}"
          yield @b if block_given?
          self
        end
        def clear_datastore
          @b.append ' --clear_datastore'
          yield @b if block_given?
          self
        end
        def debug
          @b.append ' --debug'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' --help'
          yield @b if block_given?
          self
        end
        def port(port)
          @b.append " --port=#{@b.format port}"
          yield @b if block_given?
          self
        end
        def allow_skipped_files
          @b.append ' --allow_skipped_files'
          yield @b if block_given?
          self
        end
        def auth_domain
          @b.append ' --auth_domain'
          yield @b if block_given?
          self
        end
        def backends
          @b.append ' --backends'
          yield @b if block_given?
          self
        end
        def blobstore_path(dir)
          @b.append " --blobstore_path=#{@b.format dir}"
          yield @b if block_given?
          self
        end
        def clear_prospective_search
          @b.append ' --clear_prospective_search'
          yield @b if block_given?
          self
        end
        def datastore_path(ds_file)
          @b.append " --datastore_path=#{@b.format ds_file}"
          yield @b if block_given?
          self
        end
        def debug_imports
          @b.append ' --debug_imports'
          yield @b if block_given?
          self
        end
        def default_partition
          @b.append ' --default_partition'
          yield @b if block_given?
          self
        end
        def disable_static_caching
          @b.append ' --disable_static_caching'
          yield @b if block_given?
          self
        end
        def disable_task_running
          @b.append ' --disable_task_running'
          yield @b if block_given?
          self
        end
        def enable_sendmail
          @b.append ' --enable_sendmail'
          yield @b if block_given?
          self
        end
        def high_replication
          @b.append ' --high_replication'
          yield @b if block_given?
          self
        end
        def history_path(path)
          @b.append " --history_path=#{@b.format path}"
          yield @b if block_given?
          self
        end
        def multiprocess_min_port
          @b.append ' --multiprocess_min_port'
          yield @b if block_given?
          self
        end
        def mysql_host(hostname)
          @b.append " --mysql_host=#{@b.format hostname}"
          yield @b if block_given?
          self
        end
        def mysql_port(port)
          @b.append " --mysql_port=#{@b.format port}"
          yield @b if block_given?
          self
        end
        def mysql_user(user)
          @b.append " --mysql_user=#{@b.format user}"
          yield @b if block_given?
          self
        end
        def mysql_password(password)
          @b.append " --mysql_password=#{@b.format_password password}"
          yield @b if block_given?
          self
        end
        def mysql_socket(path)
          @b.append " --mysql_socket=#{@b.format path}"
          yield @b if block_given?
          self
        end
        def persist_logs
          @b.append ' --persist_logs'
          yield @b if block_given?
          self
        end
        def require_indexes
          @b.append ' --require_indexes'
          yield @b if block_given?
          self
        end
        def show_mail_body
          @b.append ' --show_mail_body'
          yield @b if block_given?
          self
        end
        def skip_sdk_update_check
          @b.append ' --skip_sdk_update_check'
          yield @b if block_given?
          self
        end
        def smtp_host(hostname)
          @b.append " --smtp_host=#{@b.format hostname}"
          yield @b if block_given?
          self
        end
        def smtp_port(port)
          @b.append " --smtp_port=#{@b.format port}"
          yield @b if block_given?
          self
        end
        def smtp_user(user)
          @b.append " --smtp_user=#{@b.format user}"
          yield @b if block_given?
          self
        end
        def smtp_password(password)
          @b.append " --smtp_password=#{@b.format_password password}"
          yield @b if block_given?
          self
        end
        def task_retry_seconds
          @b.append ' --task_retry_seconds'
          yield @b if block_given?
          self
        end
        def use_sqlite
          @b.append ' --use_sqlite'
          yield @b if block_given?
          self
        end
      end

    end
  end
end