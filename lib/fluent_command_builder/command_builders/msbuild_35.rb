require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V35
      class MSBuild < CommandBase
        def initialize builder, project_file=nil
          @builder = builder
          @builder.append 'MSBuild'
          @builder.append " #{@builder.format project_file}" unless project_file.nil?
        end
        def help 
          @builder.append ' /help'
          self
        end
        def no_logo 
          @builder.append ' /noLogo'
          self
        end
        def version 
          @builder.append ' /version'
          self
        end
        def file file
          @builder.append " @#{@builder.format file}"
          self
        end
        def no_auto_response 
          @builder.append ' /noAutoResponse'
          self
        end
        def target target
          @builder.append " /target:#{@builder.format target, ';'}"
          self
        end
        def property property
          @builder.append " /property:#{@builder.format property, ';', '='}"
          self
        end
        def logger logger
          @builder.append " /logger:#{@builder.format logger}"
          self
        end
        def distributed_logger logger
          @builder.append " /distributedLogger:#{@builder.format logger}"
          self
        end
        def console_logger_parameters parameters
          @builder.append " /consoleLoggerParameters:#{@builder.format parameters}"
          self
        end
        def verbosity level
          @builder.append " /verbosity:#{@builder.format level}"
          self
        end
        def no_console_logger 
          @builder.append ' /noConsoleLogger'
          self
        end
        def validate schema=nil
          @builder.append ' /validate'
          @builder.append ":#{@builder.format schema}" unless schema.nil?
          self
        end
        def max_cpu_count number
          @builder.append " /maxCpuCount:#{@builder.format number}"
          self
        end
        def ignore_project_extensions extensions
          @builder.append " /ignoreProjectExtensions:#{@builder.format extensions, ';'}"
          self
        end
        def file_logger 
          @builder.append ' /fileLogger'
          self
        end
        def distributed_file_logger 
          @builder.append ' /distributedFileLogger'
          self
        end
        def file_logger_parameters parameters
          @builder.append " /fileLoggerParameters:#{@builder.format parameters, ';', '='}"
          self
        end
        def tools_version version
          @builder.append " /toolsVersion:#{@builder.format version}"
          self
        end
        def node_reuse parameters
          @builder.append " /nodeReuse:#{@builder.format parameters}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def msbuild project_file=nil
        MSBuild.new CommandBuilder.new, project_file
      end
    end
  end
  def msbuild_35 project_file=nil
    MSBuild::V35::MSBuild.new CommandBuilder.new, project_file
  end
end
