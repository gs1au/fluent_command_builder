require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Cucumber
    module V11
      class Cucumber
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'cucumber'
          self
        end
        
        def require library
          @b.append "--require #{@b.format library}"
          self
        end
        
        def i18n lang
          @b.append "--i18n #{@b.format lang}"
          self
        end
        
        def format format
          @b.append "--format #{@b.format format}"
          self
        end
        
        def out file
          @b.append "--out #{@b.format file}"
          self
        end
        
        def tags tag_expression
          @b.append "--tags #{@b.format tag_expression, ','}"
          self
        end
        
        def name name
          @b.append "--name #{@b.format name}"
          self
        end
        
        def exclude pattern
          @b.append "--exclude #{@b.format pattern}"
          self
        end
        
        def profile profile
          @b.append "--profile #{@b.format profile}"
          self
        end
        
        def no_profile 
          @b.append '--no-profile'
          self
        end
        
        def color 
          @b.append '--color'
          self
        end
        
        def no_color 
          @b.append '--no-color'
          self
        end
        
        def dry_run 
          @b.append '--dry-run'
          self
        end
        
        def autoformat dir
          @b.append "--autoformat #{@b.format dir}"
          self
        end
        
        def no_multiline 
          @b.append '--no-multiline'
          self
        end
        
        def no_source 
          @b.append '--no-source'
          self
        end
        
        def no_snippets 
          @b.append '--no-snippets'
          self
        end
        
        def quiet 
          @b.append '--quiet'
          self
        end
        
        def backtrace 
          @b.append '--backtrace'
          self
        end
        
        def strict 
          @b.append '--strict'
          self
        end
        
        def wip 
          @b.append '--wip'
          self
        end
        
        def verbose 
          @b.append '--verbose'
          self
        end
        
        def guess 
          @b.append '--guess'
          self
        end
        
        def lines lines
          @b.append "--lines #{@b.format lines}"
          self
        end
        
        def expand 
          @b.append '--expand'
          self
        end
        
        def drb 
          @b.append '--drb'
          self
        end
        
        def port port
          @b.append "--port #{@b.format port}"
          self
        end
        
        def dotcucumber dir
          @b.append "--dotcucumber #{@b.format dir}"
          self
        end
        
        def version 
          @b.append '--version'
          self
        end
        
        def help 
          @b.append '--help'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def cucumber
        Cucumber.new
      end
      
    end
    
  end
  
  def cucumber_11
    Cucumber::V11::Cucumber.new
  end
  
end

