require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module InstallUtil
    module V20
      COMMAND_NAME = 'installUtil'
      class InstallUtil < CommandBase
        def initialize builder
          super builder
        end
        def help assembly_path=nil
          @builder.append ' /help'
          @builder.append " #{@builder.format assembly_path}" unless assembly_path.nil?
          yield @builder if block_given?
          self
        end
        def log_file file_name=nil
          @builder.append ' /logFile'
          @builder.append "=#{@builder.format file_name}" unless file_name.nil?
          yield @builder if block_given?
          self
        end
        def assembly_strong_name assembly_name
          @builder.append " /assemblyName=#{@builder.format assembly_name}"
          yield @builder if block_given?
          self
        end
        def log_to_console bool
          @builder.append " /logToConsole=#{@builder.format bool}"
          yield @builder if block_given?
          self
        end
        def show_call_stack
          @builder.append ' /showCallStack'
          yield @builder if block_given?
          self
        end
        def uninstall
          @builder.append ' /uninstall'
          yield @builder if block_given?
          self
        end
        def assembly_file_name assembly_file_name
          @builder.append " #{@builder.format assembly_file_name}"
          yield @builder if block_given?
          self
        end
      end
      def installutil
        builder = CommandBuilder.new COMMAND_NAME
        command = InstallUtil.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def installutil_20
    builder = CommandBuilder.new InstallUtil::V20::COMMAND_NAME
    command = InstallUtil::V20::InstallUtil.new builder
    yield builder if block_given?
    command
  end
end
