require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSBuild
    
    COMMAND_NAME = 'MSBuild' unless const_defined? :COMMAND_NAME
    
    def self.create_builder
      CommandBuilder.new COMMAND_NAME
    end
    
    module V30
      class MSBuild < CommandBase
        def initialize(builder, project_file=nil)
          super builder
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
      end
      
      def msbuild(project_file=nil)
        builder = FluentCommandBuilder::MSBuild.create_builder
        command = MSBuild.new builder, project_file
        yield builder if block_given?
        command
      end
      
      def self.create(project_file=nil)
        builder = FluentCommandBuilder::MSBuild.create_builder
        command = MSBuild.new builder, project_file
        yield builder if block_given?
        command
      end
    end
  end
  
  def msbuild_30(project_file=nil)
    builder = FluentCommandBuilder::MSBuild.create_builder
    command = MSBuild::V30::MSBuild.new builder, project_file
    yield builder if block_given?
    command
  end
end
