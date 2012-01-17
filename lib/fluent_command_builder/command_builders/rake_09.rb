require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Rake
    module V09
      class Rake
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'rake'
          self
        end
        
        def classic_namespace 
          @builder.append "--classic-namespace"
          self
        end
        
        def describe pattern
          @builder.append "--describe #{pattern}"
          self
        end
        
        def dry_run 
          @builder.append "--dry-run"
          self
        end
        
        def execute code
          @builder.append "--execute #{code}"
          self
        end
        
        def execute_print code
          @builder.append "--execute-print #{code}"
          self
        end
        
        def execute_continue code
          @builder.append "--execute-continue #{code}"
          self
        end
        
        def libdir lib_dir
          @builder.append "--libdir #{lib_dir}"
          self
        end
        
        def no_search 
          @builder.append "--no-search"
          self
        end
        
        def prereqs 
          @builder.append "--prereqs"
          self
        end
        
        def quiet 
          @builder.append "--quiet"
          self
        end
        
        def rakefile file
          @builder.append "--rakefile #{file}"
          self
        end
        
        def rakelibdir rake_lib_dir
          @builder.append "--rakelibdir #{rake_lib_dir}"
          self
        end
        
        def require _module
          @builder.append "--require #{_module}"
          self
        end
        
        def rules 
          @builder.append "--rules"
          self
        end
        
        def silent 
          @builder.append "--silent"
          self
        end
        
        def no_system 
          @builder.append "--no-system"
          self
        end
        
        def tasks pattern
          @builder.append "--tasks #{pattern}"
          self
        end
        
        def trace 
          @builder.append "--trace"
          self
        end
        
        def verbose 
          @builder.append "--verbose"
          self
        end
        
        def version 
          @builder.append "--version"
          self
        end
        
        def where pattern
          @builder.append "--where #{pattern}"
          self
        end
        
        def no_deprecation_warnings 
          @builder.append "--no-deprecation-warnings"
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
      
      def rake
        Rake.new
      end
      
    end
    
  end
  
  def rake09
    Rake::V09::Rake.new
  end
  
end

