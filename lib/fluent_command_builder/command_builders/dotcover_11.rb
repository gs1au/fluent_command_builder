require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module DotCover
    module V11
      class DotCover
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'dotCover'
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
          @builder.to_s
        end
        
      end
      
      class Cover
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'cover'
          self
        end
        
        def analyse_target_arguments arg
          @builder.append "/AnalyseTargetArguments=#{arg}"
          self
        end
        
        def filters arg
          @builder.append "/Filters=#{arg}"
          self
        end
        
        def inherit_console arg
          @builder.append "/InheritConsole=#{arg}"
          self
        end
        
        def log_file arg
          @builder.append "/LogFile=#{arg}"
          self
        end
        
        def output arg
          @builder.append "/Output=#{arg}"
          self
        end
        
        def target_arguments arg
          @builder.append "/TargetArguments=#{arg}"
          self
        end
        
        def target_executable arg
          @builder.append "/TargetExecutable=#{arg}"
          self
        end
        
        def target_working_dir arg
          @builder.append "/TargetWorkingDir=#{arg}"
          self
        end
        
        def temp_dir arg
          @builder.append "/TempDir=#{arg}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Merge
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'merge'
          self
        end
        
        def output arg
          @builder.append "/Output=#{arg}"
          self
        end
        
        def source arg
          @builder.append "/Source=#{arg}"
          self
        end
        
        def temp_dir arg
          @builder.append "/TempDir=#{arg}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Report
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'report'
          self
        end
        
        def output arg
          @builder.append "/Output=#{arg}"
          self
        end
        
        def report_type arg
          @builder.append "/ReportType=#{arg}"
          self
        end
        
        def source arg
          @builder.append "/Source=#{arg}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class List
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'list'
          self
        end
        
        def output arg
          @builder.append "/Output=#{arg}"
          self
        end
        
        def source arg
          @builder.append "/Source=#{arg}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Delete
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'delete'
          self
        end
        
        def source arg
          @builder.append "/Source=#{arg}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Analyse
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'analyse'
          self
        end
        
        def analyse_target_arguments arg
          @builder.append "/AnalyseTargetArguments=#{arg}"
          self
        end
        
        def filters arg
          @builder.append "/Filters=#{arg}"
          self
        end
        
        def inherit_console arg
          @builder.append "/InheritConsole=#{arg}"
          self
        end
        
        def log_file arg
          @builder.append "/LogFile=#{arg}"
          self
        end
        
        def output arg
          @builder.append "/Output=#{arg}"
          self
        end
        
        def report_type arg
          @builder.append "/ReportType=#{arg}"
          self
        end
        
        def target_arguments arg
          @builder.append "/TargetArguments=#{arg}"
          self
        end
        
        def target_executable arg
          @builder.append "/TargetExecutable=#{arg}"
          self
        end
        
        def target_working_dir arg
          @builder.append "/TargetWorkingDir=#{arg}"
          self
        end
        
        def temp_dir arg
          @builder.append "/TempDir=#{arg}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Zip
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'zip'
          self
        end
        
        def output arg
          @builder.append "/Output=#{arg}"
          self
        end
        
        def source arg
          @builder.append "/Source=#{arg}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def dotcover
        DotCover.new
      end
      
    end
    
  end
  
  def dotcover11
    DotCover::V11::DotCover.new
  end
  
end

