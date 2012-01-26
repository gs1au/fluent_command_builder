require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module DotCover
    module V11
      class DotCover
        def initialize builder
          @builder = builder
          @builder.append 'dotCover'
        end
        def cover 
          Cover.new @builder
        end
        def merge 
          Merge.new @builder
        end
        def report 
          Report.new @builder
        end
        def list 
          List.new @builder
        end
        def delete 
          Delete.new @builder
        end
        def analyse 
          Analyse.new @builder
        end
        def zip 
          Zip.new @builder
        end
        def to_s 
          @builder.to_s
        end
      end
      class Cover
        def initialize builder
          @builder = builder
          @builder.append 'cover'
        end
        def analyse_target_arguments arg
          @builder.append "/AnalyseTargetArguments=#{@builder.format arg}"
          self
        end
        def filters arg
          @builder.append "/Filters=#{@builder.format arg}"
          self
        end
        def inherit_console arg
          @builder.append "/InheritConsole=#{@builder.format arg}"
          self
        end
        def log_file arg
          @builder.append "/LogFile=#{@builder.format arg}"
          self
        end
        def output arg
          @builder.append "/Output=#{@builder.format arg}"
          self
        end
        def target_arguments arg
          @builder.append "/TargetArguments=#{@builder.format arg}"
          self
        end
        def target_executable arg
          @builder.append "/TargetExecutable=#{@builder.format arg}"
          self
        end
        def target_working_dir arg
          @builder.append "/TargetWorkingDir=#{@builder.format arg}"
          self
        end
        def temp_dir arg
          @builder.append "/TempDir=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Merge
        def initialize builder
          @builder = builder
          @builder.append 'merge'
        end
        def output arg
          @builder.append "/Output=#{@builder.format arg}"
          self
        end
        def source arg
          @builder.append "/Source=#{@builder.format arg}"
          self
        end
        def temp_dir arg
          @builder.append "/TempDir=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Report
        def initialize builder
          @builder = builder
          @builder.append 'report'
        end
        def output arg
          @builder.append "/Output=#{@builder.format arg}"
          self
        end
        def report_type arg
          @builder.append "/ReportType=#{@builder.format arg}"
          self
        end
        def source arg
          @builder.append "/Source=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class List
        def initialize builder
          @builder = builder
          @builder.append 'list'
        end
        def output arg
          @builder.append "/Output=#{@builder.format arg}"
          self
        end
        def source arg
          @builder.append "/Source=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Delete
        def initialize builder
          @builder = builder
          @builder.append 'delete'
        end
        def source arg
          @builder.append "/Source=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Analyse
        def initialize builder
          @builder = builder
          @builder.append 'analyse'
        end
        def analyse_target_arguments arg
          @builder.append "/AnalyseTargetArguments=#{@builder.format arg}"
          self
        end
        def filters arg
          @builder.append "/Filters=#{@builder.format arg}"
          self
        end
        def inherit_console arg
          @builder.append "/InheritConsole=#{@builder.format arg}"
          self
        end
        def log_file arg
          @builder.append "/LogFile=#{@builder.format arg}"
          self
        end
        def output arg
          @builder.append "/Output=#{@builder.format arg}"
          self
        end
        def report_type arg
          @builder.append "/ReportType=#{@builder.format arg}"
          self
        end
        def target_arguments arg
          @builder.append "/TargetArguments=#{@builder.format arg}"
          self
        end
        def target_executable arg
          @builder.append "/TargetExecutable=#{@builder.format arg}"
          self
        end
        def target_working_dir arg
          @builder.append "/TargetWorkingDir=#{@builder.format arg}"
          self
        end
        def temp_dir arg
          @builder.append "/TempDir=#{@builder.format arg}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Zip
        def initialize builder
          @builder = builder
          @builder.append 'zip'
        end
        def output arg
          @builder.append "/Output=#{@builder.format arg}"
          self
        end
        def source arg
          @builder.append "/Source=#{@builder.format arg}"
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
    DotCover::V11::dotcover
  end
end
