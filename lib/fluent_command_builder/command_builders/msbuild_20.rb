# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder_config')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  module MSBuild
    module V20
      VERSION = '2.0'
      @@config = CommandBuilderConfig.new FluentCommandBuilder::MSBuild::COMMAND_NAME, VERSION
      @@config.version_detector = FluentCommandBuilder::MSBuild.version_detector
      def configure_msbuild
        yield @@config
        @@config.validate
      end
      def msbuild(project_file=nil)
        b = UnderlyingBuilder.new @@config
        c = MSBuild.new(b, project_file)
        yield b if block_given?
        c
      end
      class MSBuild < CommandBase
        def initialize(underlying_builder, project_file=nil)
          super underlying_builder
          @b.append " #{@b.format project_file}" unless project_file.nil?
        end
        def help
          @b.append ' /help'
          yield @b if block_given?
          self
        end
        def no_logo
          @b.append ' /noLogo'
          yield @b if block_given?
          self
        end
        def version
          @b.append ' /version'
          yield @b if block_given?
          self
        end
        def file(file)
          @b.append " @#{@b.format file}"
          yield @b if block_given?
          self
        end
        def no_auto_response
          @b.append ' /noAutoResponse'
          yield @b if block_given?
          self
        end
        def target(target)
          @b.append " /target:#{@b.format target, ';'}"
          yield @b if block_given?
          self
        end
        def property(property)
          @b.append " /property:#{@b.format property, ';', '='}"
          yield @b if block_given?
          self
        end
        def logger(logger)
          @b.append " /logger:#{@b.format logger}"
          yield @b if block_given?
          self
        end
        def console_logger_parameters(parameters)
          @b.append " /consoleLoggerParameters:#{@b.format parameters}"
          yield @b if block_given?
          self
        end
        def verbosity(level)
          @b.append " /verbosity:#{@b.format level}"
          yield @b if block_given?
          self
        end
        def no_console_logger
          @b.append ' /noConsoleLogger'
          yield @b if block_given?
          self
        end
        def validate(schema=nil)
          @b.append ' /validate'
          @b.append ":#{@b.format schema}" unless schema.nil?
          yield @b if block_given?
          self
        end
      end

    end
  end
end