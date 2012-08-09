require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module DevAppserverPython
    COMMAND_NAME = 'dev_appserver.py' unless const_defined? :COMMAND_NAME
    module V16
      class DevAppserverPython < CommandBase
        def initialize(builder, application_root=nil)
          super builder
          @builder.append " #{@builder.format application_root}" unless application_root.nil?
        end
        def application_root(application_root)
          @builder.append " #{@builder.format application_root}"
          yield @builder if block_given?
          self
        end
        def address(address)
          @builder.append " --address=#{@builder.format address}"
          yield @builder if block_given?
          self
        end
        def clear_datastore
          @builder.append ' --clear_datastore'
          yield @builder if block_given?
          self
        end
        def debug
          @builder.append ' --debug'
          yield @builder if block_given?
          self
        end
        def help
          @builder.append ' --help'
          yield @builder if block_given?
          self
        end
        def port(port)
          @builder.append " --port=#{@builder.format port}"
          yield @builder if block_given?
          self
        end
        def allow_skipped_files
          @builder.append ' --allow_skipped_files'
          yield @builder if block_given?
          self
        end
        def auth_domain
          @builder.append ' --auth_domain'
          yield @builder if block_given?
          self
        end
        def backends
          @builder.append ' --backends'
          yield @builder if block_given?
          self
        end
        def blobstore_path(dir)
          @builder.append " --blobstore_path=#{@builder.format dir}"
          yield @builder if block_given?
          self
        end
        def clear_prospective_search
          @builder.append ' --clear_prospective_search'
          yield @builder if block_given?
          self
        end
        def datastore_path(ds_file)
          @builder.append " --datastore_path=#{@builder.format ds_file}"
          yield @builder if block_given?
          self
        end
        def debug_imports
          @builder.append ' --debug_imports'
          yield @builder if block_given?
          self
        end
        def default_partition
          @builder.append ' --default_partition'
          yield @builder if block_given?
          self
        end
        def disable_static_caching
          @builder.append ' --disable_static_caching'
          yield @builder if block_given?
          self
        end
        def disable_task_running
          @builder.append ' --disable_task_running'
          yield @builder if block_given?
          self
        end
        def enable_sendmail
          @builder.append ' --enable_sendmail'
          yield @builder if block_given?
          self
        end
        def high_replication
          @builder.append ' --high_replication'
          yield @builder if block_given?
          self
        end
        def history_path(path)
          @builder.append " --history_path=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def multiprocess_min_port
          @builder.append ' --multiprocess_min_port'
          yield @builder if block_given?
          self
        end
        def mysql_host(hostname)
          @builder.append " --mysql_host=#{@builder.format hostname}"
          yield @builder if block_given?
          self
        end
        def mysql_port(port)
          @builder.append " --mysql_port=#{@builder.format port}"
          yield @builder if block_given?
          self
        end
        def mysql_user(user)
          @builder.append " --mysql_user=#{@builder.format user}"
          yield @builder if block_given?
          self
        end
        def mysql_password(password)
          @builder.append " --mysql_password=#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def mysql_socket(path)
          @builder.append " --mysql_socket=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def persist_logs
          @builder.append ' --persist_logs'
          yield @builder if block_given?
          self
        end
        def require_indexes
          @builder.append ' --require_indexes'
          yield @builder if block_given?
          self
        end
        def show_mail_body
          @builder.append ' --show_mail_body'
          yield @builder if block_given?
          self
        end
        def skip_sdk_update_check
          @builder.append ' --skip_sdk_update_check'
          yield @builder if block_given?
          self
        end
        def smtp_host(hostname)
          @builder.append " --smtp_host=#{@builder.format hostname}"
          yield @builder if block_given?
          self
        end
        def smtp_port(port)
          @builder.append " --smtp_port=#{@builder.format port}"
          yield @builder if block_given?
          self
        end
        def smtp_user(user)
          @builder.append " --smtp_user=#{@builder.format user}"
          yield @builder if block_given?
          self
        end
        def smtp_password(password)
          @builder.append " --smtp_password=#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def task_retry_seconds
          @builder.append ' --task_retry_seconds'
          yield @builder if block_given?
          self
        end
        def use_sqlite
          @builder.append ' --use_sqlite'
          yield @builder if block_given?
          self
        end
      end
      def dev_appserver_python(application_root=nil)
        builder = CommandBuilder.new FluentCommandBuilder::DevAppserverPython::COMMAND_NAME
        command = DevAppserverPython.new builder, application_root
        yield builder if block_given?
        command
      end
      def self.create(application_root=nil)
        builder = CommandBuilder.new FluentCommandBuilder::DevAppserverPython::COMMAND_NAME
        command = DevAppserverPython.new builder, application_root
        yield builder if block_given?
        command
      end
    end
  end
  def dev_appserver_python_16(application_root=nil)
    builder = CommandBuilder.new FluentCommandBuilder::DevAppserverPython::COMMAND_NAME
    command = DevAppserverPython::V16::DevAppserverPython.new builder, application_root
    yield builder if block_given?
    command
  end
end
