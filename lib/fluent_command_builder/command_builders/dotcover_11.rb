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
      end
      class Cover
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' cover'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def analyse_target_arguments arg
          @builder.append " /AnalyseTargetArguments=#{@builder.format arg}"
          self
        end
        def filters arg
          @builder.append " /Filters=#{@builder.format arg}"
          self
        end
        def inherit_console arg
          @builder.append " /InheritConsole=#{@builder.format arg}"
          self
        end
        def log_file arg
          @builder.append " /LogFile=#{@builder.format arg}"
          self
        end
        def output arg
          @builder.append " /Output=#{@builder.format arg}"
          self
        end
        def target_arguments arg
          @builder.append " /TargetArguments=#{@builder.format arg}"
          self
        end
        def target_executable arg
          @builder.append " /TargetExecutable=#{@builder.format arg}"
          self
        end
        def target_working_dir arg
          @builder.append " /TargetWorkingDir=#{@builder.format arg}"
          self
        end
        def temp_dir arg
          @builder.append " /TempDir=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Merge
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' merge'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def output arg
          @builder.append " /Output=#{@builder.format arg}"
          self
        end
        def source arg
          @builder.append " /Source=#{@builder.format arg}"
          self
        end
        def temp_dir arg
          @builder.append " /TempDir=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Report
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' report'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def output arg
          @builder.append " /Output=#{@builder.format arg}"
          self
        end
        def report_type arg
          @builder.append " /ReportType=#{@builder.format arg}"
          self
        end
        def source arg
          @builder.append " /Source=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class List
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' list'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def output arg
          @builder.append " /Output=#{@builder.format arg}"
          self
        end
        def source arg
          @builder.append " /Source=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Delete
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' delete'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def source arg
          @builder.append " /Source=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Analyse
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' analyse'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def analyse_target_arguments arg
          @builder.append " /AnalyseTargetArguments=#{@builder.format arg}"
          self
        end
        def filters arg
          @builder.append " /Filters=#{@builder.format arg}"
          self
        end
        def inherit_console arg
          @builder.append " /InheritConsole=#{@builder.format arg}"
          self
        end
        def log_file arg
          @builder.append " /LogFile=#{@builder.format arg}"
          self
        end
        def output arg
          @builder.append " /Output=#{@builder.format arg}"
          self
        end
        def report_type arg
          @builder.append " /ReportType=#{@builder.format arg}"
          self
        end
        def target_arguments arg
          @builder.append " /TargetArguments=#{@builder.format arg}"
          self
        end
        def target_executable arg
          @builder.append " /TargetExecutable=#{@builder.format arg}"
          self
        end
        def target_working_dir arg
          @builder.append " /TargetWorkingDir=#{@builder.format arg}"
          self
        end
        def temp_dir arg
          @builder.append " /TempDir=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Zip
        def initialize builder, configuration_file=nil
          @builder = builder
          @builder.append ' zip'
          @builder.append " #{@builder.format configuration_file}" unless configuration_file.nil?
        end
        def output arg
          @builder.append " /Output=#{@builder.format arg}"
          self
        end
        def source arg
          @builder.append " /Source=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
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
