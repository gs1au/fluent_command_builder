require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module DotCover
    module V11
      class DotCover
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'dotCover'
          self
        end
        
        def cover
          Cover.new self
        end
        
        def merge
          Merge.new self
        end
        
        def report
          Report.new self
        end
        
        def list
          List.new self
        end
        
        def delete
          Delete.new self
        end
        
        def analyse
          Analyse.new self
        end
        
        def zip
          Zip.new self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Cover
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'cover'
          self
        end
        
        def analyse_target_arguments arg
          @b.append "/AnalyseTargetArguments=#{@b.format arg}"
          self
        end
        
        def filters arg
          @b.append "/Filters=#{@b.format arg}"
          self
        end
        
        def inherit_console arg
          @b.append "/InheritConsole=#{@b.format arg}"
          self
        end
        
        def log_file arg
          @b.append "/LogFile=#{@b.format arg}"
          self
        end
        
        def output arg
          @b.append "/Output=#{@b.format arg}"
          self
        end
        
        def target_arguments arg
          @b.append "/TargetArguments=#{@b.format arg}"
          self
        end
        
        def target_executable arg
          @b.append "/TargetExecutable=#{@b.format arg}"
          self
        end
        
        def target_working_dir arg
          @b.append "/TargetWorkingDir=#{@b.format arg}"
          self
        end
        
        def temp_dir arg
          @b.append "/TempDir=#{@b.format arg}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Merge
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'merge'
          self
        end
        
        def output arg
          @b.append "/Output=#{@b.format arg}"
          self
        end
        
        def source arg
          @b.append "/Source=#{@b.format arg}"
          self
        end
        
        def temp_dir arg
          @b.append "/TempDir=#{@b.format arg}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Report
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'report'
          self
        end
        
        def output arg
          @b.append "/Output=#{@b.format arg}"
          self
        end
        
        def report_type arg
          @b.append "/ReportType=#{@b.format arg}"
          self
        end
        
        def source arg
          @b.append "/Source=#{@b.format arg}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class List
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'list'
          self
        end
        
        def output arg
          @b.append "/Output=#{@b.format arg}"
          self
        end
        
        def source arg
          @b.append "/Source=#{@b.format arg}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Delete
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'delete'
          self
        end
        
        def source arg
          @b.append "/Source=#{@b.format arg}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Analyse
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'analyse'
          self
        end
        
        def analyse_target_arguments arg
          @b.append "/AnalyseTargetArguments=#{@b.format arg}"
          self
        end
        
        def filters arg
          @b.append "/Filters=#{@b.format arg}"
          self
        end
        
        def inherit_console arg
          @b.append "/InheritConsole=#{@b.format arg}"
          self
        end
        
        def log_file arg
          @b.append "/LogFile=#{@b.format arg}"
          self
        end
        
        def output arg
          @b.append "/Output=#{@b.format arg}"
          self
        end
        
        def report_type arg
          @b.append "/ReportType=#{@b.format arg}"
          self
        end
        
        def target_arguments arg
          @b.append "/TargetArguments=#{@b.format arg}"
          self
        end
        
        def target_executable arg
          @b.append "/TargetExecutable=#{@b.format arg}"
          self
        end
        
        def target_working_dir arg
          @b.append "/TargetWorkingDir=#{@b.format arg}"
          self
        end
        
        def temp_dir arg
          @b.append "/TempDir=#{@b.format arg}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Zip
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'zip'
          self
        end
        
        def output arg
          @b.append "/Output=#{@b.format arg}"
          self
        end
        
        def source arg
          @b.append "/Source=#{@b.format arg}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def dotcover
        DotCover.new
      end
      
    end
    
  end
  
  def dotcover_11
    DotCover::V11::DotCover.new
  end
  
end

