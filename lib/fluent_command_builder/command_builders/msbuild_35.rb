require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V35
      class MSBuild
        def initialize builder
          @builder = builder
          @builder.append 'MSBuild'
        end
        def project_file project_file=nil
          @builder.append "#{@builder.format project_file}"
          self
        end
        def help 
          @builder.append '/help'
          self
        end
        def no_logo 
          @builder.append '/noLogo'
          self
        end
        def version 
          @builder.append '/version'
          self
        end
        def file file=nil
          @builder.append "@#{@builder.format file}"
          self
        end
        def no_auto_response 
          @builder.append '/noAutoResponse'
          self
        end
        def target target=nil
          @builder.append "/target:#{@builder.format target, ';'}"
          self
        end
        def property property=nil
          @builder.append "/property:#{@builder.format property, ';', '='}"
          self
        end
        def logger logger=nil
          @builder.append "/logger:#{@builder.format logger}"
          self
        end
        def distributed_logger logger=nil
          @builder.append "/distributedLogger:#{@builder.format logger}"
          self
        end
        def console_logger_parameters parameters=nil
          @builder.append "/consoleLoggerParameters:#{@builder.format parameters}"
          self
        end
        def verbosity level=nil
          @builder.append "/verbosity:#{@builder.format level}"
          self
        end
        def no_console_logger 
          @builder.append '/noConsoleLogger'
          self
        end
        def validate schema=nil
          @builder.buffer '/validate'
          @builder.buffer ":#{@builder.format schema}" unless schema.nil?
          @builder.append_buffer
          self
        end
        def max_cpu_count number=nil
          @builder.append "/maxCpuCount:#{@builder.format number}"
          self
        end
        def ignore_project_extensions extensions=nil
          @builder.append "/ignoreProjectExtensions:#{@builder.format extensions, ';'}"
          self
        end
        def file_logger 
          @builder.append '/fileLogger'
          self
        end
        def distributed_file_logger 
          @builder.append '/distributedFileLogger'
          self
        end
        def file_logger_parameters parameters=nil
          @builder.append "/fileLoggerParameters:#{@builder.format parameters, ';', '='}"
          self
        end
        def tools_version version=nil
          @builder.append "/toolsVersion:#{@builder.format version}"
          self
        end
        def node_reuse parameters=nil
          @builder.append "/nodeReuse:#{@builder.format parameters}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def msbuild 
        MSBuild.new CommandBuilder.new
      end
    end
  end
  def msbuild_35 
    MSBuild::V35::MSBuild.new CommandBuilder.new
  end
end
