require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V40
      class MSBuild
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'MSBuild'
          self
        end
        
        def project_file project_file
          @builder.append "#{project_file}"
          self
        end
        
        def help 
          @builder.append "/help"
          self
        end
        
        def no_logo 
          @builder.append "/noLogo"
          self
        end
        
        def version 
          @builder.append "/version"
          self
        end
        
        def file file
          @builder.append "@#{file}"
          self
        end
        
        def no_auto_response 
          @builder.append "/noAutoResponse"
          self
        end
        
        def target target
          @builder.append_format(target, ';') { |v| "/target:#{v}" }
          self
        end
        
        def property property
          @builder.append_format(property, ';', '=') { |v| "/property:#{v}" }
          self
        end
        
        def logger logger
          @builder.append "/logger:#{logger}"
          self
        end
        
        def distributed_logger logger
          @builder.append "/distributedLogger:#{logger}"
          self
        end
        
        def console_logger_parameters parameters
          @builder.append "/consoleLoggerParameters:#{parameters}"
          self
        end
        
        def verbosity level
          @builder.append "/verbosity:#{level}"
          self
        end
        
        def no_console_logger 
          @builder.append "/noConsoleLogger"
          self
        end
        
        def validate schema
          @builder.append "/validate:#{schema}"
          self
        end
        
        def max_cpu_count number
          @builder.append "/maxCpuCount:#{number}"
          self
        end
        
        def ignore_project_extensions extensions
          @builder.append_format(extensions, ';') { |v| "/ignoreProjectExtensions:#{v}" }
          self
        end
        
        def file_logger 
          @builder.append "/fileLogger"
          self
        end
        
        def file_logger1 
          @builder.append "/fileLogger1"
          self
        end
        
        def file_logger2 
          @builder.append "/fileLogger2"
          self
        end
        
        def file_logger3 
          @builder.append "/fileLogger3"
          self
        end
        
        def file_logger4 
          @builder.append "/fileLogger4"
          self
        end
        
        def file_logger5 
          @builder.append "/fileLogger5"
          self
        end
        
        def file_logger6 
          @builder.append "/fileLogger6"
          self
        end
        
        def file_logger7 
          @builder.append "/fileLogger7"
          self
        end
        
        def file_logger8 
          @builder.append "/fileLogger8"
          self
        end
        
        def file_logger9 
          @builder.append "/fileLogger9"
          self
        end
        
        def distributed_file_logger 
          @builder.append "/distributedFileLogger"
          self
        end
        
        def file_logger_parameters parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters:#{v}" }
          self
        end
        
        def file_logger_parameters1 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters1:#{v}" }
          self
        end
        
        def file_logger_parameters2 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters2:#{v}" }
          self
        end
        
        def file_logger_parameters3 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters3:#{v}" }
          self
        end
        
        def file_logger_parameters4 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters4:#{v}" }
          self
        end
        
        def file_logger_parameters5 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters5:#{v}" }
          self
        end
        
        def file_logger_parameters6 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters6:#{v}" }
          self
        end
        
        def file_logger_parameters7 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters7:#{v}" }
          self
        end
        
        def file_logger_parameters8 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters8:#{v}" }
          self
        end
        
        def file_logger_parameters9 parameters
          @builder.append_format(parameters, ';', '=') { |v| "/fileLoggerParameters9:#{v}" }
          self
        end
        
        def tools_version version
          @builder.append "/toolsVersion:#{version}"
          self
        end
        
        def node_reuse parameters
          @builder.append "/nodeReuse:#{parameters}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def msbuild
        MSBuild.new
      end
      
    end
    
  end
  
  def msbuild40
    MSBuild::V40::MSBuild.new
  end
  
end

