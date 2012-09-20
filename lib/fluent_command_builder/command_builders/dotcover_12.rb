# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder_config')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  module DotCover
    module V12
      VERSION = '1.2'
      @@config = CommandBuilderConfig.new FluentCommandBuilder::DotCover::COMMAND_NAME, VERSION
      @@config.version_detector = FluentCommandBuilder::DotCover.version_detector
      def configure_dotcover
        yield @@config
        @@config.validate_path :warn
      end
      def dotcover
        b = UnderlyingBuilder.new @@config
        c = DotCover.new(b)
        yield b if block_given?
        c
      end
      class DotCover < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def analyse(configuration_file=nil)
          Analyse.new @b, configuration_file
        end
        def cover(configuration_file=nil)
          Cover.new @b, configuration_file
        end
        def delete(configuration_file=nil)
          Delete.new @b, configuration_file
        end
        def help(command=nil, file_name=nil)
          @b.append ' help'
          @b.append " #{@b.format command}" unless command.nil?
          @b.append " #{@b.format file_name}" unless file_name.nil?
          yield @b if block_given?
          self
        end
        def list(configuration_file=nil)
          List.new @b, configuration_file
        end
        def merge(configuration_file=nil)
          Merge.new @b, configuration_file
        end
        def report(configuration_file=nil)
          Report.new @b, configuration_file
        end
        def version(output_file_name=nil)
          Version.new @b, output_file_name
        end
        def zip(configuration_file=nil)
          Zip.new @b, configuration_file
        end
      end
      class Analyse < CommandBase
        def initialize(underlying_builder, configuration_file=nil)
          super underlying_builder
          @b.append ' analyse'
          @b.append " #{@b.format configuration_file}" unless configuration_file.nil?
        end
        def analyse_target_arguments(bool)
          @b.append " /analyseTargetArguments=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def filters(filters)
          @b.append " /filters=#{@b.format filters, ';'}"
          yield @b if block_given?
          self
        end
        def inherit_console(bool)
          @b.append " /inheritConsole=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def log_file(log_file)
          @b.append " /logFile=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def output(snapshot_path)
          @b.append " /output=#{@b.format snapshot_path}"
          yield @b if block_given?
          self
        end
        def report_type(report_type)
          @b.append " /reportType=#{@b.format report_type}"
          yield @b if block_given?
          self
        end
        def target_arguments(target_arguments)
          @b.append " /targetArguments=#{@b.format target_arguments}"
          yield @b if block_given?
          self
        end
        def target_executable(target_executable)
          @b.append " /targetExecutable=#{@b.format target_executable}"
          yield @b if block_given?
          self
        end
        def target_working_dir(target_working_dir)
          @b.append " /targetWorkingDir=#{@b.format target_working_dir}"
          yield @b if block_given?
          self
        end
        def temp_dir(temp_dir)
          @b.append " /tempDir=#{@b.format temp_dir}"
          yield @b if block_given?
          self
        end
      end
      class Cover < CommandBase
        def initialize(underlying_builder, configuration_file=nil)
          super underlying_builder
          @b.append ' cover'
          @b.append " #{@b.format configuration_file}" unless configuration_file.nil?
        end
        def analyse_target_arguments(bool)
          @b.append " /analyseTargetArguments=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def filters(filters)
          @b.append " /filters=#{@b.format filters, ';'}"
          yield @b if block_given?
          self
        end
        def inherit_console(bool)
          @b.append " /inheritConsole=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def log_file(log_file)
          @b.append " /logFile=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def output(snapshot_path)
          @b.append " /output=#{@b.format snapshot_path}"
          yield @b if block_given?
          self
        end
        def target_arguments(target_arguments)
          @b.append " /targetArguments=#{@b.format target_arguments}"
          yield @b if block_given?
          self
        end
        def target_executable(target_executable)
          @b.append " /targetExecutable=#{@b.format target_executable}"
          yield @b if block_given?
          self
        end
        def target_working_dir(target_working_dir)
          @b.append " /targetWorkingDir=#{@b.format target_working_dir}"
          yield @b if block_given?
          self
        end
        def temp_dir(temp_dir)
          @b.append " /tempDir=#{@b.format temp_dir}"
          yield @b if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(underlying_builder, configuration_file=nil)
          super underlying_builder
          @b.append ' delete'
          @b.append " #{@b.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @b.append " /logFile=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def source(source)
          @b.append " /source=#{@b.format source}"
          yield @b if block_given?
          self
        end
      end
      class List < CommandBase
        def initialize(underlying_builder, configuration_file=nil)
          super underlying_builder
          @b.append ' list'
          @b.append " #{@b.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @b.append " /logFile=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def output(snapshot_path)
          @b.append " /output=#{@b.format snapshot_path}"
          yield @b if block_given?
          self
        end
        def source(source)
          @b.append " /source=#{@b.format source}"
          yield @b if block_given?
          self
        end
      end
      class Merge < CommandBase
        def initialize(underlying_builder, configuration_file=nil)
          super underlying_builder
          @b.append ' merge'
          @b.append " #{@b.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @b.append " /logFile=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def output(snapshot_path)
          @b.append " /output=#{@b.format snapshot_path}"
          yield @b if block_given?
          self
        end
        def source(source)
          @b.append " /source=#{@b.format source}"
          yield @b if block_given?
          self
        end
        def temp_dir(temp_dir)
          @b.append " /tempDir=#{@b.format temp_dir}"
          yield @b if block_given?
          self
        end
      end
      class Report < CommandBase
        def initialize(underlying_builder, configuration_file=nil)
          super underlying_builder
          @b.append ' report'
          @b.append " #{@b.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @b.append " /logFile=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def output(snapshot_path)
          @b.append " /output=#{@b.format snapshot_path}"
          yield @b if block_given?
          self
        end
        def report_type(report_type)
          @b.append " /reportType=#{@b.format report_type}"
          yield @b if block_given?
          self
        end
        def source(source)
          @b.append " /source=#{@b.format source}"
          yield @b if block_given?
          self
        end
      end
      class Version < CommandBase
        def initialize(underlying_builder, output_file_name=nil)
          super underlying_builder
          @b.append ' version'
          @b.append " #{@b.format output_file_name}" unless output_file_name.nil?
        end
        def log_file(log_file)
          @b.append " /logFile=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
      end
      class Zip < CommandBase
        def initialize(underlying_builder, configuration_file=nil)
          super underlying_builder
          @b.append ' zip'
          @b.append " #{@b.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @b.append " /logFile=#{@b.format log_file}"
          yield @b if block_given?
          self
        end
        def output(snapshot_path)
          @b.append " /output=#{@b.format snapshot_path}"
          yield @b if block_given?
          self
        end
        def source(source)
          @b.append " /source=#{@b.format source}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end