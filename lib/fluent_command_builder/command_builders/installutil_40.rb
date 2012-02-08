require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module InstallUtil
    module V40
      COMMAND_NAME = 'installUtil'
      class InstallUtil < CommandBase
        def initialize builder, assembly_name=nil
          super builder
          @builder.append " #{@builder.format assembly_name}" unless assembly_name.nil?
        end
        def help assembly_path=nil
          @builder.append ' /help'
          @builder.append " #{@builder.format assembly_path}" unless assembly_path.nil?
          yield @builder if block_given?
          self
        end
        def assembly_name assembly_name
          @builder.append " /assemblyName=#{@builder.format assembly_name}"
          yield @builder if block_given?
          self
        end
        def install_state_dir directory_name=nil
          @builder.append ' /installStateDir'
          @builder.append "=#{@builder.format directory_name}" unless directory_name.nil?
          yield @builder if block_given?
          self
        end
        def log_file file_name=nil
          @builder.append ' /logFile'
          @builder.append "=#{@builder.format file_name}" unless file_name.nil?
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
      end
      def installutil assembly_name=nil
        builder = CommandBuilder.new COMMAND_NAME
        command = InstallUtil.new builder, assembly_name
        yield builder if block_given?
        command
      end
    end
  end
  def installutil_40 assembly_name=nil
    builder = CommandBuilder.new InstallUtil::V40::COMMAND_NAME
    command = InstallUtil::V40::InstallUtil.new builder, assembly_name
    yield builder if block_given?
    command
  end
end
