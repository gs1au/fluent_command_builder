require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V20
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
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def msbuild
        MSBuild.new
      end
      
    end
    
  end
  
  def msbuild20
    MSBuild::V20::MSBuild.new
  end
  
end

