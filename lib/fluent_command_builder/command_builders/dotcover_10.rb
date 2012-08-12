require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def dotcover_10()
    DotCover::V10.create() { |b| yield b if block_given? }
  end
  module DotCover
    module V10
      def self.create()
        b = UnderlyingBuilder.new FluentCommandBuilder::DotCover::COMMAND_NAME
        c = DotCover.new b
        yield b if block_given?
        c
      end
      def dotcover()
        V10.create() { |b| yield b if block_given? }
      end
      class DotCover < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def analyse(configuration_file)
          b.append " analyse #{b.format configuration_file}"
          yield b if block_given?
          self
        end
        def cover(configuration_file)
          b.append " cover #{b.format configuration_file}"
          yield b if block_given?
          self
        end
        def delete(configuration_file)
          b.append " delete #{b.format configuration_file}"
          yield b if block_given?
          self
        end
        def help(command=nil, file_name=nil)
          b.append ' help'
          b.append " #{b.format command}" unless command.nil?
          b.append " #{b.format file_name}" unless file_name.nil?
          yield b if block_given?
          self
        end
        def list(configuration_file)
          b.append " list #{b.format configuration_file}"
          yield b if block_given?
          self
        end
        def merge(configuration_file)
          b.append " merge #{b.format configuration_file}"
          yield b if block_given?
          self
        end
        def report(configuration_file)
          b.append " report #{b.format configuration_file}"
          yield b if block_given?
          self
        end
      end

    end
  end
end