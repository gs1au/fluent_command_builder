require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Cucumber
    module V11
      class Cucumber
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'cucumber'
          self
        end
        
        def require library
          @builder.append "--require #{library}"
          self
        end
        
        def i18n lang
          @builder.append "--i18n #{lang}"
          self
        end
        
        def format format
          @builder.append "--format #{format}"
          self
        end
        
        def out file
          @builder.append "--out #{file}"
          self
        end
        
        def tags tag_expression
          @builder.append_format(tag_expression, ',') { |v| "--tags #{v}" }
          self
        end
        
        def name name
          @builder.append "--name #{name}"
          self
        end
        
        def exclude pattern
          @builder.append "--exclude #{pattern}"
          self
        end
        
        def profile profile
          @builder.append "--profile #{profile}"
          self
        end
        
        def no_profile 
          @builder.append "--no-profile"
          self
        end
        
        def color 
          @builder.append "--color"
          self
        end
        
        def no_color 
          @builder.append "--no-color"
          self
        end
        
        def dry_run 
          @builder.append "--dry-run"
          self
        end
        
        def autoformat dir
          @builder.append "--autoformat #{dir}"
          self
        end
        
        def no_multiline 
          @builder.append "--no-multiline"
          self
        end
        
        def no_source 
          @builder.append "--no-source"
          self
        end
        
        def no_snippets 
          @builder.append "--no-snippets"
          self
        end
        
        def quiet 
          @builder.append "--quiet"
          self
        end
        
        def backtrace 
          @builder.append "--backtrace"
          self
        end
        
        def strict 
          @builder.append "--strict"
          self
        end
        
        def wip 
          @builder.append "--wip"
          self
        end
        
        def verbose 
          @builder.append "--verbose"
          self
        end
        
        def guess 
          @builder.append "--guess"
          self
        end
        
        def lines lines
          @builder.append "--lines #{lines}"
          self
        end
        
        def expand 
          @builder.append "--expand"
          self
        end
        
        def drb 
          @builder.append "--drb"
          self
        end
        
        def port port
          @builder.append "--port #{port}"
          self
        end
        
        def dotcucumber dir
          @builder.append "--dotcucumber #{dir}"
          self
        end
        
        def version 
          @builder.append "--version"
          self
        end
        
        def help 
          @builder.append "--help"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def cucumber
        Cucumber.new
      end
      
    end
    
  end
  
  def cucumber11
    Cucumber::V11::Cucumber.new
  end
  
end

