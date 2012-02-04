require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module DotCover
    module V11
      class DotCover
        def initialize builder
          @builder = builder
          @builder.append 'dotCover'
        end
        def cover configuration_file=nil
          Cover.new @builder, configuration_file
        end
        def merge configuration_file=nil
          Merge.new @builder, configuration_file
        end
        def report configuration_file=nil
          Report.new @builder, configuration_file
        end
        def list configuration_file=nil
          List.new @builder, configuration_file
        end
        def delete configuration_file=nil
          Delete.new @builder, configuration_file
        end
        def analyse configuration_file=nil
          Analyse.new @builder, configuration_file
        end
        def zip configuration_file=nil
          Zip.new @builder, configuration_file
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Cover
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' cover'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def analyse_target_arguments bool
          @builder.append " /analyseTargetArguments=#{@builder.format bool}"
          self
        end
        def filters filters
          @builder.append " /filters=#{@builder.format filters, ';'}"
          self
        end
        def inherit_console bool
          @builder.append " /inheritConsole=#{@builder.format bool}"
          self
        end
        def log_file log_file
          @builder.append " /logFile=#{@builder.format log_file}"
          self
        end
        def output snapshot_path
          @builder.append " /output=#{@builder.format snapshot_path}"
          self
        end
        def target_arguments target_arguments
          @builder.append " /targetArguments=#{@builder.format target_arguments}"
          self
        end
        def target_executable target_executable
          @builder.append " /targetExecutable=#{@builder.format target_executable}"
          self
        end
        def target_working_dir target_working_dir
          @builder.append " /targetWorkingDir=#{@builder.format target_working_dir}"
          self
        end
        def temp_dir temp_dir
          @builder.append " /tempDir=#{@builder.format temp_dir}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Merge
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' merge'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def output snapshot_path
          @builder.append " /output=#{@builder.format snapshot_path}"
          self
        end
        def source source
          @builder.append " /source=#{@builder.format source}"
          self
        end
        def temp_dir temp_dir
          @builder.append " /tempDir=#{@builder.format temp_dir}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Report
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' report'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def output snapshot_path
          @builder.append " /output=#{@builder.format snapshot_path}"
          self
        end
        def report_type report_type
          @builder.append " /reportType=#{@builder.format report_type}"
          self
        end
        def source source
          @builder.append " /source=#{@builder.format source}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class List
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' list'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def output snapshot_path
          @builder.append " /output=#{@builder.format snapshot_path}"
          self
        end
        def source source
          @builder.append " /source=#{@builder.format source}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Delete
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' delete'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def source source
          @builder.append " /source=#{@builder.format source}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Analyse
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' analyse'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def analyse_target_arguments bool
          @builder.append " /analyseTargetArguments=#{@builder.format bool}"
          self
        end
        def filters filters
          @builder.append " /filters=#{@builder.format filters, ';'}"
          self
        end
        def inherit_console bool
          @builder.append " /inheritConsole=#{@builder.format bool}"
          self
        end
        def log_file log_file
          @builder.append " /logFile=#{@builder.format log_file}"
          self
        end
        def output snapshot_path
          @builder.append " /output=#{@builder.format snapshot_path}"
          self
        end
        def report_type report_type
          @builder.append " /reportType=#{@builder.format report_type}"
          self
        end
        def target_arguments target_arguments
          @builder.append " /targetArguments=#{@builder.format target_arguments}"
          self
        end
        def target_executable target_executable
          @builder.append " /targetExecutable=#{@builder.format target_executable}"
          self
        end
        def target_working_dir target_working_dir
          @builder.append " /targetWorkingDir=#{@builder.format target_working_dir}"
          self
        end
        def temp_dir temp_dir
          @builder.append " /tempDir=#{@builder.format temp_dir}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Zip
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' zip'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def output snapshot_path
          @builder.append " /output=#{@builder.format snapshot_path}"
          self
        end
        def source source
          @builder.append " /source=#{@builder.format source}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      def dotcover 
        DotCover.new CommandBuilder.new
      end
    end
  end
  def dotcover_11 
    DotCover::V11::DotCover.new CommandBuilder.new
  end
end
