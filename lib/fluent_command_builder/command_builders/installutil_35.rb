require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def installutil_35
    b = UnderlyingBuilder.new
    c = FluentCommandBuilder::InstallUtil::V35.create b
    yield b if block_given?
    c
  end
  module InstallUtil
    module V35
      def self.create(underlying_builder)
        InstallUtil.new underlying_builder
      end
      def installutil
        b = UnderlyingBuilder.new
        c = FluentCommandBuilder::InstallUtil::V35.create b
        yield b if block_given?
        c
      end
      class InstallUtil < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'installUtil'
        end
        def help(assembly_path=nil)
          @builder.append ' /help'
          @builder.append " #{@builder.format assembly_path}" unless assembly_path.nil?
          yield @builder if block_given?
          self
        end
        def log_file(file_name=nil)
          @builder.append ' /logFile'
          @builder.append "=#{@builder.format file_name}" unless file_name.nil?
          yield @builder if block_given?
          self
        end
        def assembly_strong_name(assembly_name)
          @builder.append " /assemblyName=#{@builder.format assembly_name}"
          yield @builder if block_given?
          self
        end
        def log_to_console(bool)
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
        def assembly_file_name(assembly_file_name)
          @builder.append " #{@builder.format assembly_file_name}"
          yield @builder if block_given?
          self
        end
      end
    end
  end
end
