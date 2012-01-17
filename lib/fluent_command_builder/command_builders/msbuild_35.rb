require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V35
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
          @builder.format(target, ';') { |v| @builder.append "/target:#{v}" }
          self
        end
        
        def property property
          @builder.format(property, ';', '=') { |v| @builder.append "/property:#{v}" }
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
          @builder.format(extensions, ';') { |v| @builder.append "/ignoreProjectExtensions:#{v}" }
          self
        end
        
        def file_logger 
          @builder.append "/fileLogger"
          self
        end
        
        def distributed_file_logger 
          @builder.append "/distributedFileLogger"
          self
        end
        
        def file_logger_parameters parameters
          @builder.format(parameters, ';', '=') { |v| @builder.append "/fileLoggerParameters:#{v}" }
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
  
  def msbuild35
    MSBuild::V35::MSBuild.new
  end
  
end

