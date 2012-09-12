# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../default_path_validator')
require File.expand_path(File.dirname(__FILE__) + '/../version_validator')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def installutil_11
    FluentCommandBuilder::InstallUtil::V11.create { |b| yield b if block_given? }
  end
  module InstallUtil
    module V11
      VERSION = '1.1'
      def self.exact_version
        @exact_version ||= VERSION
      end
      def self.exact_version=(value)
        @exact_version = value
      end
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        validator = DefaultPathValidator.new value, FluentCommandBuilder::InstallUtil::COMMAND_NAME, exact_version
        validator.validate
        @default_path = value
      end
      def self.version_validator
        @version_validator ||= VersionValidator.new(FluentCommandBuilder::InstallUtil::COMMAND_NAME, FluentCommandBuilder::InstallUtil.version_detector, exact_version)
      end
      def self.version_validator=(value)
        @version_validator = value
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::InstallUtil::COMMAND_NAME
        b.path = self.default_path
        b.version_validator = self.version_validator
        c = InstallUtil.new(b)
        yield b if block_given?
        c
      end
      def installutil
        FluentCommandBuilder::InstallUtil::V11.create { |b| yield b if block_given? }
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