require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../printer')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def msbuild_35(project_file=nil)
    FluentCommandBuilder::MSBuild::V35.create(project_file) { |b| yield b if block_given? }
  end
  module MSBuild
    module V35
      VERSION = '3.5'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        printer = FluentCommandBuilder::Printer.new
        begin
          printer.print_warning %Q[Default Path for command "#{FluentCommandBuilder::MSBuild::COMMAND_NAME}" does not exist. Path: #{value}] unless File.exist? value
        rescue
          printer.print_warning %Q[Failed to determine whether Default Path for command "#{FluentCommandBuilder::MSBuild::COMMAND_NAME}" exists. An internal error occurred.]
        end
        @default_path = value
      end
      def self.create(project_file=nil)
        b = UnderlyingBuilder.new FluentCommandBuilder::MSBuild::COMMAND_NAME
        b.path = self.default_path
        c = MSBuild.new(b, project_file)
        yield b if block_given?
        c
      end
      def msbuild(project_file=nil)
        FluentCommandBuilder::MSBuild::V35.create(project_file) { |b| yield b if block_given? }
      end
      class MSBuild < CommandBase
        def initialize(underlying_builder, project_file=nil)
          super underlying_builder
          @b.append " #{@b.format project_file}" unless project_file.nil?
        end
        def help
          @b.append ' /help'
          yield @b if block_given?
          self
        end
        def no_logo
          @b.append ' /noLogo'
          yield @b if block_given?
          self
        end
        def version
          @b.append ' /version'
          yield @b if block_given?
          self
        end
        def file(file)
          @b.append " @#{@b.format file}"
          yield @b if block_given?
          self
        end
        def no_auto_response
          @b.append ' /noAutoResponse'
          yield @b if block_given?
          self
        end
        def target(target)
          @b.append " /target:#{@b.format target, ';'}"
          yield @b if block_given?
          self
        end
        def property(property)
          @b.append " /property:#{@b.format property, ';', '='}"
          yield @b if block_given?
          self
        end
        def logger(logger)
          @b.append " /logger:#{@b.format logger}"
          yield @b if block_given?
          self
        end
        def distributed_logger(logger)
          @b.append " /distributedLogger:#{@b.format logger}"
          yield @b if block_given?
          self
        end
        def console_logger_parameters(parameters)
          @b.append " /consoleLoggerParameters:#{@b.format parameters}"
          yield @b if block_given?
          self
        end
        def verbosity(level)
          @b.append " /verbosity:#{@b.format level}"
          yield @b if block_given?
          self
        end
        def no_console_logger
          @b.append ' /noConsoleLogger'
          yield @b if block_given?
          self
        end
        def validate(schema=nil)
          @b.append ' /validate'
          @b.append ":#{@b.format schema}" unless schema.nil?
          yield @b if block_given?
          self
        end
        def max_cpu_count(number)
          @b.append " /maxCpuCount:#{@b.format number}"
          yield @b if block_given?
          self
        end
        def ignore_project_extensions(extensions)
          @b.append " /ignoreProjectExtensions:#{@b.format extensions, ';'}"
          yield @b if block_given?
          self
        end
        def file_logger
          @b.append ' /fileLogger'
          yield @b if block_given?
          self
        end
        def distributed_file_logger
          @b.append ' /distributedFileLogger'
          yield @b if block_given?
          self
        end
        def file_logger_parameters(parameters)
          @b.append " /fileLoggerParameters:#{@b.format parameters, ';', '='}"
          yield @b if block_given?
          self
        end
        def tools_version(version)
          @b.append " /toolsVersion:#{@b.format version}"
          yield @b if block_given?
          self
        end
        def node_reuse(parameters)
          @b.append " /nodeReuse:#{@b.format parameters}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end