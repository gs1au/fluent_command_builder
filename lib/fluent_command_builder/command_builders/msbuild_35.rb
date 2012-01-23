require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V35
      class MSBuild
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'MSBuild'
          self
        end
        
        def project_file project_file
          @b.append "#{@b.format project_file}"
          self
        end
        
        def help 
          @b.append '/help'
          self
        end
        
        def no_logo 
          @b.append '/noLogo'
          self
        end
        
        def version 
          @b.append '/version'
          self
        end
        
        def file file
          @b.append "@#{@b.format file}"
          self
        end
        
        def no_auto_response 
          @b.append '/noAutoResponse'
          self
        end
        
        def target target
          @b.append "/target:#{@b.format target, ';'}"
          self
        end
        
        def property property
          @b.append "/property:#{@b.format property, ';', '='}"
          self
        end
        
        def logger logger
          @b.append "/logger:#{@b.format logger}"
          self
        end
        
        def distributed_logger logger
          @b.append "/distributedLogger:#{@b.format logger}"
          self
        end
        
        def console_logger_parameters parameters
          @b.append "/consoleLoggerParameters:#{@b.format parameters}"
          self
        end
        
        def verbosity level
          @b.append "/verbosity:#{@b.format level}"
          self
        end
        
        def no_console_logger 
          @b.append '/noConsoleLogger'
          self
        end
        
        def validate schema
          @b.append "/validate:#{@b.format schema}"
          self
        end
        
        def max_cpu_count number
          @b.append "/maxCpuCount:#{@b.format number}"
          self
        end
        
        def ignore_project_extensions extensions
          @b.append "/ignoreProjectExtensions:#{@b.format extensions, ';'}"
          self
        end
        
        def file_logger 
          @b.append '/fileLogger'
          self
        end
        
        def distributed_file_logger 
          @b.append '/distributedFileLogger'
          self
        end
        
        def file_logger_parameters parameters
          @b.append "/fileLoggerParameters:#{@b.format parameters, ';', '='}"
          self
        end
        
        def tools_version version
          @b.append "/toolsVersion:#{@b.format version}"
          self
        end
        
        def node_reuse parameters
          @b.append "/nodeReuse:#{@b.format parameters}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def msbuild
        MSBuild.new
      end
      
    end
    
  end
  
  def msbuild_35
    MSBuild::V35::MSBuild.new
  end
  
end

