require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module DotCover
    COMMAND_NAME = 'dotCover' unless const_defined? :COMMAND_NAME
    module V12
      class DotCover < CommandBase
        def initialize(builder)
          super builder
        end
        def analyse(configuration_file=nil)
          Analyse.new @builder, configuration_file
        end
        def cover(configuration_file=nil)
          Cover.new @builder, configuration_file
        end
        def delete(configuration_file=nil)
          Delete.new @builder, configuration_file
        end
        def help(command=nil, file_name=nil)
          @builder.append ' help'
          @builder.append " #{@builder.format command}" unless command.nil?
          @builder.append " #{@builder.format file_name}" unless file_name.nil?
          yield @builder if block_given?
          self
        end
        def list(configuration_file=nil)
          List.new @builder, configuration_file
        end
        def merge(configuration_file=nil)
          Merge.new @builder, configuration_file
        end
        def report(configuration_file=nil)
          Report.new @builder, configuration_file
        end
        def version(output_file_name=nil)
          Version.new @builder, output_file_name
        end
        def zip(configuration_file=nil)
          Zip.new @builder, configuration_file
        end
      end
      class Analyse < CommandBase
        def initialize(builder, configuration_file=nil)
          super builder
          @builder.append ' analyse'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def analyse_target_arguments(bool)
          @builder.append " /analyseTargetArguments=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def filters(filters)
          @builder.append " /filters=#{@builder.format filters, ';'}"
          yield @builder if block_given?
          self
        end
        def inherit_console(bool)
          @builder.append " /inheritConsole=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def log_file(log_file)
          @builder.append " /logFile=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def output(snapshot_path)
          @builder.append " /output=#{@builder.format snapshot_path}"
          yield @builder if block_given?
          self
        end
        def report_type(report_type)
          @builder.append " /reportType=#{@builder.format report_type}"
          yield @builder if block_given?
          self
        end
        def target_arguments(target_arguments)
          @builder.append " /targetArguments=#{@builder.format target_arguments}"
          yield @builder if block_given?
          self
        end
        def target_executable(target_executable)
          @builder.append " /targetExecutable=#{@builder.format target_executable}"
          yield @builder if block_given?
          self
        end
        def target_working_dir(target_working_dir)
          @builder.append " /targetWorkingDir=#{@builder.format target_working_dir}"
          yield @builder if block_given?
          self
        end
        def temp_dir(temp_dir)
          @builder.append " /tempDir=#{@builder.format temp_dir}"
          yield @builder if block_given?
          self
        end
      end
      class Cover < CommandBase
        def initialize(builder, configuration_file=nil)
          super builder
          @builder.append ' cover'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def analyse_target_arguments(bool)
          @builder.append " /analyseTargetArguments=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def filters(filters)
          @builder.append " /filters=#{@builder.format filters, ';'}"
          yield @builder if block_given?
          self
        end
        def inherit_console(bool)
          @builder.append " /inheritConsole=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def log_file(log_file)
          @builder.append " /logFile=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def output(snapshot_path)
          @builder.append " /output=#{@builder.format snapshot_path}"
          yield @builder if block_given?
          self
        end
        def target_arguments(target_arguments)
          @builder.append " /targetArguments=#{@builder.format target_arguments}"
          yield @builder if block_given?
          self
        end
        def target_executable(target_executable)
          @builder.append " /targetExecutable=#{@builder.format target_executable}"
          yield @builder if block_given?
          self
        end
        def target_working_dir(target_working_dir)
          @builder.append " /targetWorkingDir=#{@builder.format target_working_dir}"
          yield @builder if block_given?
          self
        end
        def temp_dir(temp_dir)
          @builder.append " /tempDir=#{@builder.format temp_dir}"
          yield @builder if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(builder, configuration_file=nil)
          super builder
          @builder.append ' delete'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @builder.append " /logFile=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def source(source)
          @builder.append " /source=#{@builder.format source}"
          yield @builder if block_given?
          self
        end
      end
      class List < CommandBase
        def initialize(builder, configuration_file=nil)
          super builder
          @builder.append ' list'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @builder.append " /logFile=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def output(snapshot_path)
          @builder.append " /output=#{@builder.format snapshot_path}"
          yield @builder if block_given?
          self
        end
        def source(source)
          @builder.append " /source=#{@builder.format source}"
          yield @builder if block_given?
          self
        end
      end
      class Merge < CommandBase
        def initialize(builder, configuration_file=nil)
          super builder
          @builder.append ' merge'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @builder.append " /logFile=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def output(snapshot_path)
          @builder.append " /output=#{@builder.format snapshot_path}"
          yield @builder if block_given?
          self
        end
        def source(source)
          @builder.append " /source=#{@builder.format source}"
          yield @builder if block_given?
          self
        end
        def temp_dir(temp_dir)
          @builder.append " /tempDir=#{@builder.format temp_dir}"
          yield @builder if block_given?
          self
        end
      end
      class Report < CommandBase
        def initialize(builder, configuration_file=nil)
          super builder
          @builder.append ' report'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @builder.append " /logFile=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def output(snapshot_path)
          @builder.append " /output=#{@builder.format snapshot_path}"
          yield @builder if block_given?
          self
        end
        def report_type(report_type)
          @builder.append " /reportType=#{@builder.format report_type}"
          yield @builder if block_given?
          self
        end
        def source(source)
          @builder.append " /source=#{@builder.format source}"
          yield @builder if block_given?
          self
        end
      end
      class Version < CommandBase
        def initialize(builder, output_file_name=nil)
          super builder
          @builder.append ' version'
          @builder.append " #{@builder.format output_file_name}" unless output_file_name.nil?
        end
        def log_file(log_file)
          @builder.append " /logFile=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
      end
      class Zip < CommandBase
        def initialize(builder, configuration_file=nil)
          super builder
          @builder.append ' zip'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def log_file(log_file)
          @builder.append " /logFile=#{@builder.format log_file}"
          yield @builder if block_given?
          self
        end
        def output(snapshot_path)
          @builder.append " /output=#{@builder.format snapshot_path}"
          yield @builder if block_given?
          self
        end
        def source(source)
          @builder.append " /source=#{@builder.format source}"
          yield @builder if block_given?
          self
        end
      end
      def dotcover
        builder = CommandBuilder.new FluentCommandBuilder::DotCover::COMMAND_NAME
        command = DotCover.new builder
        yield builder if block_given?
        command
      end
      def self.create
        builder = CommandBuilder.new FluentCommandBuilder::DotCover::COMMAND_NAME
        command = DotCover.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def dotcover_12
    builder = CommandBuilder.new FluentCommandBuilder::DotCover::COMMAND_NAME
    command = DotCover::V12::DotCover.new builder
    yield builder if block_given?
    command
  end
end
