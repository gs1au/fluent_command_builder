require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module DotCover
    
    COMMAND_NAME = 'dotCover' unless const_defined? :COMMAND_NAME
    
    def self.create_builder
      CommandBuilder.new COMMAND_NAME
    end
    
    module V10
      class DotCover < CommandBase
        def initialize(builder)
          super builder
        end
        def analyse(configuration_file)
          @builder.append " analyse #{@builder.format configuration_file}"
          yield @builder if block_given?
          self
        end
        def cover(configuration_file)
          @builder.append " cover #{@builder.format configuration_file}"
          yield @builder if block_given?
          self
        end
        def delete(configuration_file)
          @builder.append " delete #{@builder.format configuration_file}"
          yield @builder if block_given?
          self
        end
        def help(command=nil, file_name=nil)
          @builder.append ' help'
          @builder.append " #{@builder.format command}" unless command.nil?
          @builder.append " #{@builder.format file_name}" unless file_name.nil?
          yield @builder if block_given?
          self
        end
        def list(configuration_file)
          @builder.append " list #{@builder.format configuration_file}"
          yield @builder if block_given?
          self
        end
        def merge(configuration_file)
          @builder.append " merge #{@builder.format configuration_file}"
          yield @builder if block_given?
          self
        end
        def report(configuration_file)
          @builder.append " report #{@builder.format configuration_file}"
          yield @builder if block_given?
          self
        end
      end
      
      def dotcover
        builder = FluentCommandBuilder::DotCover.create_builder
        command = DotCover.new builder
        yield builder if block_given?
        command
      end
      
      def self.create
        builder = FluentCommandBuilder::DotCover.create_builder
        command = DotCover.new builder
        yield builder if block_given?
        command
      end
    end
  end
  
  def dotcover_10
    builder = FluentCommandBuilder::DotCover.create_builder
    command = DotCover::V10::DotCover.new builder
    yield builder if block_given?
    command
  end
end
