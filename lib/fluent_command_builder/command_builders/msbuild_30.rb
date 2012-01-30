require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    module V30
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
        def to_s 
          @builder.to_s
        end
      end
      def msbuild 
        MSBuild.new CommandBuilder.new
      end
    end
  end
  def msbuild_30 
    MSBuild::V30::MSBuild.new CommandBuilder.new
  end
end
