require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V20
      class MSBuild
        def initialize builder
          @builder = builder
          @builder.append 'MSBuild'
        end
        def project_file project_file
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
        def file file
          @builder.append "@#{@builder.format file}"
          self
        end
        def no_auto_response 
          @builder.append '/noAutoResponse'
          self
        end
        def target target
          @builder.append "/target:#{@builder.format target, ';'}"
          self
        end
        def property property
          @builder.append "/property:#{@builder.format property, ';', '='}"
          self
        end
        def logger logger
          @builder.append "/logger:#{@builder.format logger}"
          self
        end
        def console_logger_parameters parameters
          @builder.append "/consoleLoggerParameters:#{@builder.format parameters}"
          self
        end
        def verbosity level
          @builder.append "/verbosity:#{@builder.format level}"
          self
        end
        def no_console_logger 
          @builder.append '/noConsoleLogger'
          self
        end
        def validate schema
          @builder.append "/validate:#{@builder.format schema}"
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
  def msbuild_20 
    MSBuild::V20::msbuild
  end
end
