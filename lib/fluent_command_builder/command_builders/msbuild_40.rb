require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V40
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
        
        def file_logger1 
          @b.append '/fileLogger1'
          self
        end
        
        def file_logger2 
          @b.append '/fileLogger2'
          self
        end
        
        def file_logger3 
          @b.append '/fileLogger3'
          self
        end
        
        def file_logger4 
          @b.append '/fileLogger4'
          self
        end
        
        def file_logger5 
          @b.append '/fileLogger5'
          self
        end
        
        def file_logger6 
          @b.append '/fileLogger6'
          self
        end
        
        def file_logger7 
          @b.append '/fileLogger7'
          self
        end
        
        def file_logger8 
          @b.append '/fileLogger8'
          self
        end
        
        def file_logger9 
          @b.append '/fileLogger9'
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
        
        def file_logger_parameters1 parameters
          @b.append "/fileLoggerParameters1:#{@b.format parameters, ';', '='}"
          self
        end
        
        def file_logger_parameters2 parameters
          @b.append "/fileLoggerParameters2:#{@b.format parameters, ';', '='}"
          self
        end
        
        def file_logger_parameters3 parameters
          @b.append "/fileLoggerParameters3:#{@b.format parameters, ';', '='}"
          self
        end
        
        def file_logger_parameters4 parameters
          @b.append "/fileLoggerParameters4:#{@b.format parameters, ';', '='}"
          self
        end
        
        def file_logger_parameters5 parameters
          @b.append "/fileLoggerParameters5:#{@b.format parameters, ';', '='}"
          self
        end
        
        def file_logger_parameters6 parameters
          @b.append "/fileLoggerParameters6:#{@b.format parameters, ';', '='}"
          self
        end
        
        def file_logger_parameters7 parameters
          @b.append "/fileLoggerParameters7:#{@b.format parameters, ';', '='}"
          self
        end
        
        def file_logger_parameters8 parameters
          @b.append "/fileLoggerParameters8:#{@b.format parameters, ';', '='}"
          self
        end
        
        def file_logger_parameters9 parameters
          @b.append "/fileLoggerParameters9:#{@b.format parameters, ';', '='}"
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
  
  def msbuild_40
    MSBuild::V40::MSBuild.new
  end
  
end

