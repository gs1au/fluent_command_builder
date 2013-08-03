# Generated code. Do not modify.

require_relative '../internal/command_base'
require_relative '../internal/command_builder_config'
require_relative '../internal/underlying_builder'

module FluentCommandBuilder
  module InstallUtil
    module V11
      VERSION = '1.1'
      @@config = CommandBuilderConfig.new FluentCommandBuilder::InstallUtil::COMMAND_NAME, VERSION
      def configure_installutil
        yield @@config
        @@config.validate_path
        @@config.validate_version
      end
      def installutil
        b = UnderlyingBuilder.new @@config
        c = InstallUtil.new(b)
        yield b if block_given?
        c
      end
      class InstallUtil < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def help(assembly_path=nil)
          @b.append ' /help'
          @b.append " #{@b.format assembly_path}" unless assembly_path.nil?
          yield @b if block_given?
          self
        end
        def log_file(file_name=nil)
          @b.append ' /logFile'
          @b.append "=#{@b.format file_name}" unless file_name.nil?
          yield @b if block_given?
          self
        end
        def log_to_console(bool)
          @b.append " /logToConsole=#{@b.format bool}"
          yield @b if block_given?
          self
        end
        def show_call_stack
          @b.append ' /showCallStack'
          yield @b if block_given?
          self
        end
        def uninstall
          @b.append ' /uninstall'
          yield @b if block_given?
          self
        end
        def assembly_file_name(assembly_file_name)
          @b.append " #{@b.format assembly_file_name}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end