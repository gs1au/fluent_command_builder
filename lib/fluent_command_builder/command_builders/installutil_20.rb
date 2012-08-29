# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../printer')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def installutil_20
    FluentCommandBuilder::InstallUtil::V20.create { |b| yield b if block_given? }
  end
  module InstallUtil
    module V20
      VERSION = '2.0'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        printer = FluentCommandBuilder::Printer.new
        begin
          printer.print_warning %Q[Default Path for command #{FluentCommandBuilder::InstallUtil::COMMAND_NAME} #{VERSION} does not exist. Path: #{value}] unless File.exist? value
        rescue
          printer.print_warning %Q[Failed to determine whether Default Path for command #{FluentCommandBuilder::InstallUtil::COMMAND_NAME} #{VERSION} exists. An internal error occurred.]
        end
        @default_path = value
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::InstallUtil::COMMAND_NAME, VERSION
        b.path = self.default_path
        c = InstallUtil.new(b)
        yield b if block_given?
        c
      end
      def installutil
        FluentCommandBuilder::InstallUtil::V20.create { |b| yield b if block_given? }
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
        def assembly_strong_name(assembly_name)
          @b.append " /assemblyName=#{@b.format assembly_name}"
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