# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../printer')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def dotcover_10
    FluentCommandBuilder::DotCover::V10.create { |b| yield b if block_given? }
  end
  module DotCover
    module V10
      VERSION = '1.0'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        printer = FluentCommandBuilder::Printer.new
        begin
          printer.print_warning %Q[Default Path for command "#{FluentCommandBuilder::DotCover::COMMAND_NAME} #{VERSION}" does not exist. Path: #{value}] unless File.exist? value
        rescue
          printer.print_warning %Q[Failed to determine whether Default Path for command "#{FluentCommandBuilder::DotCover::COMMAND_NAME} #{VERSION}" exists. An internal error occurred.]
        end
        @default_path = value
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::DotCover::COMMAND_NAME
        b.path = self.default_path
        c = DotCover.new(b)
        yield b if block_given?
        c
      end
      def dotcover
        FluentCommandBuilder::DotCover::V10.create { |b| yield b if block_given? }
      end
      class DotCover < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def analyse(configuration_file)
          @b.append " analyse #{@b.format configuration_file}"
          yield @b if block_given?
          self
        end
        def cover(configuration_file)
          @b.append " cover #{@b.format configuration_file}"
          yield @b if block_given?
          self
        end
        def delete(configuration_file)
          @b.append " delete #{@b.format configuration_file}"
          yield @b if block_given?
          self
        end
        def help(command=nil, file_name=nil)
          @b.append ' help'
          @b.append " #{@b.format command}" unless command.nil?
          @b.append " #{@b.format file_name}" unless file_name.nil?
          yield @b if block_given?
          self
        end
        def list(configuration_file)
          @b.append " list #{@b.format configuration_file}"
          yield @b if block_given?
          self
        end
        def merge(configuration_file)
          @b.append " merge #{@b.format configuration_file}"
          yield @b if block_given?
          self
        end
        def report(configuration_file)
          @b.append " report #{@b.format configuration_file}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end