require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def msbuild_40(project_file=nil)
    b = UnderlyingBuilder.new
    c = MSBuild::V40.create b, project_file
    yield b if block_given?
    c
  end
  module MSBuild
    module V40
      def self.create(underlying_builder, project_file=nil)
        MSBuild.new underlying_builder, project_file
      end
      def msbuild(project_file=nil)
        b = UnderlyingBuilder.new
        c = V40.create b, project_file
        yield b if block_given?
        c
      end
      class MSBuild < CommandBase
  def initialize(underlying_builder, project_file=nil)
    super underlying_builder
    @builder.command_name = 'MSBuild'
    @builder.append " #{@builder.format project_file}" unless project_file.nil?
  end
  def help
    @builder.append ' /help'
    yield @builder if block_given?
    self
  end
  def no_logo
    @builder.append ' /noLogo'
    yield @builder if block_given?
    self
  end
  def version
    @builder.append ' /version'
    yield @builder if block_given?
    self
  end
  def file(file)
    @builder.append " @#{@builder.format file}"
    yield @builder if block_given?
    self
  end
  def no_auto_response
    @builder.append ' /noAutoResponse'
    yield @builder if block_given?
    self
  end
  def target(target)
    @builder.append " /target:#{@builder.format target, ';'}"
    yield @builder if block_given?
    self
  end
  def property(property)
    @builder.append " /property:#{@builder.format property, ';', '='}"
    yield @builder if block_given?
    self
  end
  def logger(logger)
    @builder.append " /logger:#{@builder.format logger}"
    yield @builder if block_given?
    self
  end
  def distributed_logger(logger)
    @builder.append " /distributedLogger:#{@builder.format logger}"
    yield @builder if block_given?
    self
  end
  def console_logger_parameters(parameters)
    @builder.append " /consoleLoggerParameters:#{@builder.format parameters}"
    yield @builder if block_given?
    self
  end
  def verbosity(level)
    @builder.append " /verbosity:#{@builder.format level}"
    yield @builder if block_given?
    self
  end
  def no_console_logger
    @builder.append ' /noConsoleLogger'
    yield @builder if block_given?
    self
  end
  def validate(schema=nil)
    @builder.append ' /validate'
    @builder.append ":#{@builder.format schema}" unless schema.nil?
    yield @builder if block_given?
    self
  end
  def max_cpu_count(number)
    @builder.append " /maxCpuCount:#{@builder.format number}"
    yield @builder if block_given?
    self
  end
  def ignore_project_extensions(extensions)
    @builder.append " /ignoreProjectExtensions:#{@builder.format extensions, ';'}"
    yield @builder if block_given?
    self
  end
  def file_logger(n=nil)
    @builder.append ' /fileLogger'
    @builder.append "#{@builder.format n}" unless n.nil?
    yield @builder if block_given?
    self
  end
  def distributed_file_logger
    @builder.append ' /distributedFileLogger'
    yield @builder if block_given?
    self
  end
  def file_logger_parameters(parameters, n=nil)
    @builder.append ' /fileLoggerParameters'
    @builder.append "#{@builder.format n}" unless n.nil?
    @builder.append ":#{@builder.format parameters, ';', '='}"
    yield @builder if block_given?
    self
  end
  def tools_version(version)
    @builder.append " /toolsVersion:#{@builder.format version}"
    yield @builder if block_given?
    self
  end
  def node_reuse(parameters)
    @builder.append " /nodeReuse:#{@builder.format parameters}"
    yield @builder if block_given?
    self
  end
end

    end
  end
end